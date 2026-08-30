const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the projects domain.
pub const ProjectsApi = struct {
    transport: *transport.Transport,

    /// GET /v1/projects
    pub fn listProjects(self: *@This(), options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ProjectPageResponse)) {
        const allocator = self.transport.allocator;





        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects",
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
                    types.ProjectPageResponse,
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

    /// GET /v1/projects/${projectId}
    pub fn getProject(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ProjectResponse)) {
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
            .path = "/v1/projects/${projectId}",
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
                    types.ProjectResponse,
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

    /// PATCH /v1/projects/${projectId}
    pub fn updateProject(self: *@This(), projectId: []const u8,
        input: types.UpdateProjectRequest,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ProjectResponse)) {
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
            .method = .PATCH,
            .path = "/v1/projects/${projectId}",
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
                    types.ProjectResponse,
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

    /// GET /v1/projects/${projectId}/emails
    pub fn listEmails(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailPageResponse)) {
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
            .path = "/v1/projects/${projectId}/emails",
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
                    types.EmailPageResponse,
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

    /// GET /v1/projects/${projectId}/emails/${emailId}
    pub fn getProjectEmail(self: *@This(), projectId: []const u8,
        emailId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailDetailResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, emailId);
        path_values[path_count] = .{ .name = "emailId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/emails/${emailId}",
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

    /// GET /v1/projects/${projectId}/emails/${emailId}/events
    pub fn getEmailTimeline(self: *@This(), projectId: []const u8,
        emailId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailTimelineResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, emailId);
        path_values[path_count] = .{ .name = "emailId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/emails/${emailId}/events",
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
                    types.EmailTimelineResponse,
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
