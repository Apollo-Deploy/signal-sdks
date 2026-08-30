<?php

declare(strict_types=1);

$apiKey = env('APOLLO_SIGNAL_API_KEY');

return [
    'baseUrl' => env('APOLLO_SIGNAL_BASE_URL', 'https://api.signal.apollodeploy.com'),
    'timeoutMs' => (int) env('APOLLO_SIGNAL_TIMEOUT_MS', 15000),
    'retries' => [
        'attempts' => (int) env('APOLLO_SIGNAL_RETRY_ATTEMPTS', 3),
        'backoffMs' => (int) env('APOLLO_SIGNAL_RETRY_BACKOFF_MS', 400),
        'jitter' => (bool) env('APOLLO_SIGNAL_RETRY_JITTER', true),
        'maxBackoffMs' => (int) env('APOLLO_SIGNAL_RETRY_MAX_BACKOFF_MS', 30000),
    ],
    'defaultHeaders' => is_string($apiKey) && $apiKey !== ''
        ? ['Authorization' => "Bearer {$apiKey}"]
        : [],
];
