<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\CreateTopicBody;
use Apollo\Deploy\Signal\Sdk\CursorPage;
use Apollo\Deploy\Signal\Sdk\TopicPageResponse;
use Apollo\Deploy\Signal\Sdk\TopicResponse;
use Apollo\Deploy\Signal\Sdk\UpdateTopicBody;
use Psr\Http\Message\ResponseInterface;

/** TopicsAPI domain operations. */
class Topics
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return TopicPageResponse
     * @throws SDKError
     */
    public function listTopics(
        string $projectId,
    ): TopicPageResponse
    {
        $path = '/v1/projects/${projectId}/topics';
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
        if (is_array($data) && method_exists(TopicPageResponse::class, 'fromArray')) {
            return TopicPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $topicId
     * @return TopicResponse
     * @throws SDKError
     */
    public function getTopic(
        string $projectId,
        string $topicId,
    ): TopicResponse
    {
        $path = '/v1/projects/${projectId}/topics/${topicId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${topicId}', rawurlencode(Transport::wireValue($topicId)), $path);

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
        if (is_array($data) && method_exists(TopicResponse::class, 'fromArray')) {
            return TopicResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $topicId
     * @return CursorPage
     * @throws SDKError
     */
    public function listContactsInTopic(
        string $projectId,
        string $topicId,
    ): CursorPage
    {
        $path = '/v1/projects/${projectId}/topics/${topicId}/contacts';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${topicId}', rawurlencode(Transport::wireValue($topicId)), $path);

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
     * @param CreateTopicBody $input
     * @return TopicResponse
     * @throws SDKError
     */
    public function createTopic(
        string $projectId,
        CreateTopicBody $input,
    ): TopicResponse
    {
        $path = '/v1/projects/${projectId}/topics';
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
        if (is_array($data) && method_exists(TopicResponse::class, 'fromArray')) {
            return TopicResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $topicId
     * @param UpdateTopicBody $input
     * @return TopicResponse
     * @throws SDKError
     */
    public function updateTopic(
        string $projectId,
        string $topicId,
        UpdateTopicBody $input,
    ): TopicResponse
    {
        $path = '/v1/projects/${projectId}/topics/${topicId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${topicId}', rawurlencode(Transport::wireValue($topicId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'PATCH',
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
        if (is_array($data) && method_exists(TopicResponse::class, 'fromArray')) {
            return TopicResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $topicId
     * @return void
     * @throws SDKError
     */
    public function deleteTopic(
        string $projectId,
        string $topicId,
    ): void
    {
        $path = '/v1/projects/${projectId}/topics/${topicId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${topicId}', rawurlencode(Transport::wireValue($topicId)), $path);

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
