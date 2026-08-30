package com.apollodeploy.signal.sdk.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.apollodeploy.signal.sdk.models.Types.*;
import com.apollodeploy.signal.sdk.transport.Transport;
import java.time.Duration;
import java.util.List;

/** SegmentsAPI API operations. */
public final class SegmentsAPI {
    private final Transport transport;

    public SegmentsAPI(Transport transport) {
        this.transport = transport;
    }

    public SegmentPageResponse listSegments(
        String projectId
    ) {
        String path = "/v1/projects/${projectId}/segments";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<SegmentPageResponse>() {
        });
    }

    public SegmentResponse getSegment(
        String projectId,
        String segmentId
    ) {
        String path = "/v1/projects/${projectId}/segments/${segmentId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${segmentId}", Transport.encodePathSegment(String.valueOf(segmentId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<SegmentResponse>() {
        });
    }

    public CursorPage listContactsInSegment(
        String projectId,
        String segmentId
    ) {
        String path = "/v1/projects/${projectId}/segments/${segmentId}/contacts";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${segmentId}", Transport.encodePathSegment(String.valueOf(segmentId)));

        Transport.Request request = new Transport.Request("GET", path);
        return transport.execute(request, new TypeReference<CursorPage>() {
        });
    }

    public SegmentResponse createSegment(
        String projectId,
        CreateSegmentBody body
    ) {
        String path = "/v1/projects/${projectId}/segments";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));

        Transport.Request request = new Transport.Request("POST", path);
        request.body(body, "application/json");
        return transport.execute(request, new TypeReference<SegmentResponse>() {
        });
    }

    public void deleteSegment(
        String projectId,
        String segmentId
    ) {
        String path = "/v1/projects/${projectId}/segments/${segmentId}";
        path = path.replace("${projectId}", Transport.encodePathSegment(String.valueOf(projectId)));
        path = path.replace("${segmentId}", Transport.encodePathSegment(String.valueOf(segmentId)));

        Transport.Request request = new Transport.Request("DELETE", path);
        transport.executeVoid(request);
    }

}
