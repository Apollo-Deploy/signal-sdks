const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the sendingDomains domain.
pub const SendingDomainsApi = struct {
    transport: *transport.Transport,

    /// GET /v1/projects/${projectId}/domains
    pub fn listDomains(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainListPageResponse)) {
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
            .path = "/v1/projects/${projectId}/domains",
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
                    types.DomainListPageResponse,
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

    /// GET /v1/projects/${projectId}/domains/${domainId}
    pub fn getDomain(self: *@This(), projectId: []const u8,
        domainId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, domainId);
        path_values[path_count] = .{ .name = "domainId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/domains/${domainId}",
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
                    types.DomainResponse,
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

    /// POST /v1/projects/${projectId}/domains
    pub fn registerDomain(self: *@This(), projectId: []const u8,
        input: types.RegisterDomainRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainResponse)) {
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
            .path = "/v1/projects/${projectId}/domains",
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
                    types.DomainResponse,
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

    /// POST /v1/projects/${projectId}/domains/${domainId}/verify
    pub fn verifyDomain(self: *@This(), projectId: []const u8,
        domainId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, domainId);
        path_values[path_count] = .{ .name = "domainId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/domains/${domainId}/verify",
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
                    types.DomainResponse,
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

    /// DELETE /v1/projects/${projectId}/domains/${domainId}
    pub fn deleteDomain(self: *@This(), projectId: []const u8,
        domainId: []const u8,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, domainId);
        path_values[path_count] = .{ .name = "domainId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/projects/${projectId}/domains/${domainId}",
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

    /// POST /v1/projects/${projectId}/domains/${domainId}/bimi/verify
    pub fn verifyBimi(self: *@This(), projectId: []const u8,
        domainId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, domainId);
        path_values[path_count] = .{ .name = "domainId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/domains/${domainId}/bimi/verify",
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
                    types.DomainResponse,
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

    /// PATCH /v1/projects/${projectId}/domains/${domainId}/bimi
    pub fn updateBimi(self: *@This(), projectId: []const u8,
        domainId: []const u8,
        input: types.UpdateBimiRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.DomainResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, domainId);
        path_values[path_count] = .{ .name = "domainId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .PATCH,
            .path = "/v1/projects/${projectId}/domains/${domainId}/bimi",
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
                    types.DomainResponse,
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
