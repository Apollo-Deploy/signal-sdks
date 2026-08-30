<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk;

use Apollo\Deploy\Signal\Sdk\Api\Emails;
use Apollo\Deploy\Signal\Sdk\Api\Metrics;
use Apollo\Deploy\Signal\Sdk\Api\Suppressions;
use Apollo\Deploy\Signal\Sdk\Api\Segments;
use Apollo\Deploy\Signal\Sdk\Api\Topics;
use Apollo\Deploy\Signal\Sdk\Api\ContactProperties;
use Apollo\Deploy\Signal\Sdk\Api\Contacts;
use Apollo\Deploy\Signal\Sdk\Api\Webhooks;
use Apollo\Deploy\Signal\Sdk\Api\ApiKeys;
use Apollo\Deploy\Signal\Sdk\Api\Projects;
use Apollo\Deploy\Signal\Sdk\Api\SendingDomains;

/** Apollo Signal API SDK client. */
class Client
{
    private Transport $transport;

    /** @param array<string, mixed> $config */
    public function __construct(array $config = [])
    {
        $this->transport = new Transport($config);
    }

    public function getTransport(): Transport
    {
        return $this->transport;
    }

    private ?Emails $_emails = null;

    public function emails(): Emails
    {
        return $this->_emails ??= new Emails($this->transport);
    }

    private ?Metrics $_metrics = null;

    public function metrics(): Metrics
    {
        return $this->_metrics ??= new Metrics($this->transport);
    }

    private ?Suppressions $_suppressions = null;

    public function suppressions(): Suppressions
    {
        return $this->_suppressions ??= new Suppressions($this->transport);
    }

    private ?Segments $_segments = null;

    public function segments(): Segments
    {
        return $this->_segments ??= new Segments($this->transport);
    }

    private ?Topics $_topics = null;

    public function topics(): Topics
    {
        return $this->_topics ??= new Topics($this->transport);
    }

    private ?ContactProperties $_contactProperties = null;

    public function contactProperties(): ContactProperties
    {
        return $this->_contactProperties ??= new ContactProperties($this->transport);
    }

    private ?Contacts $_contacts = null;

    public function contacts(): Contacts
    {
        return $this->_contacts ??= new Contacts($this->transport);
    }

    private ?Webhooks $_webhooks = null;

    public function webhooks(): Webhooks
    {
        return $this->_webhooks ??= new Webhooks($this->transport);
    }

    private ?ApiKeys $_apiKeys = null;

    public function apiKeys(): ApiKeys
    {
        return $this->_apiKeys ??= new ApiKeys($this->transport);
    }

    private ?Projects $_projects = null;

    public function projects(): Projects
    {
        return $this->_projects ??= new Projects($this->transport);
    }

    private ?SendingDomains $_sendingDomains = null;

    public function sendingDomains(): SendingDomains
    {
        return $this->_sendingDomains ??= new SendingDomains($this->transport);
    }

}
