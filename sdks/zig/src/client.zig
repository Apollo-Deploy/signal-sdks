const std = @import("std");
const transport = @import("transport.zig");
const emails_domain = @import("domain/emails.zig");
const metrics_domain = @import("domain/metrics.zig");
const suppressions_domain = @import("domain/suppressions.zig");
const segments_domain = @import("domain/segments.zig");
const topics_domain = @import("domain/topics.zig");
const contactProperties_domain = @import("domain/contact_properties.zig");
const contacts_domain = @import("domain/contacts.zig");
const webhooks_domain = @import("domain/webhooks.zig");
const apiKeys_domain = @import("domain/api_keys.zig");
const projects_domain = @import("domain/projects.zig");
const sendingDomains_domain = @import("domain/sending_domains.zig");

pub const ClientConfig = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    base_url: []const u8 = "https://signal.apollodeploy.com",
    timeout_ms: u64 = 15_000,
    max_retries: u8 = 3,
    retry_unsafe_requests: bool = false,
    max_request_bytes: usize = transport.MAX_REQUEST_BYTES,
    max_response_bytes: usize = transport.MAX_RESPONSE_BYTES,
    default_headers: []const transport.Header = &.{},
};

pub const Client = struct {
    transport: transport.Transport,

    pub fn init(config: ClientConfig) @This() {
        return .{
            .transport = transport.Transport.init(.{
                .allocator = config.allocator,
                .io = config.io,
                .base_url = config.base_url,
                .timeout_ms = config.timeout_ms,
                .max_retries = config.max_retries,
                .retry_unsafe_requests = config.retry_unsafe_requests,
                .max_request_bytes = config.max_request_bytes,
                .max_response_bytes = config.max_response_bytes,
                .default_headers = config.default_headers,
                .user_agent = "apollo_signal-zig-sdk/1.0.5",
            }),
        };
    }

    pub fn deinit(self: *@This()) void {
        self.transport.deinit();
    }

    pub fn transportRef(self: *@This()) *transport.Transport {
        return &self.transport;
    }

    pub const EmailsApi = emails_domain.EmailsApi;

    pub fn emails(self: *@This()) EmailsApi {
        return .{ .transport = &self.transport };
    }

    pub const MetricsApi = metrics_domain.MetricsApi;

    pub fn metrics(self: *@This()) MetricsApi {
        return .{ .transport = &self.transport };
    }

    pub const SuppressionsApi = suppressions_domain.SuppressionsApi;

    pub fn suppressions(self: *@This()) SuppressionsApi {
        return .{ .transport = &self.transport };
    }

    pub const SegmentsApi = segments_domain.SegmentsApi;

    pub fn segments(self: *@This()) SegmentsApi {
        return .{ .transport = &self.transport };
    }

    pub const TopicsApi = topics_domain.TopicsApi;

    pub fn topics(self: *@This()) TopicsApi {
        return .{ .transport = &self.transport };
    }

    pub const ContactPropertiesApi = contactProperties_domain.ContactPropertiesApi;

    pub fn contactProperties(self: *@This()) ContactPropertiesApi {
        return .{ .transport = &self.transport };
    }

    pub const ContactsApi = contacts_domain.ContactsApi;

    pub fn contacts(self: *@This()) ContactsApi {
        return .{ .transport = &self.transport };
    }

    pub const WebhooksApi = webhooks_domain.WebhooksApi;

    pub fn webhooks(self: *@This()) WebhooksApi {
        return .{ .transport = &self.transport };
    }

    pub const ApiKeysApi = apiKeys_domain.ApiKeysApi;

    pub fn apiKeys(self: *@This()) ApiKeysApi {
        return .{ .transport = &self.transport };
    }

    pub const ProjectsApi = projects_domain.ProjectsApi;

    pub fn projects(self: *@This()) ProjectsApi {
        return .{ .transport = &self.transport };
    }

    pub const SendingDomainsApi = sendingDomains_domain.SendingDomainsApi;

    pub fn sendingDomains(self: *@This()) SendingDomainsApi {
        return .{ .transport = &self.transport };
    }

};
