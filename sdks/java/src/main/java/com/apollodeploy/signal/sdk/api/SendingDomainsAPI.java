package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** SendingDomainsAPI API operations. */
public final class SendingDomainsAPI {
    private final Transport transport;

    public SendingDomainsAPI(Transport transport) {
        this.transport = transport;
    }

    public DomainListPageResponse listDomains(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/domains";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<DomainListPageResponse>() {
        });
    }

    public DomainResponse getDomain(
        String projectId,
        String domainId
    ) {
        String path = "/v1/projects/${projectId}/domains/${domainId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${domainId}", Transport.encodePathSegment(String.valueOf(domainId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<DomainResponse>() {
        });
    }

    public DomainResponse registerDomain(
        String projectId,
        RegisterDomainRequest body
    ) {
        String path = "/v1/projects/${projectId}/domains";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<DomainResponse>() {
        });
    }

    public DomainResponse verifyDomain(
        String projectId,
        String domainId
    ) {
        String path = "/v1/projects/${projectId}/domains/${domainId}/verify";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${domainId}", Transport.encodePathSegment(String.valueOf(domainId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<DomainResponse>() {
        });
    }

    public void deleteDomain(
        String projectId,
        String domainId
    ) {
        String path = "/v1/projects/${projectId}/domains/${domainId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${domainId}", Transport.encodePathSegment(String.valueOf(domainId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public DomainResponse verifyBimi(
        String projectId,
        String domainId
    ) {
        String path = "/v1/projects/${projectId}/domains/${domainId}/bimi/verify";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${domainId}", Transport.encodePathSegment(String.valueOf(domainId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<DomainResponse>() {
        });
    }

    public DomainResponse updateBimi(
        String projectId,
        String domainId,
        UpdateBimiRequest body
    ) {
        String path = "/v1/projects/${projectId}/domains/${domainId}/bimi";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${domainId}", Transport.encodePathSegment(String.valueOf(domainId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<DomainResponse>() {
        });
    }

}
