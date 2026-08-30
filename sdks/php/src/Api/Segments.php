<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\CreateSegmentBody;
use Apollo\Deploy\Signal\Sdk\CursorPage;
use Apollo\Deploy\Signal\Sdk\SegmentPageResponse;
use Apollo\Deploy\Signal\Sdk\SegmentResponse;
use Psr\Http\Message\ResponseInterface;

/** SegmentsAPI domain operations. */
class Segments
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return SegmentPageResponse
     * @throws SDKError
     */
    public function listSegments(
        string $projectId,
    ): SegmentPageResponse
    {
        $path = '/v1/projects/${projectId}/segments';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(SegmentPageResponse::class, 'fromArray')) {
            return SegmentPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $segmentId
     * @return SegmentResponse
     * @throws SDKError
     */
    public function getSegment(
        string $projectId,
        string $segmentId,
    ): SegmentResponse
    {
        $path = '/v1/projects/${projectId}/segments/${segmentId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${segmentId}', rawurlencode(Transport::wireValue($segmentId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(SegmentResponse::class, 'fromArray')) {
            return SegmentResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $segmentId
     * @return CursorPage
     * @throws SDKError
     */
    public function listContactsInSegment(
        string $projectId,
        string $segmentId,
    ): CursorPage
    {
        $path = '/v1/projects/${projectId}/segments/${segmentId}/contacts';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${segmentId}', rawurlencode(Transport::wireValue($segmentId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(CursorPage::class, 'fromArray')) {
            return CursorPage::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param CreateSegmentBody $input
     * @return SegmentResponse
     * @throws SDKError
     */
    public function createSegment(
        string $projectId,
        CreateSegmentBody $input,
    ): SegmentResponse
    {
        $path = '/v1/projects/${projectId}/segments';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'POST',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];
        if ($input !== null) {
            $request['body'] = $input;
            $request['contentType'] = 'application/json';
        }

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(SegmentResponse::class, 'fromArray')) {
            return SegmentResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $segmentId
     * @return void
     * @throws SDKError
     */
    public function deleteSegment(
        string $projectId,
        string $segmentId,
    ): void
    {
        $path = '/v1/projects/${projectId}/segments/${segmentId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${segmentId}', rawurlencode(Transport::wireValue($segmentId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'DELETE',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $this->transport->readResponseBody($response);
        return;
    }

    private function decodeResponse(ResponseInterface $response): mixed
    {
        $contents = $this->transport->readResponseBody($response);
        if (trim($contents) === '') {
            $requestId = $response->getHeaderLine('x-request-id')
                ?: $response->getHeaderLine('request-id')
                ?: null;
            throw new SDKError(
                message: 'Expected a response body for a non-void operation',
                status: $response->getStatusCode(),
                code: 'RESPONSE_BODY_MISSING',
                requestId: $requestId,
            );
        }

        try {
            return json_decode($contents, true, 512, JSON_THROW_ON_ERROR);
        } catch (\JsonException) {
            return $contents;
        }
    }
}
