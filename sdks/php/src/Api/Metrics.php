<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk\Api;

use Apollo\Deploy\Signal\Sdk\SDKError;
use Apollo\Deploy\Signal\Sdk\SSEEvent;
use Apollo\Deploy\Signal\Sdk\Transport;
use Apollo\Deploy\Signal\Sdk\AdvisorReportResponse;
use Apollo\Deploy\Signal\Sdk\EmailPerformanceResponse;
use Apollo\Deploy\Signal\Sdk\EmailReadScrollAnalyticsResponse;
use Apollo\Deploy\Signal\Sdk\GetMetricsAdvisorQuery;
use Apollo\Deploy\Signal\Sdk\GetProjectMetricsSummaryQuery;
use Apollo\Deploy\Signal\Sdk\GetProjectMetricsTimelineQuery;
use Apollo\Deploy\Signal\Sdk\GetTopicPerformanceQuery;
use Apollo\Deploy\Signal\Sdk\ProjectMetricsSummaryResponse;
use Apollo\Deploy\Signal\Sdk\ProjectMetricsTimelineResponse;
use Apollo\Deploy\Signal\Sdk\TopicPerformanceResponse;
use Psr\Http\Message\ResponseInterface;

/** MetricsAPI domain operations. */
class Metrics
{
    public function __construct(private Transport $transport)
    {
    }

    /**
     * @param string $id
     * @param string|null $window Time window.
     * @param string|null $projectId Required for session auth; ignored for API key auth.
     * @return TopicPerformanceResponse
     * @throws SDKError
     */
    public function getTopicPerformance(
        string $id,
        ?string $window = null,
        ?string $projectId = null,
    ): TopicPerformanceResponse
    {
        $path = '/v1/metrics/topics/${id}';
        $path = str_replace('${id}', rawurlencode(Transport::wireValue($id)), $path);

        $query = [];
        if ($window !== null) {
            $query['window'] = $window;
        }
        if ($projectId !== null) {
            $query['projectId'] = $projectId;
        }

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(TopicPerformanceResponse::class, 'fromArray')) {
            return TopicPerformanceResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $id
     * @return EmailPerformanceResponse
     * @throws SDKError
     */
    public function getEmailPerformance(
        string $id,
    ): EmailPerformanceResponse
    {
        $path = '/v1/metrics/emails/${id}';
        $path = str_replace('${id}', rawurlencode(Transport::wireValue($id)), $path);

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
        if (is_array($data) && method_exists(EmailPerformanceResponse::class, 'fromArray')) {
            return EmailPerformanceResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string $id
     * @return EmailReadScrollAnalyticsResponse
     * @throws SDKError
     */
    public function getEmailEngagement(
        string $id,
    ): EmailReadScrollAnalyticsResponse
    {
        $path = '/v1/metrics/emails/${id}/engagement';
        $path = str_replace('${id}', rawurlencode(Transport::wireValue($id)), $path);

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
        if (is_array($data) && method_exists(EmailReadScrollAnalyticsResponse::class, 'fromArray')) {
            return EmailReadScrollAnalyticsResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string|null $window Metrics time window.
     * @param string|null $projectId Required for session auth; ignored for API key auth.
     * @return ProjectMetricsSummaryResponse
     * @throws SDKError
     */
    public function getProjectMetricsSummary(
        ?string $window = null,
        ?string $projectId = null,
    ): ProjectMetricsSummaryResponse
    {
        $path = '/v1/metrics/summary';

        $query = [];
        if ($window !== null) {
            $query['window'] = $window;
        }
        if ($projectId !== null) {
            $query['projectId'] = $projectId;
        }

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(ProjectMetricsSummaryResponse::class, 'fromArray')) {
            return ProjectMetricsSummaryResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string|null $window Metrics time window.
     * @param string|null $granularity `hour` or `day`.
     * @param string|null $format `compact` or `detailed`.
     * @param string|null $projectId Required for session auth; ignored for API key auth.
     * @return ProjectMetricsTimelineResponse
     * @throws SDKError
     */
    public function getProjectMetricsTimeline(
        ?string $window = null,
        ?string $granularity = null,
        ?string $format = null,
        ?string $projectId = null,
    ): ProjectMetricsTimelineResponse
    {
        $path = '/v1/metrics/timeline';

        $query = [];
        if ($window !== null) {
            $query['window'] = $window;
        }
        if ($granularity !== null) {
            $query['granularity'] = $granularity;
        }
        if ($format !== null) {
            $query['format'] = $format;
        }
        if ($projectId !== null) {
            $query['projectId'] = $projectId;
        }

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(ProjectMetricsTimelineResponse::class, 'fromArray')) {
            return ProjectMetricsTimelineResponse::fromArray($data);
        }
        return $data;
    }

    /**
     * @param string|null $projectId Required for session auth; ignored for API key auth.
     * @return AdvisorReportResponse
     * @throws SDKError
     */
    public function getMetricsAdvisor(
        ?string $projectId = null,
    ): AdvisorReportResponse
    {
        $path = '/v1/metrics/advisor';

        $query = [];
        if ($projectId !== null) {
            $query['projectId'] = $projectId;
        }

        $headers = [];

        $request = [
            'method' => 'GET',
            'path' => $path,
            'query' => $query,
            'headers' => $headers,
        ];

        $response = $this->transport->executeRequest($request);
        $data = $this->decodeResponse($response);
        if (is_array($data) && method_exists(AdvisorReportResponse::class, 'fromArray')) {
            return AdvisorReportResponse::fromArray($data);
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
