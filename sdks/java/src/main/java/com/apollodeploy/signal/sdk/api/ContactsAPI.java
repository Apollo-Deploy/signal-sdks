package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** ContactsAPI API operations. */
public final class ContactsAPI {
    private final Transport transport;

    public ContactsAPI(Transport transport) {
        this.transport = transport;
    }

    public ContactPageResponse listContacts(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/contacts";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ContactPageResponse>() {
        });
    }

    public ContactResponse getContact(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ContactResponse>() {
        });
    }

    public ListContactSegmentsResponse listContactSegments(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/segments";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<ListContactSegmentsResponse>() {
        });
    }

    public GetContactTopicsResponse getContactTopics(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/topics";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<GetContactTopicsResponse>() {
        });
    }

    public ContactResponse createContact(
        String projectId,
        CreateContactBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ContactResponse>() {
        });
    }

    public ContactResponse updateContact(
        String projectId,
        String contactId,
        UpdateContactBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ContactResponse>() {
        });
    }

    public void deleteContact(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public ContactResponse uploadContactImage(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<ContactResponse>() {
        });
    }

    public ContactResponse setContactImageUrl(
        String projectId,
        String contactId,
        SetImageUrlBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("PUT", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ContactResponse>() {
        });
    }

    public void deleteContactImage(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/image";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public void addContactToSegment(
        String projectId,
        String contactId,
        AddToSegmentBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/segments";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        transport.executeVoid(request);
    }

    public void removeContactFromSegment(
        String projectId,
        String contactId,
        String segmentId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));
        path = path.replace("${segmentId}", Transport.encodePathSegment(String.valueOf(segmentId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

    public void updateContactTopics(
        String projectId,
        String contactId,
        UpdateTopicsBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/topics";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("PATCH", path);
        request.body(body, "application/json");
        transport.executeVoid(request);
    }

    public GetContactActivityResponse getContactActivity(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/activity";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<GetContactActivityResponse>() {
        });
    }

    public EngagementScoreResponse getContactEngagementScore(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/engagement";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EngagementScoreResponse>() {
        });
    }

    public EmailValidationStatusResponse getContactEmailValidationStatus(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailValidationStatusResponse>() {
        });
    }

    public EngagementScoreResponse refreshContactEngagementScore(
        String projectId,
        String contactId
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<EngagementScoreResponse>() {
        });
    }

    public void recordContactEmailValidation(
        String projectId,
        String contactId,
        RecordValidationBody body
    ) {
        String path = "/v1/projects/${projectId}/contacts/${contactId}/email-validation";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${contactId}", Transport.encodePathSegment(String.valueOf(contactId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        transport.executeVoid(request);
    }

}
