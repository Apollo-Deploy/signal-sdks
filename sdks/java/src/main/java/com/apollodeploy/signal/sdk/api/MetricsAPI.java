package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** MetricsAPI API operations. */
public final class MetricsAPI {
    private final Transport transport;

    public MetricsAPI(Transport transport) {
        this.transport = transport;
    }

    public TopicPerformanceResponse getTopicPerformance(
        String id,
        String window,
        String projectId
    ) {
        String path = "/v1/metrics/topics/${id}";
        path = path.replace("${id}", Transport.encodePathSegment(String.valueOf(id)));

        Transport.Request request = new Transport.Request("GET", path);
        if (window != null) {
            request.query("window", window);
        }
        if (projectId != null) {
            request.query("projectId", projectId);
        }
        return transport.execute(request, new TypeReference<TopicPerformanceResponse>() {
        });
    }

    public EmailPerformanceResponse getEmailPerformance(
        String id
    ) {
        String path = "/v1/metrics/emails/${id}";
        path = path.replace("${id}", Transport.encodePathSegment(String.valueOf(id)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailPerformanceResponse>() {
        });
    }

    public EmailReadScrollAnalyticsResponse getEmailEngagement(
        String id
    ) {
        String path = "/v1/metrics/emails/${id}/engagement";
        path = path.replace("${id}", Transport.encodePathSegment(String.valueOf(id)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailReadScrollAnalyticsResponse>() {
        });
    }

    public ProjectMetricsSummaryResponse getProjectMetricsSummary(
        String window,
        String projectId
    ) {
        String path = "/v1/metrics/summary";

        Transport.Request request = new Transport.Request("GET", path);
        if (window != null) {
            request.query("window", window);
        }
        if (projectId != null) {
            request.query("projectId", projectId);
        }
        return transport.execute(request, new TypeReference<ProjectMetricsSummaryResponse>() {
        });
    }

    public ProjectMetricsTimelineResponse getProjectMetricsTimeline(
        String window,
        String granularity,
        String format,
        String projectId
    ) {
        String path = "/v1/metrics/timeline";

        Transport.Request request = new Transport.Request("GET", path);
        if (window != null) {
            request.query("window", window);
        }
        if (granularity != null) {
            request.query("granularity", granularity);
        }
        if (format != null) {
            request.query("format", format);
        }
        if (projectId != null) {
            request.query("projectId", projectId);
        }
        return transport.execute(request, new TypeReference<ProjectMetricsTimelineResponse>() {
        });
    }

    public AdvisorReportResponse getMetricsAdvisor(
        String projectId
    ) {
        String path = "/v1/metrics/advisor";

        Transport.Request request = new Transport.Request("GET", path);
        if (projectId != null) {
            request.query("projectId", projectId);
        }
        return transport.execute(request, new TypeReference<AdvisorReportResponse>() {
        });
    }

}
