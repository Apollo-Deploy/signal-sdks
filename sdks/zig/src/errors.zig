const std = @import("std");

pub const ErrorKind = enum {
    api,
    invalid_url,
    invalid_request,
    request_failed,
    response_too_large,
    timeout,
    serialization,
    deserialization,
    unexpected_status,
};

/// Structured server or transport metadata. The caller owns an instance and
/// must call `deinit` exactly once.
pub const ErrorMetadata = struct {
    allocator: std.mem.Allocator,
    kind: ErrorKind,
    status: u16,
    code: ?[]u8,
    message: []u8,
    request_id: ?[]u8,
    retry_after_ms: ?u64,
    body: []u8,

    pub fn deinit(self: *@This()) void {
        if (self.code) |value| self.allocator.free(value);
        self.allocator.free(self.message);
        if (self.request_id) |value| self.allocator.free(value);
        self.allocator.free(self.body);
        self.* = undefined;
    }

    pub fn fromHttpResponse(
        allocator: std.mem.Allocator,
        status: u16,
        body: []u8,
        request_id: ?[]u8,
        retry_after_ms: ?u64,
    ) !@This() {
        errdefer allocator.free(body);
        errdefer if (request_id) |value| allocator.free(value);

        var arena = std.heap.ArenaAllocator.init(allocator);
        defer arena.deinit();

        var code_source: ?[]const u8 = null;
        var message_source: ?[]const u8 = null;
        var body_request_id: ?[]const u8 = null;
        if (body.len > 0) {
            if (std.json.parseFromSliceLeaky(
                std.json.Value,
                arena.allocator(),
                body,
                .{},
            )) |value| {
                code_source = objectString(value, "code");
                message_source = objectString(value, "message");
                body_request_id = objectString(value, "request_id");
                if (value == .object) {
                    if (value.object.get("error")) |nested| {
                        if (nested.* == .object) {
                            code_source = code_source orelse objectString(nested.*, "code");
                            message_source = message_source orelse objectString(nested.*, "message");
                        } else if (nested.* == .string) {
                            message_source = message_source orelse nested.string;
                        }
                    }
                }
            } else |_| {}
        }

        const message = try allocator.dupe(
            u8,
            message_source orelse if (body.len > 0) body else "HTTP error",
        );
        errdefer allocator.free(message);

        const code = if (code_source) |value| try allocator.dupe(u8, value) else null;
        errdefer if (code) |value| allocator.free(value);

        var owned_request_id = request_id;
        if (owned_request_id == null) {
            if (body_request_id) |value| {
                owned_request_id = try allocator.dupe(u8, value);
            }
        }

        return .{
            .allocator = allocator,
            .kind = .api,
            .status = status,
            .code = code,
            .message = message,
            .request_id = owned_request_id,
            .retry_after_ms = retry_after_ms,
            .body = body,
        };
    }

    fn objectString(value: std.json.Value, key: []const u8) ?[]const u8 {
        if (value != .object) return null;
        const field = value.object.get(key) orelse return null;
        return if (field.* == .string) field.string else null;
    }
};

/// Transport failures are returned as Zig errors. HTTP failures retain their
/// status and metadata in `transport.Result(T).api_error`.
pub const SdkError = error{
    InvalidUrl,
    InvalidRequest,
    RequestFailed,
    ResponseTooLarge,
    Timeout,
    SerializationError,
    DeserializationError,
    UnexpectedStatus,
};

