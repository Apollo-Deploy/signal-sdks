package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** ProjectsAPI API operations. */
public final class ProjectsAPI {
    private final Transport transport;

    public ProjectsAPI(Transport transport) {
        this.transport = transport;
    }

    public ProjectPageResponse listProjects(
    ) {
        String path = "/v1/projects";

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ProjectPageResponse>() {
        });
    }

    public ProjectResponse getProject(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ProjectResponse>() {
        });
    }

    public ProjectResponse updateProject(
        String projectId,
        UpdateProjectRequest body
    ) {
        String path = "/v1/projects/${projectId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ProjectResponse>() {
        });
    }

    public EmailPageResponse listEmails(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/emails";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailPageResponse>() {
        });
    }

    public EmailDetailResponse getProjectEmail(
        String projectId,
        String emailId
    ) {
        String path = "/v1/projects/${projectId}/emails/${emailId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${emailId}", Transport.encodePathSegment(String.valueOf(emailId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailDetailResponse>() {
        });
    }

    public EmailTimelineResponse getEmailTimeline(
        String projectId,
        String emailId
    ) {
        String path = "/v1/projects/${projectId}/emails/${emailId}/events";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${emailId}", Transport.encodePathSegment(String.valueOf(emailId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailTimelineResponse>() {
        });
    }

}
