<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\ApiKey;
use Apollo\Deploy\Signal\Sdk\ApiKeyUsageResponse;
use Apollo\Deploy\Signal\Sdk\ListApiKeysResponse;
use Psr\Http\Message\ResponseInterface;

/** ApiKeysAPI domain operations. */
class ApiKeys
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return ListApiKeysResponse
     * @throws SDKError
     */
    public function listApiKeys(
        string $projectId,
    ): ListApiKeysResponse
    {
        $path = '/v1/projects/${projectId}/api-keys';
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
        if (is_array($data) && method_exists(ListApiKeysResponse::class, 'fromArray')) {
            return ListApiKeysResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $keyId
     * @return ApiKey
     * @throws SDKError
     */
    public function getApiKey(
        string $projectId,
        string $keyId,
    ): ApiKey
    {
        $path = '/v1/projects/${projectId}/api-keys/${keyId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${keyId}', rawurlencode(Transport::wireValue($keyId)), $path);

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
        if (is_array($data) && method_exists(ApiKey::class, 'fromArray')) {
            return ApiKey::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $keyId
     * @return ApiKeyUsageResponse
     * @throws SDKError
     */
    public function getApiKeyUsage(
        string $projectId,
        string $keyId,
    ): ApiKeyUsageResponse
    {
        $path = '/v1/projects/${projectId}/api-keys/${keyId}/usage';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${keyId}', rawurlencode(Transport::wireValue($keyId)), $path);

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
        if (is_array($data) && method_exists(ApiKeyUsageResponse::class, 'fromArray')) {
            return ApiKeyUsageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $keyId
     * @return void
     * @throws SDKError
     */
    public function exportApiKeyUsage(
        string $projectId,
        string $keyId,
    ): void
    {
        $path = '/v1/projects/${projectId}/api-keys/${keyId}/usage/export';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${keyId}', rawurlencode(Transport::wireValue($keyId)), $path);

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
