<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\ContactPropertyPageResponse;
use Apollo\Deploy\Signal\Sdk\ContactPropertyResponse;
use Apollo\Deploy\Signal\Sdk\CreateContactPropertyBody;
use Apollo\Deploy\Signal\Sdk\UpdateContactPropertyBody;
use Psr\Http\Message\ResponseInterface;

/** ContactPropertiesAPI domain operations. */
class ContactProperties
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return ContactPropertyPageResponse
     * @throws SDKError
     */
    public function listContactProperties(
        string $projectId,
    ): ContactPropertyPageResponse
    {
        $path = '/v1/projects/${projectId}/contact-properties';
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
        if (is_array($data) && method_exists(ContactPropertyPageResponse::class, 'fromArray')) {
            return ContactPropertyPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $propertyId
     * @return ContactPropertyResponse
     * @throws SDKError
     */
    public function getContactProperty(
        string $projectId,
        string $propertyId,
    ): ContactPropertyResponse
    {
        $path = '/v1/projects/${projectId}/contact-properties/${propertyId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${propertyId}', rawurlencode(Transport::wireValue($propertyId)), $path);

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
        if (is_array($data) && method_exists(ContactPropertyResponse::class, 'fromArray')) {
            return ContactPropertyResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param CreateContactPropertyBody $input
     * @return ContactPropertyResponse
     * @throws SDKError
     */
    public function createContactProperty(
        string $projectId,
        CreateContactPropertyBody $input,
    ): ContactPropertyResponse
    {
        $path = '/v1/projects/${projectId}/contact-properties';
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
        if (is_array($data) && method_exists(ContactPropertyResponse::class, 'fromArray')) {
            return ContactPropertyResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $propertyId
     * @param UpdateContactPropertyBody $input
     * @return ContactPropertyResponse
     * @throws SDKError
     */
    public function updateContactProperty(
        string $projectId,
        string $propertyId,
        UpdateContactPropertyBody $input,
    ): ContactPropertyResponse
    {
        $path = '/v1/projects/${projectId}/contact-properties/${propertyId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${propertyId}', rawurlencode(Transport::wireValue($propertyId)), $path);

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
        if (is_array($data) && method_exists(ContactPropertyResponse::class, 'fromArray')) {
            return ContactPropertyResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $propertyId
     * @return void
     * @throws SDKError
     */
    public function deleteContactProperty(
        string $projectId,
        string $propertyId,
    ): void
    {
        $path = '/v1/projects/${projectId}/contact-properties/${propertyId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${propertyId}', rawurlencode(Transport::wireValue($propertyId)), $path);

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
