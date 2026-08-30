<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\AddSuppressionBody;
use Apollo\Deploy\Signal\Sdk\SuppressionImportBody;
use Apollo\Deploy\Signal\Sdk\SuppressionImportResponse;
use Apollo\Deploy\Signal\Sdk\SuppressionPageResponse;
use Apollo\Deploy\Signal\Sdk\SuppressionResponse;
use Psr\Http\Message\ResponseInterface;

/** SuppressionsAPI domain operations. */
class Suppressions
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return SuppressionPageResponse
     * @throws SDKError
     */
    public function listSuppressions(
        string $projectId,
    ): SuppressionPageResponse
    {
        $path = '/v1/projects/${projectId}/suppressions';
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
        if (is_array($data) && method_exists(SuppressionPageResponse::class, 'fromArray')) {
            return SuppressionPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @return void
     * @throws SDKError
     */
    public function exportSuppressions(
        string $projectId,
    ): void
    {
        $path = '/v1/projects/${projectId}/suppressions/export';
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
        $this->transport->readResponseBody($response);
        return;
    }

    /**
     * @param string $projectId
     * @param AddSuppressionBody $input
     * @return SuppressionResponse
     * @throws SDKError
     */
    public function addSuppression(
        string $projectId,
        AddSuppressionBody $input,
    ): SuppressionResponse
    {
        $path = '/v1/projects/${projectId}/suppressions';
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
        if (is_array($data) && method_exists(SuppressionResponse::class, 'fromArray')) {
            return SuppressionResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $email
     * @return void
     * @throws SDKError
     */
    public function removeSuppression(
        string $projectId,
        string $email,
    ): void
    {
        $path = '/v1/projects/${projectId}/suppressions/${email}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${email}', rawurlencode(Transport::wireValue($email)), $path);

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

    /**
     * @param string $projectId
     * @param SuppressionImportBody $input
     * @return SuppressionImportResponse
     * @throws SDKError
     */
    public function importSuppressions(
        string $projectId,
        SuppressionImportBody $input,
    ): SuppressionImportResponse
    {
        $path = '/v1/projects/${projectId}/suppressions/import';
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
        if (is_array($data) && method_exists(SuppressionImportResponse::class, 'fromArray')) {
            return SuppressionImportResponse::fromArray($data);
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
