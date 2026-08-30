package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** EmailsAPI API operations. */
public final class EmailsAPI {
    private final Transport transport;

    public EmailsAPI(Transport transport) {
        this.transport = transport;
    }

    public SendEmailResponse sendEmail(
        SendEmailRequest body
    ) {
        String path = "/v1/emails";

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<SendEmailResponse>() {
        });
    }

    public EmailDetailResponse getEmail(
        String emailId
    ) {
        String path = "/v1/emails/${emailId}";
        path = path.replace("${emailId}", Transport.encodePathSegment(String.valueOf(emailId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<EmailDetailResponse>() {
        });
    }

    public BatchSendResponse batchSendEmails(
        BatchSendRequest body
    ) {
        String path = "/v1/emails/batch";

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<BatchSendResponse>() {
        });
    }

    public CancelResponse cancelEmail(
        String emailId
    ) {
        String path = "/v1/emails/${emailId}";
        path = path.replace("${emailId}", Transport.encodePathSegment(String.valueOf(emailId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        return transport.execute(request, new TypeReference<CancelResponse>() {
        });
    }

    public BulkCancelResponse bulkCancelEmails(
    ) {
        String path = "/v1/emails";

        Transport.Request request = new Transport.Request("DELETE", path);
        return transport.execute(request, new TypeReference<BulkCancelResponse>() {
        });
    }

    public StreamTokenResponse issueStreamToken(
        String projectId
    ) {
        String path = "/v1/emails/${projectId}/stream/token";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        return transport.execute(request, new TypeReference<StreamTokenResponse>() {
        });
    }

    public Transport.SseStream<StreamEventResponse> streamEmailEvents(
    ) {
        String path = "/v1/emails/stream";

        Transport.Request request = new Transport.Request("GET", path);
        request.header("Accept", "text/event-stream");
        return transport.stream(request, new TypeReference<StreamEventResponse>() {
        });
    }

    public ValidateLinksResponse validateLinks(
        ValidateLinksRequest body
    ) {
        String path = "/v1/emails/validate";

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<ValidateLinksResponse>() {
        });
    }

}
