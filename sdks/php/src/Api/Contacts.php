<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\AddToSegmentBody;
use Apollo\Deploy\Signal\Sdk\ContactPageResponse;
use Apollo\Deploy\Signal\Sdk\ContactResponse;
use Apollo\Deploy\Signal\Sdk\CreateContactBody;
use Apollo\Deploy\Signal\Sdk\EmailValidationStatusResponse;
use Apollo\Deploy\Signal\Sdk\EngagementScoreResponse;
use Apollo\Deploy\Signal\Sdk\RecordValidationBody;
use Apollo\Deploy\Signal\Sdk\SetImageUrlBody;
use Apollo\Deploy\Signal\Sdk\UpdateContactBody;
use Apollo\Deploy\Signal\Sdk\UpdateTopicsBody;
use Psr\Http\Message\ResponseInterface;

/** ContactsAPI domain operations. */
class Contacts
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $projectId
     * @return ContactPageResponse
     * @throws SDKError
     */
    public function listContacts(
        string $projectId,
    ): ContactPageResponse
    {
        $path = '/v1/projects/${projectId}/contacts';
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
        if (is_array($data) && method_exists(ContactPageResponse::class, 'fromArray')) {
            return ContactPageResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return ContactResponse
     * @throws SDKError
     */
    public function getContact(
        string $projectId,
        string $contactId,
    ): ContactResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(ContactResponse::class, 'fromArray')) {
            return ContactResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return array
     * @throws SDKError
     */
    public function listContactSegments(
        string $projectId,
        string $contactId,
    ): array
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/segments';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        return is_array($data) ? $data : [];
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return array
     * @throws SDKError
     */
    public function getContactTopics(
        string $projectId,
        string $contactId,
    ): array
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/topics';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        return is_array($data) ? $data : [];
    }

    /**
     * @param string $projectId
     * @param CreateContactBody $input
     * @return ContactResponse
     * @throws SDKError
     */
    public function createContact(
        string $projectId,
        CreateContactBody $input,
    ): ContactResponse
    {
        $path = '/v1/projects/${projectId}/contacts';
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
        if (is_array($data) && method_exists(ContactResponse::class, 'fromArray')) {
            return ContactResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @param UpdateContactBody $input
     * @return ContactResponse
     * @throws SDKError
     */
    public function updateContact(
        string $projectId,
        string $contactId,
        UpdateContactBody $input,
    ): ContactResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(ContactResponse::class, 'fromArray')) {
            return ContactResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return void
     * @throws SDKError
     */
    public function deleteContact(
        string $projectId,
        string $contactId,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
     * @param string $contactId
     * @return ContactResponse
     * @throws SDKError
     */
    public function uploadContactImage(
        string $projectId,
        string $contactId,
    ): ContactResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/image';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(ContactResponse::class, 'fromArray')) {
            return ContactResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @param SetImageUrlBody $input
     * @return ContactResponse
     * @throws SDKError
     */
    public function setContactImageUrl(
        string $projectId,
        string $contactId,
        SetImageUrlBody $input,
    ): ContactResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/image';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

        $query = [];

        $headers = [];

        $request = [
            'method' => 'PUT',
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
        if (is_array($data) && method_exists(ContactResponse::class, 'fromArray')) {
            return ContactResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return void
     * @throws SDKError
     */
    public function deleteContactImage(
        string $projectId,
        string $contactId,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/image';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
     * @param string $contactId
     * @param AddToSegmentBody $input
     * @return void
     * @throws SDKError
     */
    public function addContactToSegment(
        string $projectId,
        string $contactId,
        AddToSegmentBody $input,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/segments';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        $this->transport->readResponseBody($response);
        return;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @param string $segmentId
     * @return void
     * @throws SDKError
     */
    public function removeContactFromSegment(
        string $projectId,
        string $contactId,
        string $segmentId,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/segments/${segmentId}';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);
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

    /**
     * @param string $projectId
     * @param string $contactId
     * @param UpdateTopicsBody $input
     * @return void
     * @throws SDKError
     */
    public function updateContactTopics(
        string $projectId,
        string $contactId,
        UpdateTopicsBody $input,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/topics';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        $this->transport->readResponseBody($response);
        return;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return array
     * @throws SDKError
     */
    public function getContactActivity(
        string $projectId,
        string $contactId,
    ): array
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/activity';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        return is_array($data) ? $data : [];
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return EngagementScoreResponse
     * @throws SDKError
     */
    public function getContactEngagementScore(
        string $projectId,
        string $contactId,
    ): EngagementScoreResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/engagement';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(EngagementScoreResponse::class, 'fromArray')) {
            return EngagementScoreResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return EmailValidationStatusResponse
     * @throws SDKError
     */
    public function getContactEmailValidationStatus(
        string $projectId,
        string $contactId,
    ): EmailValidationStatusResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/email-validation';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(EmailValidationStatusResponse::class, 'fromArray')) {
            return EmailValidationStatusResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @return EngagementScoreResponse
     * @throws SDKError
     */
    public function refreshContactEngagementScore(
        string $projectId,
        string $contactId,
    ): EngagementScoreResponse
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/engagement/refresh';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
        if (is_array($data) && method_exists(EngagementScoreResponse::class, 'fromArray')) {
            return EngagementScoreResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $projectId
     * @param string $contactId
     * @param RecordValidationBody $input
     * @return void
     * @throws SDKError
     */
    public function recordContactEmailValidation(
        string $projectId,
        string $contactId,
        RecordValidationBody $input,
    ): void
    {
        $path = '/v1/projects/${projectId}/contacts/${contactId}/email-validation';
        $path = str_replace('${projectId}', rawurlencode(Transport::wireValue($projectId)), $path);
        $path = str_replace('${contactId}', rawurlencode(Transport::wireValue($contactId)), $path);

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
