<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\BatchSendRequest;
use Apollo\Deploy\Signal\Sdk\BatchSendResponse;
use Apollo\Deploy\Signal\Sdk\BulkCancelResponse;
use Apollo\Deploy\Signal\Sdk\CancelResponse;
use Apollo\Deploy\Signal\Sdk\EmailDetailResponse;
use Apollo\Deploy\Signal\Sdk\SendEmailRequest;
use Apollo\Deploy\Signal\Sdk\SendEmailResponse;
use Apollo\Deploy\Signal\Sdk\StreamEventResponse;
use Apollo\Deploy\Signal\Sdk\StreamTokenResponse;
use Apollo\Deploy\Signal\Sdk\ValidateLinksRequest;
use Apollo\Deploy\Signal\Sdk\ValidateLinksResponse;
use Psr\Http\Message\ResponseInterface;

/** EmailsAPI domain operations. */
class Emails
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param SendEmailRequest $input
     * @return SendEmailResponse
     * @throws SDKError
     */
    public function sendEmail(
        SendEmailRequest $input,
    ): SendEmailResponse
    {
        $path = '/v1/emails';

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
        if (is_array($data) && method_exists(SendEmailResponse::class, 'fromArray')) {
            return SendEmailResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $emailId
     * @return EmailDetailResponse
     * @throws SDKError
     */
    public function getEmail(
        string $emailId,
    ): EmailDetailResponse
    {
        $path = '/v1/emails/${emailId}';
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
     * @param BatchSendRequest $input
     * @return BatchSendResponse
     * @throws SDKError
     */
    public function batchSendEmails(
        BatchSendRequest $input,
    ): BatchSendResponse
    {
        $path = '/v1/emails/batch';

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
        if (is_array($data) && method_exists(BatchSendResponse::class, 'fromArray')) {
            return BatchSendResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $emailId
     * @return CancelResponse
     * @throws SDKError
     */
    public function cancelEmail(
        string $emailId,
    ): CancelResponse
    {
        $path = '/v1/emails/${emailId}';
        $path = str_replace('${emailId}', rawurlencode(Transport::wireValue($emailId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'DELETE',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(CancelResponse::class, 'fromArray')) {
            return CancelResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @return BulkCancelResponse
     * @throws SDKError
     */
    public function bulkCancelEmails(
    ): BulkCancelResponse
    {
        $path = '/v1/emails';

        $query = [];

        $headers = [];

        $request = [
            'method' => 'DELETE',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(BulkCancelResponse::class, 'fromArray')) {
            return BulkCancelResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @return StreamTokenResponse
     * @throws SDKError
     */
    public function issueStreamToken(
        string $projectId,
    ): StreamTokenResponse
    {
        $path = '/v1/emails/${projectId}/stream/token';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);

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
        if (is_array($data) && method_exists(StreamTokenResponse::class, 'fromArray')) {
            return StreamTokenResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @return \Generator<int, SSEEvent>
     * @throws SDKError
     */
    public function streamEmailEvents(
    ): \Generator
    {
        $path = '/v1/emails/stream';

        $query = [];

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
            'stream' => true,
        ];

        $response = $this->transport->executeRequest($request);
        // Transport::streamEvents enforces Transport::MAX_SSE_LINE_BYTES and
        // Transport::MAX_RESPONSE_BODY_BYTES while parsing the response.
        foreach ($this->transport->streamEvents($response) as $event) {
            yield $event;
        }
    }

    /**
     * @param ValidateLinksRequest $input
     * @return ValidateLinksResponse
     * @throws SDKError
     */
    public function validateLinks(
        ValidateLinksRequest $input,
    ): ValidateLinksResponse
    {
        $path = '/v1/emails/validate';

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
        if (is_array($data) && method_exists(ValidateLinksResponse::class, 'fromArray')) {
            return ValidateLinksResponse::fromArray($data);
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
