package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** ContactPropertiesAPI API operations. */
public final class ContactPropertiesAPI {
    private final Transport transport;

    public ContactPropertiesAPI(Transport transport) {
        this.transport = transport;
    }

    public ContactPropertyPageResponse listContactProperties(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/contact-properties";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ContactPropertyPageResponse>() {
        });
    }

    public ContactPropertyResponse getContactProperty(
        String projectId,
        String propertyId
    ) {
        String path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${propertyId}", Transport.encodePathSegment(String.valueOf(propertyId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ContactPropertyResponse>() {
        });
    }

    public ContactPropertyResponse createContactProperty(
        String projectId,
        CreateContactPropertyBody body
    ) {
        String path = "/v1/projects/${projectId}/contact-properties";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ContactPropertyResponse>() {
        });
    }

    public ContactPropertyResponse updateContactProperty(
        String projectId,
        String propertyId,
        UpdateContactPropertyBody body
    ) {
        String path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${propertyId}", Transport.encodePathSegment(String.valueOf(propertyId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ContactPropertyResponse>() {
        });
    }

    public void deleteContactProperty(
        String projectId,
        String propertyId
    ) {
        String path = "/v1/projects/${projectId}/contact-properties/${propertyId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${propertyId}", Transport.encodePathSegment(String.valueOf(propertyId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

}
