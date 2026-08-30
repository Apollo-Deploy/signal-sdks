<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\EmailDetailResponse;
use Apollo\Deploy\Signal\Sdk\EmailPageResponse;
use Apollo\Deploy\Signal\Sdk\EmailTimelineResponse;
use Apollo\Deploy\Signal\Sdk\ProjectPageResponse;
use Apollo\Deploy\Signal\Sdk\ProjectResponse;
use Apollo\Deploy\Signal\Sdk\UpdateProjectRequest;
use Psr\Http\Message\ResponseInterface;

/** ProjectsAPI domain operations. */
class Projects
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @return ProjectPageResponse
     * @throws SDKError
     */
    public function listProjects(
    ): ProjectPageResponse
    {
        $path = '/v1/projects';

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
        if (is_array($data) && method_exists(ProjectPageResponse::class, 'fromArray')) {
            return ProjectPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @return ProjectResponse
     * @throws SDKError
     */
    public function getProject(
        string $projectId,
    ): ProjectResponse
    {
        $path = '/v1/projects/${projectId}';
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
        if (is_array($data) && method_exists(ProjectResponse::class, 'fromArray')) {
            return ProjectResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param UpdateProjectRequest $input
     * @return ProjectResponse
     * @throws SDKError
     */
    public function updateProject(
        string $projectId,
        UpdateProjectRequest $input,
    ): ProjectResponse
    {
        $path = '/v1/projects/${projectId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);

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
        if (is_array($data) && method_exists(ProjectResponse::class, 'fromArray')) {
            return ProjectResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @return EmailPageResponse
     * @throws SDKError
     */
    public function listEmails(
        string $projectId,
    ): EmailPageResponse
    {
        $path = '/v1/projects/${projectId}/emails';
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
        if (is_array($data) && method_exists(EmailPageResponse::class, 'fromArray')) {
            return EmailPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $emailId
     * @return EmailDetailResponse
     * @throws SDKError
     */
    public function getProjectEmail(
        string $projectId,
        string $emailId,
    ): EmailDetailResponse
    {
        $path = '/v1/projects/${projectId}/emails/${emailId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${emailId}', rawurlencode(Transport::wireValue($emailId)), $path);

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
        if (is_array($data) && method_exists(EmailDetailResponse::class, 'fromArray')) {
            return EmailDetailResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $emailId
     * @return EmailTimelineResponse
     * @throws SDKError
     */
    public function getEmailTimeline(
        string $projectId,
        string $emailId,
    ): EmailTimelineResponse
    {
        $path = '/v1/projects/${projectId}/emails/${emailId}/events';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${emailId}', rawurlencode(Transport::wireValue($emailId)), $path);

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
        if (is_array($data) && method_exists(EmailTimelineResponse::class, 'fromArray')) {
            return EmailTimelineResponse::fromArray($data);
        }
        return $data;
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
