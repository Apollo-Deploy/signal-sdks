const std = @import("std");
const errors = @import("errors.zig");

pub const MAX_RETRIES: u8 = 5;
pub const MAX_RESPONSE_BYTES: usize = 16777216;
pub const MAX_REQUEST_BYTES: usize = 16777216;
pub const MAX_URL_BYTES: usize = 64 * 1024;
pub const MAX_HEADER_BYTES: usize = 64 * 1024;
pub const MAX_RETRY_DELAY_MS: u64 = 30000;

const retryable_statuses = [_]u16{ 408, 425, 429, 500, 502, 503, 504 };
const hex = "0123456789ABCDEF";

pub const Header = struct {
    name: []const u8,
    value: []const u8,
};

pub const PathParam = struct {
    name: []const u8,
    value: []const u8,
};

pub const QueryParam = struct {
    name: []const u8,
    value: []const u8,
};

pub const CookieParam = struct {
    name: []const u8,
    value: []const u8,
};

pub const RequestOptions = struct {
    timeout_ms: ?u64 = null,
    max_retries: ?u8 = null,
    retry_unsafe_requests: bool = false,
    idempotency_key: ?[]const u8 = null,
};

pub const TransportConfig = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    base_url: []const u8,
    timeout_ms: u64 = 15_000,
    max_retries: u8 = 3,
    retry_unsafe_requests: bool = false,
    max_request_bytes: usize = MAX_REQUEST_BYTES,
    max_response_bytes: usize = MAX_RESPONSE_BYTES,
    default_headers: []const Header = &.{},
    user_agent: []const u8 = "apollo_signal-zig-sdk/1.0.4",
};

pub const Request = struct {
    method: std.http.Method,
    path: []const u8,
    path_params: []const PathParam = &.{},
    query: []const QueryParam = &.{},
    headers: []const Header = &.{},
    cookies: []const CookieParam = &.{},
    body: ?[]const u8 = null,
    accept: []const u8 = "application/json",
    content_type: ?[]const u8 = null,
    options: RequestOptions = .{},
    operation_timeout_ms: ?u64 = null,
    stream_response: bool = false,
};

pub const OwnedResponse = struct {
    allocator: std.mem.Allocator,
    status: u16,
    body: []u8,
    request_id: ?[]u8,
    retry_after_ms: ?u64,
    stream_request: ?*std.http.Client.Request = null,
    stream_reader: ?*std.Io.Reader = null,
    stream_buffer: ?[]u8 = null,
    max_event_bytes: usize = 0,

    pub fn deinit(self: *@This()) void {
        if (self.stream_request) |request| {
            request.deinit();
            self.allocator.destroy(request);
            if (self.stream_buffer) |buffer| self.allocator.free(buffer);
        } else {
            self.allocator.free(self.body);
        }
        if (self.request_id) |value| self.allocator.free(value);
        self.* = undefined;
    }
};

pub fn Result(comptime T: type) type {
    return union(enum) {
        success: T,
        api_error: errors.ErrorMetadata,

        pub fn deinit(self: *@This()) void {
            switch (self.*) {
                .success => |*value| {
                    if (comptime @hasDecl(T, "deinit")) value.deinit();
                },
                .api_error => |*value| value.deinit(),
            }
            self.* = undefined;
        }
    };
}

pub fn SseStream(comptime T: type) type {
    return struct {
        allocator: std.mem.Allocator,
        request: *std.http.Client.Request,
        reader: *std.Io.Reader,
        transfer_buffer: []u8,
        max_event_bytes: usize,

        pub const Event = struct {
            allocator: std.mem.Allocator,
            data: std.json.Parsed(T),
            event: ?[]u8,
            id: ?[]u8,

            pub fn deinit(self: *@This()) void {
                self.data.deinit();
                if (self.event) |value| self.allocator.free(value);
                if (self.id) |value| self.allocator.free(value);
                self.* = undefined;
            }
        };

        pub fn next(self: *@This()) !?Event {
            var data = std.Io.Writer.Allocating.init(self.allocator);
            defer data.deinit();
            var event_name: ?[]u8 = null;
            errdefer if (event_name) |value| self.allocator.free(value);
            var event_id: ?[]u8 = null;
            errdefer if (event_id) |value| self.allocator.free(value);

            while (try self.readLine()) |owned_line| {
                defer self.allocator.free(owned_line);
                var line: []const u8 = owned_line;
                if (line.len > 0 and line[line.len - 1] == '\r') line = line[0 .. line.len - 1];

                if (line.len == 0) {
                    if (data.written().len == 0) continue;
                    return try self.finishEvent(&data, event_name, event_id);
                }
                if (line[0] == ':') continue;
                if (std.mem.startsWith(u8, line, "data:")) {
                    if (data.written().len > 0) try data.writer.writeByte('\n');
                    var value = line[5..];
                    if (value.len > 0 and value[0] == ' ') value = value[1..];
                    try self.appendEventData(&data, value);
                } else if (std.mem.startsWith(u8, line, "event:")) {
                    var value = line[6..];
                    if (value.len > 0 and value[0] == ' ') value = value[1..];
                    if (event_name) |previous| self.allocator.free(previous);
                    event_name = try self.allocator.dupe(u8, value);
                } else if (std.mem.startsWith(u8, line, "id:")) {
                    var value = line[3..];
                    if (value.len > 0 and value[0] == ' ') value = value[1..];
                    if (event_id) |previous| self.allocator.free(previous);
                    event_id = try self.allocator.dupe(u8, value);
                }
            }

            if (data.written().len == 0) return null;
            return try self.finishEvent(&data, event_name, event_id);
        }

        fn finishEvent(
            self: *@This(),
            data: *std.Io.Writer.Allocating,
            event_name: ?[]u8,
            event_id: ?[]u8,
        ) !Event {
            const raw = try data.toOwnedSlice();
            defer self.allocator.free(raw);
            const parsed = std.json.parseFromSlice(
                T,
                self.allocator,
                raw,
                .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
            ) catch return error.DeserializationError;
            return .{
                .allocator = self.allocator,
                .data = parsed,
                .event = event_name,
                .id = event_id,
            };
        }

        fn readLine(self: *@This()) !?[]u8 {
            var line = std.Io.Writer.Allocating.init(self.allocator);
            defer line.deinit();
            while (true) {
                const byte = self.reader.takeByte() catch |err| switch (err) {
                    error.EndOfStream => {
                        if (line.written().len == 0) return null;
                        return try line.toOwnedSlice();
                    },
                    error.ReadFailed => return error.RequestFailed,
                };
                if (byte == '\n') return try line.toOwnedSlice();
                if (line.written().len >= self.max_event_bytes) return error.ResponseTooLarge;
                try line.writer.writeByte(byte);
            }
        }

        fn appendEventData(
            self: *@This(),
            data: *std.Io.Writer.Allocating,
            value: []const u8,
        ) !void {
            const current = data.written().len;
            const separator: usize = if (current > 0) 1 else 0;
            if (current > self.max_event_bytes or
                separator > self.max_event_bytes - current or
                value.len > self.max_event_bytes - current - separator)
            {
                return error.ResponseTooLarge;
            }
            if (separator == 1) try data.writer.writeByte('\n');
            try data.writer.writeAll(value);
        }

        pub fn deinit(self: *@This()) void {
            self.request.deinit();
            self.allocator.destroy(self.request);
            self.allocator.free(self.transfer_buffer);
            self.* = undefined;
        }
    };
}

pub fn intoSseStream(comptime T: type, response: *OwnedResponse) !SseStream(T) {
    const request = response.stream_request orelse {
        response.deinit();
        return error.InvalidRequest;
    };
    const reader = response.stream_reader orelse {
        response.deinit();
        return error.InvalidRequest;
    };
    const transfer_buffer = response.stream_buffer orelse {
        response.deinit();
        return error.InvalidRequest;
    };
    const stream = SseStream(T){
        .allocator = response.allocator,
        .request = request,
        .reader = reader,
        .transfer_buffer = transfer_buffer,
        .max_event_bytes = response.max_event_bytes,
    };
    if (response.request_id) |value| response.allocator.free(value);
    response.body = &.{};
    response.request_id = null;
    response.stream_request = null;
    response.stream_reader = null;
    response.stream_buffer = null;
    return stream;
}

pub const Transport = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    http: std.http.Client,
    config: TransportConfig,

    pub fn init(config: TransportConfig) @This() {
        var normalized = config;
        normalized.max_retries = @min(normalized.max_retries, MAX_RETRIES);
        normalized.max_request_bytes = @min(
            @max(normalized.max_request_bytes, @as(usize, 1)),
            MAX_REQUEST_BYTES,
        );
        normalized.max_response_bytes = @min(
            @max(normalized.max_response_bytes, @as(usize, 1)),
            MAX_RESPONSE_BYTES,
        );
        if (normalized.timeout_ms == 0) normalized.timeout_ms = 1;
        return .{
            .allocator = config.allocator,
            .io = config.io,
            .http = .{ .allocator = config.allocator, .io = config.io },
            .config = normalized,
        };
    }

    pub fn deinit(self: *@This()) void {
        self.http.deinit();
        self.* = undefined;
    }

    pub fn formatValue(allocator: std.mem.Allocator, value: anytype) ![]u8 {
        const json = std.json.Stringify.valueAlloc(allocator, value, .{}) catch return error.SerializationError;
        errdefer allocator.free(json);
        if (json.len >= 2 and json[0] == '"' and json[json.len - 1] == '"') {
            var parsed = std.json.parseFromSlice([]const u8, allocator, json, .{ .allocate = .alloc_always }) catch return error.SerializationError;
            defer parsed.deinit();
            const raw = allocator.dupe(u8, parsed.value) catch return error.SerializationError;
            allocator.free(json);
            return raw;
        }
        return json;
    }

    pub fn execute(self: *@This(), request: Request) !Result(OwnedResponse) {
        const retries = @min(
            request.options.max_retries orelse self.config.max_retries,
            MAX_RETRIES,
        );
        const timeout_ms = request.options.timeout_ms orelse
            request.operation_timeout_ms orelse self.config.timeout_ms;
        const started = std.Io.Clock.awake.now(self.io);
        const can_retry = self.canRetry(request);
        var attempt: u8 = 0;

        while (true) {
            if (elapsedMs(started, self.io) >= timeout_ms) return error.Timeout;
            var result = self.executeOnce(request) catch |err| {
                if (can_retry and attempt < retries and isRetryableError(err)) {
                    attempt += 1;
                    try self.waitBeforeRetry(started, timeout_ms, attempt, null);
                    continue;
                }
                return err;
            };

            const status = switch (result) {
                .success => |response| response.status,
                .api_error => |metadata| metadata.status,
            };
            if (can_retry and attempt < retries and isRetryableStatus(status)) {
                const retry_after_ms = switch (result) {
                    .success => |response| response.retry_after_ms,
                    .api_error => |metadata| metadata.retry_after_ms,
                };
                result.deinit();
                attempt += 1;
                try self.waitBeforeRetry(started, timeout_ms, attempt, retry_after_ms);
                continue;
            }
            if (elapsedMs(started, self.io) >= timeout_ms) {
                result.deinit();
                return error.Timeout;
            }
            return result;
        }
    }

    fn executeOnce(self: *@This(), request: Request) !Result(OwnedResponse) {
        if (request.body) |body| {
            if (body.len > self.config.max_request_bytes) return error.InvalidRequest;
        }

        var query = std.ArrayList(QueryParam).empty;
        defer query.deinit(self.allocator);
        for (request.query) |parameter| try appendQueryParam(&query, self.allocator, parameter);

        var headers = std.ArrayList(std.http.Header).empty;
        defer headers.deinit(self.allocator);
        var claimed_security_headers = std.ArrayList([]const u8).empty;
        defer claimed_security_headers.deinit(self.allocator);
        for (self.config.default_headers) |header| try appendHeader(&headers, self.allocator, header);
        for (request.headers) |header| try appendHeader(&headers, self.allocator, header);
        if (request.options.idempotency_key) |value| {
            try appendHeader(&headers, self.allocator, .{ .name = "Idempotency-Key", .value = value });
        }

        var cookies = std.ArrayList(CookieParam).empty;
        defer cookies.deinit(self.allocator);
        for (request.cookies) |cookie| try appendCookieParam(&cookies, self.allocator, cookie);
        if (cookies.items.len > 0) {
            var cookie_writer = std.Io.Writer.Allocating.init(self.allocator);
            defer cookie_writer.deinit();
            for (cookies.items, 0..) |cookie, index| {
                if (index > 0) try cookie_writer.writer.writeAll("; ");
                try appendEncoded(&cookie_writer.writer, cookie.name);
                try cookie_writer.writer.writeByte('=');
                try appendEncoded(&cookie_writer.writer, cookie.value);
            }
            const cookie_value = try cookie_writer.toOwnedSlice();
            defer self.allocator.free(cookie_value);
            try appendHeader(&headers, self.allocator, .{ .name = "Cookie", .value = cookie_value });
        }

        const url = try self.buildUrl(request.path, request.path_params, query.items);
        defer self.allocator.free(url);
        const uri = std.Uri.parse(url) catch return error.InvalidUrl;
        const wire_request = self.allocator.create(std.http.Client.Request) catch return error.RequestFailed;
        wire_request.* = self.http.request(request.method, uri, .{
            .redirect_behavior = .not_allowed,
            .headers = .{
                .accept = .{ .override = request.accept },
                .user_agent = .{ .override = self.config.user_agent },
                .content_type = if (request.body != null)
                    .{ .override = request.content_type orelse "application/json" }
                else
                    .default,
            },
            .extra_headers = headers.items,
        }) catch {
            self.allocator.destroy(wire_request);
            return error.RequestFailed;
        };
        var release_wire_request = true;
        defer if (release_wire_request) {
            wire_request.deinit();
            self.allocator.destroy(wire_request);
        };

        if (request.body) |body| {
            wire_request.sendBodyComplete(@constCast(body)) catch return error.RequestFailed;
        } else if (request.method.requestHasBody()) {
            wire_request.sendBodyComplete(@constCast(&[_]u8{})) catch return error.RequestFailed;
        } else {
            wire_request.sendBodiless() catch return error.RequestFailed;
        }

        var response = wire_request.receiveHead(&.{}) catch return error.RequestFailed;
        const status = @intFromEnum(response.head.status);
        var request_id = try copyHeader(self.allocator, response.head, "x-request-id");
        errdefer if (request_id) |value| self.allocator.free(value);
        if (request_id == null) request_id = try copyHeader(self.allocator, response.head, "request-id");
        const retry_after_ms = parseRetryAfter(response.head);

        if (status >= 200 and status < 300 and request.stream_response) {
            const transfer_buffer = self.allocator.alloc(u8, 8 * 1024) catch return error.RequestFailed;
            errdefer self.allocator.free(transfer_buffer);
            const body_reader = response.reader(transfer_buffer);
            wire_request.uri = undefined;
            wire_request.extra_headers = &.{};
            wire_request.privileged_headers = &.{};
            release_wire_request = false;
            return .{ .success = .{
                .allocator = self.allocator,
                .status = status,
                .body = &.{},
                .request_id = request_id,
                .retry_after_ms = retry_after_ms,
                .stream_request = wire_request,
                .stream_reader = body_reader,
                .stream_buffer = transfer_buffer,
                .max_event_bytes = self.config.max_response_bytes,
            } };
        }

        var body_reader = response.reader(&.{});
        const body = body_reader.allocRemaining(
            self.allocator,
            .limited(self.config.max_response_bytes),
        ) catch |err| switch (err) {
            error.StreamTooLong => return error.ResponseTooLarge,
            else => return error.RequestFailed,
        };

        if (status < 200 or status >= 300) {
            return .{ .api_error = errors.ErrorMetadata.fromHttpResponse(
                self.allocator,
                status,
                body,
                request_id,
                retry_after_ms,
            ) catch return error.RequestFailed };
        }
        return .{ .success = .{
            .allocator = self.allocator,
            .status = status,
            .body = body,
            .request_id = request_id,
            .retry_after_ms = retry_after_ms,
        } };
    }

    fn buildUrl(
        self: *@This(),
        path: []const u8,
        path_params: []const PathParam,
        query: []const QueryParam,
    ) ![]u8 {
        if (std.mem.indexOfAny(u8, path, "?#") != null) return error.InvalidRequest;
        if (self.config.base_url.len + path.len > MAX_URL_BYTES) return error.InvalidRequest;
        const fragment_index = std.mem.indexOfScalar(u8, self.config.base_url, '#');
        const base_without_fragment = self.config.base_url[0 .. fragment_index orelse self.config.base_url.len];
        const query_index = std.mem.indexOfScalar(u8, base_without_fragment, '?');
        const base_path = base_without_fragment[0 .. query_index orelse base_without_fragment.len];
        const base_query: ?[]const u8 = if (query_index) |index| base_without_fragment[index + 1 ..] else null;

        var writer = std.Io.Writer.Allocating.init(self.allocator);
        defer writer.deinit();
        try writer.writer.writeAll(base_path);
        if (base_path.len > 0 and base_path[base_path.len - 1] == '/' and path.len > 0 and path[0] == '/') {
            _ = writer.writer.undo(1);
        } else if ((base_path.len == 0 or base_path[base_path.len - 1] != '/') and path.len > 0 and path[0] != '/') {
            try writer.writer.writeByte('/');
        }
        try appendPath(&writer.writer, path, path_params);

        var has_query = false;
        if (base_query) |raw_query| {
            var pairs = std.mem.splitScalar(u8, raw_query, '&');
            while (pairs.next()) |pair| {
                if (pair.len == 0) continue;
                const separator = std.mem.indexOfScalar(u8, pair, '=') orelse pair.len;
                const raw_name = pair[0..separator];
                var overridden = false;
                for (query) |parameter| {
                    if (decodedQueryNameEquals(raw_name, parameter.name)) {
                        overridden = true;
                        break;
                    }
                }
                if (overridden) continue;
                try writer.writer.writeByte(if (has_query) '&' else '?');
                try writer.writer.writeAll(pair);
                has_query = true;
            }
        }
        for (query) |parameter| {
            try writer.writer.writeByte(if (has_query) '&' else '?');
            try appendEncoded(&writer.writer, parameter.name);
            try writer.writer.writeByte('=');
            try appendEncoded(&writer.writer, parameter.value);
            has_query = true;
        }
        const url = try writer.toOwnedSlice();
        if (url.len > MAX_URL_BYTES) {
            self.allocator.free(url);
            return error.InvalidRequest;
        }
        return url;
    }

    fn canRetry(self: *@This(), request: Request) bool {
        if (request.options.retry_unsafe_requests or self.config.retry_unsafe_requests) return true;
        if (request.method.safe() or request.method.idempotent()) return true;
        if (request.options.idempotency_key) |value| if (value.len > 0) return true;
        for (self.config.default_headers) |header| {
            if ((std.ascii.eqlIgnoreCase(header.name, "Idempotency-Key") or
                std.ascii.eqlIgnoreCase(header.name, "X-Idempotency-Key")) and header.value.len > 0) return true;
        }
        for (request.headers) |header| {
            if ((std.ascii.eqlIgnoreCase(header.name, "Idempotency-Key") or
                std.ascii.eqlIgnoreCase(header.name, "X-Idempotency-Key")) and header.value.len > 0) return true;
        }
        return false;
    }

    fn waitBeforeRetry(
        self: *@This(),
        started: std.Io.Clock.Timestamp,
        timeout_ms: u64,
        attempt: u8,
        retry_after_ms: ?u64,
    ) !void {
        const exponential = @min(
            MAX_RETRY_DELAY_MS,
            @as(u64, 400) * (@as(u64, 1) << @min(attempt - 1, @as(u8, 6))),
        );
        const delay = @min(retry_after_ms orelse exponential, MAX_RETRY_DELAY_MS);
        const elapsed = elapsedMs(started, self.io);
        if (elapsed >= timeout_ms or delay > timeout_ms - elapsed) return error.Timeout;
        if (delay == 0) return;
        const duration = std.Io.Clock.Duration{
            .raw = std.Io.Duration.fromMilliseconds(@intCast(delay)),
            .clock = .awake,
        };
        duration.sleep(self.io) catch return error.Timeout;
    }
};

fn appendHeader(
    headers: *std.ArrayList(std.http.Header),
    allocator: std.mem.Allocator,
    header: Header,
) !void {
    if (header.name.len == 0 or header.name.len + header.value.len > MAX_HEADER_BYTES) return error.InvalidRequest;
    if (std.mem.indexOfScalar(u8, header.name, '\r') != null or
        std.mem.indexOfScalar(u8, header.name, '\n') != null or
        std.mem.indexOfScalar(u8, header.value, '\r') != null or
        std.mem.indexOfScalar(u8, header.value, '\n') != null) return error.InvalidRequest;
    for (headers.items) |*existing| {
        if (std.ascii.eqlIgnoreCase(existing.name, header.name)) {
            existing.* = .{ .name = header.name, .value = header.value };
            return;
        }
    }
    try headers.append(allocator, .{ .name = header.name, .value = header.value });
}

fn appendSecurityHeader(
    headers: *std.ArrayList(std.http.Header),
    claimed_headers: *std.ArrayList([]const u8),
    allocator: std.mem.Allocator,
    header: Header,
) !void {
    for (claimed_headers.items) |name| {
        if (std.ascii.eqlIgnoreCase(name, header.name)) {
            return error.ConflictingSecuritySchemes;
        }
    }
    try claimed_headers.append(allocator, header.name);
    try appendHeader(headers, allocator, header);
}

fn appendQueryParam(
    query: *std.ArrayList(QueryParam),
    allocator: std.mem.Allocator,
    parameter: QueryParam,
) !void {
    try query.append(allocator, parameter);
}

fn setQueryParam(
    query: *std.ArrayList(QueryParam),
    allocator: std.mem.Allocator,
    parameter: QueryParam,
) !void {
    var index: usize = 0;
    while (index < query.items.len) {
        if (std.mem.eql(u8, query.items[index].name, parameter.name)) {
            _ = query.orderedRemove(index);
        } else {
            index += 1;
        }
    }
    try appendQueryParam(query, allocator, parameter);
}

fn appendCookieParam(
    cookies: *std.ArrayList(CookieParam),
    allocator: std.mem.Allocator,
    cookie: CookieParam,
) !void {
    for (cookies.items) |*existing| {
        if (std.mem.eql(u8, existing.name, cookie.name)) {
            existing.* = cookie;
            return;
        }
    }
    try cookies.append(allocator, cookie);
}

fn appendPath(writer: *std.Io.Writer, path: []const u8, params: []const PathParam) !void {
    var cursor: usize = 0;
    while (cursor < path.len) {
        if (path[cursor] == '$' and cursor + 1 < path.len and path[cursor + 1] == '{') {
            const end = std.mem.indexOfScalarPos(u8, path, cursor + 2, '}') orelse return error.InvalidRequest;
            const name = path[cursor + 2 .. end];
            try appendPathValue(writer, name, params);
            cursor = end + 1;
        } else if (path[cursor] == '{') {
            const end = std.mem.indexOfScalarPos(u8, path, cursor + 1, '}') orelse return error.InvalidRequest;
            const name = path[cursor + 1 .. end];
            try appendPathValue(writer, name, params);
            cursor = end + 1;
        } else if (path[cursor] == ':' and (cursor == 0 or path[cursor - 1] == '/')) {
            var end = cursor + 1;
            while (end < path.len and path[end] != '/') end += 1;
            try appendPathValue(writer, path[cursor + 1 .. end], params);
            cursor = end;
        } else {
            try writer.writeByte(path[cursor]);
            cursor += 1;
        }
    }
}

fn appendPathValue(writer: *std.Io.Writer, name: []const u8, params: []const PathParam) !void {
    for (params) |parameter| {
        if (std.mem.eql(u8, parameter.name, name)) {
            try appendEncoded(writer, parameter.value);
            return;
        }
    }
    return error.InvalidRequest;
}

fn appendEncoded(writer: *std.Io.Writer, value: []const u8) !void {
    for (value) |byte| {
        const safe = (byte >= 'a' and byte <= 'z') or
            (byte >= 'A' and byte <= 'Z') or
            (byte >= '0' and byte <= '9') or
            byte == '-' or byte == '_' or byte == '.' or byte == '~';
        if (safe) {
            try writer.writeByte(byte);
        } else {
            try writer.writeByte('%');
            try writer.writeByte(hex[byte >> 4]);
            try writer.writeByte(hex[byte & 0x0f]);
        }
    }
}

fn decodedQueryNameEquals(raw: []const u8, expected: []const u8) bool {
    var raw_index: usize = 0;
    var expected_index: usize = 0;
    while (raw_index < raw.len) {
        var byte = raw[raw_index];
        if (byte == '%' and raw_index + 2 < raw.len) {
            const high = hexValue(raw[raw_index + 1]);
            const low = hexValue(raw[raw_index + 2]);
            if (high != null and low != null) {
                byte = (high.? << 4) | low.?;
                raw_index += 3;
            } else {
                raw_index += 1;
            }
        } else {
            if (byte == '+') byte = ' ';
            raw_index += 1;
        }
        if (expected_index >= expected.len or expected[expected_index] != byte) return false;
        expected_index += 1;
    }
    return expected_index == expected.len;
}

fn hexValue(byte: u8) ?u8 {
    return switch (byte) {
        '0'...'9' => byte - '0',
        'a'...'f' => byte - 'a' + 10,
        'A'...'F' => byte - 'A' + 10,
        else => null,
    };
}

fn copyHeader(
    allocator: std.mem.Allocator,
    head: std.http.Client.Response.Head,
    name: []const u8,
) !?[]u8 {
    var iterator = head.iterateHeaders();
    while (iterator.next()) |header| {
        if (std.ascii.eqlIgnoreCase(header.name, name)) return try allocator.dupe(u8, header.value);
    }
    return null;
}

fn parseRetryAfter(head: std.http.Client.Response.Head) ?u64 {
    var iterator = head.iterateHeaders();
    while (iterator.next()) |header| {
        if (!std.ascii.eqlIgnoreCase(header.name, "Retry-After")) continue;
        const seconds = std.fmt.parseInt(u64, header.value, 10) catch return null;
        if (seconds > MAX_RETRY_DELAY_MS / 1000) return MAX_RETRY_DELAY_MS;
        return seconds * 1000;
    }
    return null;
}

fn isRetryableStatus(status: u16) bool {
    for (retryable_statuses) |candidate| if (candidate == status) return true;
    return false;
}

fn isRetryableError(err: anyerror) bool {
    return !std.mem.eql(u8, @errorName(err), "InvalidUrl") and
        !std.mem.eql(u8, @errorName(err), "InvalidRequest") and
        !std.mem.eql(u8, @errorName(err), "ResponseTooLarge") and
        !std.mem.eql(u8, @errorName(err), "Timeout") and
        !std.mem.eql(u8, @errorName(err), "SerializationError") and
        !std.mem.eql(u8, @errorName(err), "DeserializationError");
}

fn elapsedMs(started: std.Io.Clock.Timestamp, io: std.Io) u64 {
    const elapsed = started.durationFromNow(io).raw.toMilliseconds();
    if (elapsed <= 0) return 0;
    return @intCast(elapsed);
}
