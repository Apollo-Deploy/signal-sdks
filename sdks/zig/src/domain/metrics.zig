const std = @import("std");
const transport = @import("../transport.zig");
const types = @import("../types.zig");

/// Operations for the metrics domain.
pub const MetricsApi = struct {
    transport: *transport.Transport,

    /// GET /v1/metrics/topics/${id}
    pub fn getTopicPerformance(self: *@This(), id: []const u8,
        query: types.GetTopicPerformanceQuery,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.TopicPerformanceResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, id);
        path_values[path_count] = .{ .name = "id", .value = path_allocations[path_count] };
        path_count += 1;

        var query_values = std.ArrayList(transport.QueryParam).empty;
        defer query_values.deinit(allocator);
        var query_allocations = std.ArrayList([]u8).empty;
        defer {
            for (query_allocations.items) |value| allocator.free(value);
            query_allocations.deinit(allocator);
        }
        if (query.window) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "window", .value = formatted });
        }
        if (query.projectId) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "projectId", .value = formatted });
        }



        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/topics/${id}",
            .path_params = path_values[0..path_count],
            .query = query_values.items,
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
                    types.TopicPerformanceResponse,
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

    /// GET /v1/metrics/emails/${id}
    pub fn getEmailPerformance(self: *@This(), id: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailPerformanceResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, id);
        path_values[path_count] = .{ .name = "id", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/emails/${id}",
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
                    types.EmailPerformanceResponse,
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

    /// GET /v1/metrics/emails/${id}/engagement
    pub fn getEmailEngagement(self: *@This(), id: []const u8,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.EmailReadScrollAnalyticsResponse)) {
        const allocator = self.transport.allocator;

        var path_values: [1]transport.PathParam = undefined;
        var path_allocations: [1][]u8 = undefined;
        var path_count: usize = 0;
        defer {
            for (path_allocations[0..path_count]) |value| allocator.free(value);
        }
        path_allocations[path_count] = try transport.Transport.formatValue(allocator, id);
        path_values[path_count] = .{ .name = "id", .value = path_allocations[path_count] };
        path_count += 1;




        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/emails/${id}/engagement",
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
                    types.EmailReadScrollAnalyticsResponse,
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

    /// GET /v1/metrics/summary
    pub fn getProjectMetricsSummary(self: *@This(), query: types.GetProjectMetricsSummaryQuery,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ProjectMetricsSummaryResponse)) {
        const allocator = self.transport.allocator;


        var query_values = std.ArrayList(transport.QueryParam).empty;
        defer query_values.deinit(allocator);
        var query_allocations = std.ArrayList([]u8).empty;
        defer {
            for (query_allocations.items) |value| allocator.free(value);
            query_allocations.deinit(allocator);
        }
        if (query.window) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "window", .value = formatted });
        }
        if (query.projectId) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "projectId", .value = formatted });
        }



        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/summary",
            .path_params = &.{},
            .query = query_values.items,
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
                    types.ProjectMetricsSummaryResponse,
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

    /// GET /v1/metrics/timeline
    pub fn getProjectMetricsTimeline(self: *@This(), query: types.GetProjectMetricsTimelineQuery,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.ProjectMetricsTimelineResponse)) {
        const allocator = self.transport.allocator;


        var query_values = std.ArrayList(transport.QueryParam).empty;
        defer query_values.deinit(allocator);
        var query_allocations = std.ArrayList([]u8).empty;
        defer {
            for (query_allocations.items) |value| allocator.free(value);
            query_allocations.deinit(allocator);
        }
        if (query.window) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "window", .value = formatted });
        }
        if (query.granularity) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "granularity", .value = formatted });
        }
        if (query.format) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "format", .value = formatted });
        }
        if (query.projectId) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "projectId", .value = formatted });
        }



        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/timeline",
            .path_params = &.{},
            .query = query_values.items,
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
                    types.ProjectMetricsTimelineResponse,
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

    /// GET /v1/metrics/advisor
    pub fn getMetricsAdvisor(self: *@This(), query: types.GetMetricsAdvisorQuery,
        options: transport.RequestOptions) !transport.Result(std.json.Parsed(types.AdvisorReportResponse)) {
        const allocator = self.transport.allocator;


        var query_values = std.ArrayList(transport.QueryParam).empty;
        defer query_values.deinit(allocator);
        var query_allocations = std.ArrayList([]u8).empty;
        defer {
            for (query_allocations.items) |value| allocator.free(value);
            query_allocations.deinit(allocator);
        }
        if (query.projectId) |parameter_value| {
            const formatted = try transport.Transport.formatValue(allocator, parameter_value);
            try query_allocations.append(allocator, formatted);
            try query_values.append(allocator, .{ .name = "projectId", .value = formatted });
        }



        const body_json: ?[]u8 = null;

        var execution = try self.transport.execute(.{
            .method = .GET,
            .path = "/v1/metrics/advisor",
            .path_params = &.{},
            .query = query_values.items,
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
                    types.AdvisorReportResponse,
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
