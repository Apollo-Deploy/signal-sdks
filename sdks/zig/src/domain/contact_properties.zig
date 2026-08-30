const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the contactProperties domain.
pub const ContactPropertiesApi = struct {
    transport: *transport.Transport,

    /// GET /v1/projects/${projectId}/contact-properties
    pub fn listContactProperties(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactPropertyPageResponse)) {
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
            .method = .GET,
            .path = "/v1/projects/${projectId}/contact-properties",
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
                    types.ContactPropertyPageResponse,
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

    /// GET /v1/projects/${projectId}/contact-properties/${propertyId}
    pub fn getContactProperty(self: *@This(), projectId: []const u8,
        propertyId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactPropertyResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [2]transport.PathParam = undefined;
        var path_allocations: [2][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, projectId);
        path_values[path_count] = .{ .name = "projectId", .value = path_allocations[path_count] };
        path_count += 1;
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, propertyId);
        path_values[path_count] = .{ .name = "propertyId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contact-properties/${propertyId}",
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
                    types.ContactPropertyResponse,
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

    /// POST /v1/projects/${projectId}/contact-properties
    pub fn createContactProperty(self: *@This(), projectId: []const u8,
        input: types.CreateContactPropertyBody,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactPropertyResponse)) {
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




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/contact-properties",
            .path_params = path_values[0..path_count],
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
                    types.ContactPropertyResponse,
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

    /// PATCH /v1/projects/${projectId}/contact-properties/${propertyId}
    pub fn updateContactProperty(self: *@This(), projectId: []const u8,
        propertyId: []const u8,
        input: types.UpdateContactPropertyBody,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactPropertyResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [2]transport.PathParam = undefined;
        var path_allocations: [2][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, projectId);
        path_values[path_count] = .{ .name = "projectId", .value = path_allocations[path_count] };
        path_count += 1;
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, propertyId);
        path_values[path_count] = .{ .name = "propertyId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .PATCH,
            .path = "/v1/projects/${projectId}/contact-properties/${propertyId}",
            .path_params = path_values[0..path_count],
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
                    types.ContactPropertyResponse,
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

    /// DELETE /v1/projects/${projectId}/contact-properties/${propertyId}
    pub fn deleteContactProperty(self: *@This(), projectId: []const u8,
        propertyId: []const u8,
        options: transport.RequestOptions) !transport.Result(void) {
        const allocator = self.transport.allocator;

        var path_values: [2]transport.PathParam = undefined;
        var path_allocations: [2][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, projectId);
        path_values[path_count] = .{ .name = "projectId", .value = path_allocations[path_count] };
        path_count += 1;
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, propertyId);
        path_values[path_count] = .{ .name = "propertyId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/projects/${projectId}/contact-properties/${propertyId}",
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
                response.deinit();
                return .{ .success = {} };
            },
        }
    }

};
