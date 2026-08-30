const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the emails domain.
pub const EmailsApi = struct {
    transport: *transport.Transport,

    /// POST /v1/emails
    pub fn sendEmail(self: *@This(), input: types.SendEmailRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.SendEmailResponse)) {
        const allocator = self.transport.allocator;





        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/emails",
            .path_params = &.{},
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = "application/json",
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.SendEmailResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// GET /v1/emails/${emailId}
    pub fn getEmail(self: *@This(), emailId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailDetailResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, emailId);
        path_values[path_count] = .{ .name = "emailId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/emails/${emailId}",
            .path_params = path_values[0..path_count],
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = null,
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.EmailDetailResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// POST /v1/emails/batch
    pub fn batchSendEmails(self: *@This(), input: types.BatchSendRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.BatchSendResponse)) {
        const allocator = self.transport.allocator;





        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/emails/batch",
            .path_params = &.{},
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = "application/json",
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.BatchSendResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// DELETE /v1/emails/${emailId}
    pub fn cancelEmail(self: *@This(), emailId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.CancelResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, emailId);
        path_values[path_count] = .{ .name = "emailId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/emails/${emailId}",
            .path_params = path_values[0..path_count],
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = null,
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.CancelResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// DELETE /v1/emails
    pub fn bulkCancelEmails(self: *@This(), options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.BulkCancelResponse)) {
        const allocator = self.transport.allocator;





        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/emails",
            .path_params = &.{},
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = null,
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.BulkCancelResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// POST /v1/emails/${projectId}/stream/token
    pub fn issueStreamToken(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.StreamTokenResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, projectId);
        path_values[path_count] = .{ .name = "projectId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/emails/${projectId}/stream/token",
            .path_params = path_values[0..path_count],
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = null,
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.StreamTokenResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

    /// GET /v1/emails/stream
    pub fn streamEmailEvents(self: *@This(), options: transport.RequestOptions) !transport.Result(transport.SseStream(types.StreamEventResponse)) {
        const allocator = self.transport.allocator;
        _ = allocator;





        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/emails/stream",
            .path_params = &.{},
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "text/event-stream",
            .content_type = null,
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = true,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const stream = try transport.intoSseStream(types.StreamEventResponse, response);
                return .{ .success = stream };
            },
        }
    }

    /// POST /v1/emails/validate
    pub fn validateLinks(self: *@This(), input: types.ValidateLinksRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ValidateLinksResponse)) {
        const allocator = self.transport.allocator;





        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/emails/validate",
            .path_params = &.{},
            .query = &.{},
            .headers = &.{},
            .cookies = &.{},
            .body = body_json,
            .accept = "application/json",
            .content_type = "application/json",
            .options = options,
            .operation_timeout_ms = null,
            .stream_response = false,
        });

        switch (execution) {
            .api_error => |metadata| return .{ .api_error = metadata },
            .success => |*response| {
                const parsed = std.json.parseFromSlice(
                    types.ValidateLinksResponse,
                    allocator,
                    response.body,
                    .{ .ignore_unknown_fields = true, .allocate = .alloc_always },
                ) catch {
                    response.deinit();
                    return error.DeserializationError;
                };
                response.deinit();
                return .{ .success = parsed };
            },
        }
    }

};
