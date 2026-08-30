const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the contacts domain.
pub const ContactsApi = struct {
    transport: *transport.Transport,

    /// GET /v1/projects/${projectId}/contacts
    pub fn listContacts(self: *@This(), projectId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactPageResponse)) {
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
            .path = "/v1/projects/${projectId}/contacts",
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
                    types.ContactPageResponse,
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

    /// GET /v1/projects/${projectId}/contacts/${contactId}
    pub fn getContact(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}",
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
                    types.ContactResponse,
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

    /// GET /v1/projects/${projectId}/contacts/${contactId}/segments
    pub fn listContactSegments(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ListContactSegmentsResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/segments",
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
                    types.ListContactSegmentsResponse,
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

    /// GET /v1/projects/${projectId}/contacts/${contactId}/topics
    pub fn getContactTopics(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.GetContactTopicsResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/topics",
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
                    types.GetContactTopicsResponse,
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

    /// POST /v1/projects/${projectId}/contacts
    pub fn createContact(self: *@This(), projectId: []const u8,
        input: types.CreateContactBody,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactResponse)) {
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
            .path = "/v1/projects/${projectId}/contacts",
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
                    types.ContactResponse,
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

    /// PATCH /v1/projects/${projectId}/contacts/${contactId}
    pub fn updateContact(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        input: types.UpdateContactBody,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .PATCH,
            .path = "/v1/projects/${projectId}/contacts/${contactId}",
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
                    types.ContactResponse,
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

    /// DELETE /v1/projects/${projectId}/contacts/${contactId}
    pub fn deleteContact(self: *@This(), projectId: []const u8,
        contactId: []const u8,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/projects/${projectId}/contacts/${contactId}",
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

    /// POST /v1/projects/${projectId}/contacts/${contactId}/image
    pub fn uploadContactImage(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/image",
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
                    types.ContactResponse,
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

    /// PUT /v1/projects/${projectId}/contacts/${contactId}/image
    pub fn setContactImageUrl(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        input: types.SetImageUrlBody,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ContactResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .PUT,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/image",
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
                    types.ContactResponse,
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

    /// DELETE /v1/projects/${projectId}/contacts/${contactId}/image
    pub fn deleteContactImage(self: *@This(), projectId: []const u8,
        contactId: []const u8,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/image",
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

    /// POST /v1/projects/${projectId}/contacts/${contactId}/segments
    pub fn addContactToSegment(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        input: types.AddToSegmentBody,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/segments",
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
                response.deinit();
                return .{ .success = {} };
            },
        }
    }

    /// DELETE /v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}
    pub fn removeContactFromSegment(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        segmentId: []const u8,
        options: transport.RequestOptions) !transport.Result(void) {
        const allocator = self.transport.allocator;

        var path_values: [3]transport.PathParam = undefined;
        var path_allocations: [3][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, projectId);
        path_values[path_count] = .{ .name = "projectId", .value = path_allocations[path_count] };
        path_count += 1;
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, segmentId);
        path_values[path_count] = .{ .name = "segmentId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .DELETE,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}",
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

    /// PATCH /v1/projects/${projectId}/contacts/${contactId}/topics
    pub fn updateContactTopics(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        input: types.UpdateTopicsBody,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .PATCH,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/topics",
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
                response.deinit();
                return .{ .success = {} };
            },
        }
    }

    /// GET /v1/projects/${projectId}/contacts/${contactId}/activity
    pub fn getContactActivity(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.GetContactActivityResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/activity",
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
                    types.GetContactActivityResponse,
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

    /// GET /v1/projects/${projectId}/contacts/${contactId}/engagement
    pub fn getContactEngagementScore(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EngagementScoreResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/engagement",
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
                    types.EngagementScoreResponse,
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

    /// GET /v1/projects/${projectId}/contacts/${contactId}/email-validation
    pub fn getContactEmailValidationStatus(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailValidationStatusResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation",
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
                    types.EmailValidationStatusResponse,
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

    /// POST /v1/projects/${projectId}/contacts/${contactId}/engagement/refresh
    pub fn refreshContactEngagementScore(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EngagementScoreResponse)) {
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh",
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
                    types.EngagementScoreResponse,
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

    /// POST /v1/projects/${projectId}/contacts/${contactId}/email-validation
    pub fn recordContactEmailValidation(self: *@This(), projectId: []const u8,
        contactId: []const u8,
        input: types.RecordValidationBody,
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
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, contactId);
        path_values[path_count] = .{ .name = "contactId", .value = path_allocations[path_count] };
        path_count += 1;




        var body_json: ?[]u8 = null;
        defer if (body_json) |value| allocator.free(value);
        body_json = std.json.Stringify.valueAlloc(allocator, input, .{}) catch return error.SerializationError;

        var execution = try self.transport.execute(.{
            .method = .POST,
            .path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation",
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
                response.deinit();
                return .{ .success = {} };
            },
        }
    }

};
