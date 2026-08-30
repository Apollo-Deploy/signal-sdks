<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\CreateWebhookBody;
use Apollo\Deploy\Signal\Sdk\UpdateWebhookBody;
use Apollo\Deploy\Signal\Sdk\WebhookCreateResponse;
use Apollo\Deploy\Signal\Sdk\WebhookDeliveryPageResponse;
use Apollo\Deploy\Signal\Sdk\WebhookDeliveryResponse;
use Apollo\Deploy\Signal\Sdk\WebhookPageResponse;
use Apollo\Deploy\Signal\Sdk\WebhookResponse;
use Psr\Http\Message\ResponseInterface;

/** WebhooksAPI domain operations. */
class Webhooks
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return WebhookPageResponse
     * @throws SDKError
     */
    public function listWebhooks(
        string $projectId,
    ): WebhookPageResponse
    {
        $path = '/v1/projects/${projectId}/webhooks';
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
        if (is_array($data) && method_exists(WebhookPageResponse::class, 'fromArray')) {
            return WebhookPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @return WebhookResponse
     * @throws SDKError
     */
    public function getWebhook(
        string $projectId,
        string $endpointId,
    ): WebhookResponse
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);

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
        if (is_array($data) && method_exists(WebhookResponse::class, 'fromArray')) {
            return WebhookResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @return WebhookDeliveryPageResponse
     * @throws SDKError
     */
    public function listWebhookDeliveries(
        string $projectId,
        string $endpointId,
    ): WebhookDeliveryPageResponse
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}/deliveries';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);

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
        if (is_array($data) && method_exists(WebhookDeliveryPageResponse::class, 'fromArray')) {
            return WebhookDeliveryPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @param string $deliveryId
     * @return WebhookDeliveryResponse
     * @throws SDKError
     */
    public function getWebhookDelivery(
        string $projectId,
        string $endpointId,
        string $deliveryId,
    ): WebhookDeliveryResponse
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}/deliveries/${deliveryId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);
        $path = str_replace('${deliveryId}', rawurlencode(Transport::wireValue($deliveryId)), $path);

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
        if (is_array($data) && method_exists(WebhookDeliveryResponse::class, 'fromArray')) {
            return WebhookDeliveryResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param CreateWebhookBody $input
     * @return WebhookCreateResponse
     * @throws SDKError
     */
    public function createWebhook(
        string $projectId,
        CreateWebhookBody $input,
    ): WebhookCreateResponse
    {
        $path = '/v1/projects/${projectId}/webhooks';
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
        if (is_array($data) && method_exists(WebhookCreateResponse::class, 'fromArray')) {
            return WebhookCreateResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @param UpdateWebhookBody $input
     * @return WebhookResponse
     * @throws SDKError
     */
    public function updateWebhook(
        string $projectId,
        string $endpointId,
        UpdateWebhookBody $input,
    ): WebhookResponse
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);

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
        if (is_array($data) && method_exists(WebhookResponse::class, 'fromArray')) {
            return WebhookResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @return void
     * @throws SDKError
     */
    public function deleteWebhook(
        string $projectId,
        string $endpointId,
    ): void
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);

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
     * @param string $endpointId
     * @return WebhookDeliveryResponse
     * @throws SDKError
     */
    public function testWebhook(
        string $projectId,
        string $endpointId,
    ): WebhookDeliveryResponse
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}/test';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);

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
        if (is_array($data) && method_exists(WebhookDeliveryResponse::class, 'fromArray')) {
            return WebhookDeliveryResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $endpointId
     * @param string $deliveryId
     * @return void
     * @throws SDKError
     */
    public function replayWebhookDelivery(
        string $projectId,
        string $endpointId,
        string $deliveryId,
    ): void
    {
        $path = '/v1/projects/${projectId}/webhooks/${endpointId}/replay/${deliveryId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${endpointId}', rawurlencode(Transport::wireValue($endpointId)), $path);
        $path = str_replace('${deliveryId}', rawurlencode(Transport::wireValue($deliveryId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'POST',
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
