<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\DomainListPageResponse;
use Apollo\Deploy\Signal\Sdk\DomainResponse;
use Apollo\Deploy\Signal\Sdk\RegisterDomainRequest;
use Apollo\Deploy\Signal\Sdk\UpdateBimiRequest;
use Psr\Http\Message\ResponseInterface;

/** SendingDomainsAPI domain operations. */
class SendingDomains
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return DomainListPageResponse
     * @throws SDKError
     */
    public function listDomains(
        string $projectId,
    ): DomainListPageResponse
    {
        $path = '/v1/projects/${projectId}/domains';
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
        if (is_array($data) && method_exists(DomainListPageResponse::class, 'fromArray')) {
            return DomainListPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $domainId
     * @return DomainResponse
     * @throws SDKError
     */
    public function getDomain(
        string $projectId,
        string $domainId,
    ): DomainResponse
    {
        $path = '/v1/projects/${projectId}/domains/${domainId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${domainId}', rawurlencode(Transport::wireValue($domainId)), $path);

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
        if (is_array($data) && method_exists(DomainResponse::class, 'fromArray')) {
            return DomainResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param RegisterDomainRequest $input
     * @return DomainResponse
     * @throws SDKError
     */
    public function registerDomain(
        string $projectId,
        RegisterDomainRequest $input,
    ): DomainResponse
    {
        $path = '/v1/projects/${projectId}/domains';
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
        if (is_array($data) && method_exists(DomainResponse::class, 'fromArray')) {
            return DomainResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $domainId
     * @return DomainResponse
     * @throws SDKError
     */
    public function verifyDomain(
        string $projectId,
        string $domainId,
    ): DomainResponse
    {
        $path = '/v1/projects/${projectId}/domains/${domainId}/verify';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${domainId}', rawurlencode(Transport::wireValue($domainId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'POST',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(DomainResponse::class, 'fromArray')) {
            return DomainResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $domainId
     * @return void
     * @throws SDKError
     */
    public function deleteDomain(
        string $projectId,
        string $domainId,
    ): void
    {
        $path = '/v1/projects/${projectId}/domains/${domainId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${domainId}', rawurlencode(Transport::wireValue($domainId)), $path);

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
     * @param string $domainId
     * @return DomainResponse
     * @throws SDKError
     */
    public function verifyBimi(
        string $projectId,
        string $domainId,
    ): DomainResponse
    {
        $path = '/v1/projects/${projectId}/domains/${domainId}/bimi/verify';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${domainId}', rawurlencode(Transport::wireValue($domainId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'POST',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(DomainResponse::class, 'fromArray')) {
            return DomainResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $domainId
     * @param UpdateBimiRequest $input
     * @return DomainResponse
     * @throws SDKError
     */
    public function updateBimi(
        string $projectId,
        string $domainId,
        UpdateBimiRequest $input,
    ): DomainResponse
    {
        $path = '/v1/projects/${projectId}/domains/${domainId}/bimi';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${domainId}', rawurlencode(Transport::wireValue($domainId)), $path);

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
        if (is_array($data) && method_exists(DomainResponse::class, 'fromArray')) {
            return DomainResponse::fromArray($data);
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
