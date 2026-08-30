package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** TopicsAPI API operations. */
public final class TopicsAPI {
    private final Transport transport;

    public TopicsAPI(Transport transport) {
        this.transport = transport;
    }

    public TopicPageResponse listTopics(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/topics";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<TopicPageResponse>() {
        });
    }

    public TopicResponse getTopic(
        String projectId,
        String topicId
    ) {
        String path = "/v1/projects/${projectId}/topics/${topicId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${topicId}", Transport.encodePathSegment(String.valueOf(topicId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<TopicResponse>() {
        });
    }

    public CursorPage listContactsInTopic(
        String projectId,
        String topicId
    ) {
        String path = "/v1/projects/${projectId}/topics/${topicId}/contacts";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${topicId}", Transport.encodePathSegment(String.valueOf(topicId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<CursorPage>() {
        });
    }

    public TopicResponse createTopic(
        String projectId,
        CreateTopicBody body
    ) {
        String path = "/v1/projects/${projectId}/topics";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<TopicResponse>() {
        });
    }

    public TopicResponse updateTopic(
        String projectId,
        String topicId,
        UpdateTopicBody body
    ) {
        String path = "/v1/projects/${projectId}/topics/${topicId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${topicId}", Transport.encodePathSegment(String.valueOf(topicId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<TopicResponse>() {
        });
    }

    public void deleteTopic(
        String projectId,
        String topicId
    ) {
        String path = "/v1/projects/${projectId}/topics/${topicId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${topicId}", Transport.encodePathSegment(String.valueOf(topicId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

}
