package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** SuppressionsAPI API operations. */
public final class SuppressionsAPI {
    private final Transport transport;

    public SuppressionsAPI(Transport transport) {
        this.transport = transport;
    }

    public SuppressionPageResponse listSuppressions(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/suppressions";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<SuppressionPageResponse>() {
        });
    }

    public void exportSuppressions(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/suppressions/export";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        transport.executeVoid(request);
    }

    public SuppressionResponse addSuppression(
        String projectId,
        AddSuppressionBody body
    ) {
        String path = "/v1/projects/${projectId}/suppressions";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<SuppressionResponse>() {
        });
    }

    public void removeSuppression(
        String projectId,
        String email
    ) {
        String path = "/v1/projects/${projectId}/suppressions/${email}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${email}", Transport.encodePathSegment(String.valueOf(email)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public SuppressionImportResponse importSuppressions(
        String projectId,
        SuppressionImportBody body
    ) {
        String path = "/v1/projects/${projectId}/suppressions/import";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<SuppressionImportResponse>() {
        });
    }

}
