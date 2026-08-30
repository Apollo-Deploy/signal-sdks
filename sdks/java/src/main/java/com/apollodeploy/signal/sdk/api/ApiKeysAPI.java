package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** ApiKeysAPI API operations. */
public final class ApiKeysAPI {
    private final Transport transport;

    public ApiKeysAPI(Transport transport) {
        this.transport = transport;
    }

    public ListApiKeysResponse listApiKeys(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/api-keys";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ListApiKeysResponse>() {
        });
    }

    public ApiKey getApiKey(
        String projectId,
        String keyId
    ) {
        String path = "/v1/projects/${projectId}/api-keys/${keyId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${keyId}", Transport.encodePathSegment(String.valueOf(keyId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ApiKey>() {
        });
    }

    public ApiKeyUsageResponse getApiKeyUsage(
        String projectId,
        String keyId
    ) {
        String path = "/v1/projects/${projectId}/api-keys/${keyId}/usage";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${keyId}", Transport.encodePathSegment(String.valueOf(keyId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ApiKeyUsageResponse>() {
        });
    }

    public void exportApiKeyUsage(
        String projectId,
        String keyId
    ) {
        String path = "/v1/projects/${projectId}/api-keys/${keyId}/usage/export";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${keyId}", Transport.encodePathSegment(String.valueOf(keyId)));

        Transport.Request request = new Transport.Request("GET", path);
        transport.executeVoid(request);
    }

}
