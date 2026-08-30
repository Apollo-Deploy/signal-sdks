<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Sdk;

/** AttachmentRequest schema model. */
class AttachmentRequest
{
    /** @var string */
    public string $filename;
    /** @var string */
    public string $content;
    /** @var string */
    public string $contentType;
    /** @var string|null */
    public ?string $disposition = null;
    /** @var string|null */
    public ?string $contentId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('filename', $data)) {
            throw new \InvalidArgumentException('Missing required field: filename');
        }
        $instance->filename = $data['filename'] ?? null;
        if (!array_key_exists('content', $data)) {
            throw new \InvalidArgumentException('Missing required field: content');
        }
        $instance->content = $data['content'] ?? null;
        if (!array_key_exists('contentType', $data)) {
            throw new \InvalidArgumentException('Missing required field: contentType');
        }
        $instance->contentType = $data['contentType'] ?? null;
        $instance->disposition = $data['disposition'] ?? null;
        $instance->contentId = $data['contentId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'filename' => $this->filename,
            'content' => $this->content,
            'contentType' => $this->contentType,
            'disposition' => $this->disposition,
            'contentId' => $this->contentId,
        ];
    }
}

/** DeliveryWindowRequest schema model. */
class DeliveryWindowRequest
{
    /** @var string */
    public string $start;
    /** @var string */
    public string $end;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('start', $data)) {
            throw new \InvalidArgumentException('Missing required field: start');
        }
        $instance->start = $data['start'] ?? null;
        if (!array_key_exists('end', $data)) {
            throw new \InvalidArgumentException('Missing required field: end');
        }
        $instance->end = $data['end'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'start' => $this->start,
            'end' => $this->end,
        ];
    }
}

/** TrackingSettingsRequest schema model. */
class TrackingSettingsRequest
{
    /** @var bool|null */
    public ?bool $openTracking = null;
    /** @var bool|null */
    public ?bool $clickTracking = null;
    /** @var bool|null */
    public ?bool $unsubscribeTracking = null;
    /** @var bool|null */
    public ?bool $readEngagement = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->openTracking = $data['openTracking'] ?? null;
        $instance->clickTracking = $data['clickTracking'] ?? null;
        $instance->unsubscribeTracking = $data['unsubscribeTracking'] ?? null;
        $instance->readEngagement = $data['readEngagement'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'openTracking' => $this->openTracking,
            'clickTracking' => $this->clickTracking,
            'unsubscribeTracking' => $this->unsubscribeTracking,
            'readEngagement' => $this->readEngagement,
        ];
    }
}

/** SendEmailRequest schema model. */
class SendEmailRequest
{
    /** @var string */
    public string $from;
    /** @var list<string> */
    public array $to;
    /** @var list<string> */
    public ?array $cc = null;
    /** @var list<string> */
    public ?array $bcc = null;
    /** @var string|null */
    public ?string $replyTo = null;
    /** @var string|null */
    public ?string $subject = null;
    /** @var string|null */
    public ?string $html = null;
    /** @var string|null */
    public ?string $text = null;
    /** @var array<string, string> */
    public ?array $tags = null;
    /** @var array<string, string> */
    public ?array $metadata = null;
    /** @var string|null */
    public ?string $idempotencyKey = null;
    /** @var bool|null */
    public ?bool $testMode = null;
    /** @var list<AttachmentRequest> */
    public ?array $attachments = null;
    /** @var string|null */
    public ?string $scheduledAt = null;
    /** @var DeliveryWindowRequest|null */
    public ?DeliveryWindowRequest $deliveryWindow = null;
    /** @var string|null */
    public ?string $sendTimeCategory = null;
    /** @var TrackingSettingsRequest|null */
    public ?TrackingSettingsRequest $trackingSettings = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('from', $data)) {
            throw new \InvalidArgumentException('Missing required field: from');
        }
        $instance->from = $data['from'] ?? null;
        if (!array_key_exists('to', $data)) {
            throw new \InvalidArgumentException('Missing required field: to');
        }
        $instance->to = $data['to'] ?? null;
        $instance->cc = $data['cc'] ?? null;
        $instance->bcc = $data['bcc'] ?? null;
        $instance->replyTo = $data['replyTo'] ?? null;
        $instance->subject = $data['subject'] ?? null;
        $instance->html = $data['html'] ?? null;
        $instance->text = $data['text'] ?? null;
        $instance->tags = $data['tags'] ?? null;
        $instance->metadata = $data['metadata'] ?? null;
        $instance->idempotencyKey = $data['idempotencyKey'] ?? null;
        $instance->testMode = $data['testMode'] ?? null;
        $instance->attachments = $data['attachments'] ?? null;
        $instance->scheduledAt = $data['scheduledAt'] ?? null;
        $instance->deliveryWindow = $data['deliveryWindow'] ?? null;
        $instance->sendTimeCategory = $data['sendTimeCategory'] ?? null;
        $instance->trackingSettings = $data['trackingSettings'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'from' => $this->from,
            'to' => $this->to,
            'cc' => $this->cc,
            'bcc' => $this->bcc,
            'replyTo' => $this->replyTo,
            'subject' => $this->subject,
            'html' => $this->html,
            'text' => $this->text,
            'tags' => $this->tags,
            'metadata' => $this->metadata,
            'idempotencyKey' => $this->idempotencyKey,
            'testMode' => $this->testMode,
            'attachments' => $this->attachments,
            'scheduledAt' => $this->scheduledAt,
            'deliveryWindow' => $this->deliveryWindow,
            'sendTimeCategory' => $this->sendTimeCategory,
            'trackingSettings' => $this->trackingSettings,
        ];
    }
}

/** BatchSendItemResponse schema model. */
class BatchSendItemResponse
{
    /** @var int */
    public int $index;
    /** @var string|null */
    public ?string $id = null;
    /** @var string|null */
    public ?string $messageId = null;
    /** @var string|null */
    public ?string $status = null;
    /** @var string|null */
    public ?string $createdAt = null;
    /** @var string|null */
    public ?string $scheduledAt = null;
    /** @var string|null */
    public ?string $error = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('index', $data)) {
            throw new \InvalidArgumentException('Missing required field: index');
        }
        $instance->index = $data['index'] ?? null;
        $instance->id = $data['id'] ?? null;
        $instance->messageId = $data['messageId'] ?? null;
        $instance->status = $data['status'] ?? null;
        $instance->createdAt = $data['createdAt'] ?? null;
        $instance->scheduledAt = $data['scheduledAt'] ?? null;
        $instance->error = $data['error'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'index' => $this->index,
            'id' => $this->id,
            'messageId' => $this->messageId,
            'status' => $this->status,
            'createdAt' => $this->createdAt,
            'scheduledAt' => $this->scheduledAt,
            'error' => $this->error,
        ];
    }
}

/** SendEmailResponse schema model. */
class SendEmailResponse
{
    /** @var string */
    public string $id;
    /** @var string|null */
    public ?string $messageId;
    /** @var string */
    public string $status;
    /** @var string */
    public string $createdAt;
    /** @var string|null */
    public ?string $scheduledAt = null;
    /** @var string|null */
    public ?string $audienceId = null;
    /** @var list<BatchSendItemResponse> */
    public ?array $messages = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('messageId', $data)) {
            throw new \InvalidArgumentException('Missing required field: messageId');
        }
        $instance->messageId = $data['messageId'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        $instance->scheduledAt = $data['scheduledAt'] ?? null;
        $instance->audienceId = $data['audienceId'] ?? null;
        $instance->messages = $data['messages'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'messageId' => $this->messageId,
            'status' => $this->status,
            'createdAt' => $this->createdAt,
            'scheduledAt' => $this->scheduledAt,
            'audienceId' => $this->audienceId,
            'messages' => $this->messages,
        ];
    }
}

/** EmailDetailResponse schema model. */
class EmailDetailResponse
{
    /** @var string */
    public string $id;
    /** @var string|null */
    public ?string $messageId;
    /** @var string */
    public string $from;
    /** @var list<string> */
    public array $to;
    /** @var list<string> */
    public ?array $cc;
    /** @var list<string> */
    public ?array $bcc;
    /** @var string|null */
    public ?string $replyTo;
    /** @var string */
    public string $subject;
    /** @var string|null */
    public ?string $html = null;
    /** @var string|null */
    public ?string $text = null;
    /** @var string */
    public string $status;
    /** @var string|null */
    public ?string $error;
    /** @var array<string, string> */
    public ?array $tags;
    /** @var array<string, string> */
    public ?array $metadata;
    /** @var bool */
    public bool $testMode;
    /** @var string|null */
    public ?string $topicId = null;
    /** @var string */
    public string $createdAt;
    /** @var string|null */
    public ?string $sentAt;
    /** @var string|null */
    public ?string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('messageId', $data)) {
            throw new \InvalidArgumentException('Missing required field: messageId');
        }
        $instance->messageId = $data['messageId'] ?? null;
        if (!array_key_exists('from', $data)) {
            throw new \InvalidArgumentException('Missing required field: from');
        }
        $instance->from = $data['from'] ?? null;
        if (!array_key_exists('to', $data)) {
            throw new \InvalidArgumentException('Missing required field: to');
        }
        $instance->to = $data['to'] ?? null;
        if (!array_key_exists('cc', $data)) {
            throw new \InvalidArgumentException('Missing required field: cc');
        }
        $instance->cc = $data['cc'] ?? null;
        if (!array_key_exists('bcc', $data)) {
            throw new \InvalidArgumentException('Missing required field: bcc');
        }
        $instance->bcc = $data['bcc'] ?? null;
        if (!array_key_exists('replyTo', $data)) {
            throw new \InvalidArgumentException('Missing required field: replyTo');
        }
        $instance->replyTo = $data['replyTo'] ?? null;
        if (!array_key_exists('subject', $data)) {
            throw new \InvalidArgumentException('Missing required field: subject');
        }
        $instance->subject = $data['subject'] ?? null;
        $instance->html = $data['html'] ?? null;
        $instance->text = $data['text'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('error', $data)) {
            throw new \InvalidArgumentException('Missing required field: error');
        }
        $instance->error = $data['error'] ?? null;
        if (!array_key_exists('tags', $data)) {
            throw new \InvalidArgumentException('Missing required field: tags');
        }
        $instance->tags = $data['tags'] ?? null;
        if (!array_key_exists('metadata', $data)) {
            throw new \InvalidArgumentException('Missing required field: metadata');
        }
        $instance->metadata = $data['metadata'] ?? null;
        if (!array_key_exists('testMode', $data)) {
            throw new \InvalidArgumentException('Missing required field: testMode');
        }
        $instance->testMode = $data['testMode'] ?? null;
        $instance->topicId = $data['topicId'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('sentAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: sentAt');
        }
        $instance->sentAt = $data['sentAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'messageId' => $this->messageId,
            'from' => $this->from,
            'to' => $this->to,
            'cc' => $this->cc,
            'bcc' => $this->bcc,
            'replyTo' => $this->replyTo,
            'subject' => $this->subject,
            'html' => $this->html,
            'text' => $this->text,
            'status' => $this->status,
            'error' => $this->error,
            'tags' => $this->tags,
            'metadata' => $this->metadata,
            'testMode' => $this->testMode,
            'topicId' => $this->topicId,
            'createdAt' => $this->createdAt,
            'sentAt' => $this->sentAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** BatchSendRequest schema model. */
class BatchSendRequest
{
    /** @var list<SendEmailRequest> */
    public array $items;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('items', $data)) {
            throw new \InvalidArgumentException('Missing required field: items');
        }
        $instance->items = $data['items'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'items' => $this->items,
        ];
    }
}

/** BatchSendResponse schema model. */
class BatchSendResponse
{
    /** @var list<BatchSendItemResponse> */
    public array $results;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('results', $data)) {
            throw new \InvalidArgumentException('Missing required field: results');
        }
        $instance->results = $data['results'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'results' => $this->results,
        ];
    }
}

/** CancelResponse schema model. */
class CancelResponse
{
    /** @var bool|null */
    public ?bool $cancelled = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->cancelled = $data['cancelled'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'cancelled' => $this->cancelled,
        ];
    }
}

/** BulkCancelResponse schema model. */
class BulkCancelResponse
{
    /** @var int */
    public int $cancelled;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('cancelled', $data)) {
            throw new \InvalidArgumentException('Missing required field: cancelled');
        }
        $instance->cancelled = $data['cancelled'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'cancelled' => $this->cancelled,
        ];
    }
}

/** StreamTokenResponse schema model. */
class StreamTokenResponse
{
    /** @var string */
    public string $token;
    /** @var string */
    public string $expiresAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('token', $data)) {
            throw new \InvalidArgumentException('Missing required field: token');
        }
        $instance->token = $data['token'] ?? null;
        if (!array_key_exists('expiresAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: expiresAt');
        }
        $instance->expiresAt = $data['expiresAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'token' => $this->token,
            'expiresAt' => $this->expiresAt,
        ];
    }
}

/** StreamEventResponse schema model. */
class StreamEventResponse
{
    /** @var string */
    public string $type;
    /** @var string */
    public string $emailId;
    /** @var string */
    public string $occurredAt;
    /** @var array<string, string>|null */
    public ?array $data = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('emailId', $data)) {
            throw new \InvalidArgumentException('Missing required field: emailId');
        }
        $instance->emailId = $data['emailId'] ?? null;
        if (!array_key_exists('occurredAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: occurredAt');
        }
        $instance->occurredAt = $data['occurredAt'] ?? null;
        $instance->data = $data['data'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'type' => $this->type,
            'emailId' => $this->emailId,
            'occurredAt' => $this->occurredAt,
            'data' => $this->data,
        ];
    }
}

/** ValidateLinksRequest schema model. */
class ValidateLinksRequest
{
    /** @var string|null */
    public ?string $html = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->html = $data['html'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'html' => $this->html,
        ];
    }
}

/** LinkResultItem schema model. */
class LinkResultItem
{
    /** @var string */
    public string $url;
    /** @var string */
    public string $status;
    /** @var int|null */
    public ?int $statusCode = null;
    /** @var string|null */
    public ?string $error = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('url', $data)) {
            throw new \InvalidArgumentException('Missing required field: url');
        }
        $instance->url = $data['url'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        $instance->statusCode = $data['statusCode'] ?? null;
        $instance->error = $data['error'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'url' => $this->url,
            'status' => $this->status,
            'statusCode' => $this->statusCode,
            'error' => $this->error,
        ];
    }
}

/** ValidateLinksResponse schema model. */
class ValidateLinksResponse
{
    /** @var list<LinkResultItem> */
    public array $links;
    /** @var int */
    public int $totalLinks;
    /** @var int */
    public int $brokenLinks;
    /** @var int */
    public int $errorLinks;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('links', $data)) {
            throw new \InvalidArgumentException('Missing required field: links');
        }
        $instance->links = $data['links'] ?? null;
        if (!array_key_exists('totalLinks', $data)) {
            throw new \InvalidArgumentException('Missing required field: totalLinks');
        }
        $instance->totalLinks = $data['totalLinks'] ?? null;
        if (!array_key_exists('brokenLinks', $data)) {
            throw new \InvalidArgumentException('Missing required field: brokenLinks');
        }
        $instance->brokenLinks = $data['brokenLinks'] ?? null;
        if (!array_key_exists('errorLinks', $data)) {
            throw new \InvalidArgumentException('Missing required field: errorLinks');
        }
        $instance->errorLinks = $data['errorLinks'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'links' => $this->links,
            'totalLinks' => $this->totalLinks,
            'brokenLinks' => $this->brokenLinks,
            'errorLinks' => $this->errorLinks,
        ];
    }
}

/** MetricsWindowResponse schema model. */
class MetricsWindowResponse
{
    /** @var string */
    public string $from;
    /** @var string */
    public string $to;
    /** @var string */
    public string $label;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('from', $data)) {
            throw new \InvalidArgumentException('Missing required field: from');
        }
        $instance->from = $data['from'] ?? null;
        if (!array_key_exists('to', $data)) {
            throw new \InvalidArgumentException('Missing required field: to');
        }
        $instance->to = $data['to'] ?? null;
        if (!array_key_exists('label', $data)) {
            throw new \InvalidArgumentException('Missing required field: label');
        }
        $instance->label = $data['label'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'from' => $this->from,
            'to' => $this->to,
            'label' => $this->label,
        ];
    }
}

/** TopicPerformanceResponse schema model. */
class TopicPerformanceResponse
{
    /** @var string */
    public string $topicId;
    /** @var string */
    public string $topicName;
    /** @var MetricsWindowResponse */
    public MetricsWindowResponse $window;
    /** @var int */
    public int $totalEmails;
    /** @var int */
    public int $delivered;
    /** @var float */
    public float $deliveryRate;
    /** @var int */
    public int $opened;
    /** @var float */
    public float $openRate;
    /** @var int */
    public int $clicked;
    /** @var float */
    public float $clickRate;
    /** @var int */
    public int $bounced;
    /** @var float */
    public float $bounceRate;
    /** @var int */
    public int $complained;
    /** @var float */
    public float $complaintRate;
    /** @var int */
    public int $unsubscribed;
    /** @var float */
    public float $unsubscribeRate;
    /** @var int */
    public int $readEngaged;
    /** @var float */
    public float $readEngagementRate;
    /** @var float|null */
    public ?float $avgReadTimeSeconds;
    /** @var int */
    public int $optInCount;
    /** @var int */
    public int $optOutCount;
    /** @var string */
    public string $computedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('topicId', $data)) {
            throw new \InvalidArgumentException('Missing required field: topicId');
        }
        $instance->topicId = $data['topicId'] ?? null;
        if (!array_key_exists('topicName', $data)) {
            throw new \InvalidArgumentException('Missing required field: topicName');
        }
        $instance->topicName = $data['topicName'] ?? null;
        if (!array_key_exists('window', $data)) {
            throw new \InvalidArgumentException('Missing required field: window');
        }
        $instance->window = $data['window'] ?? null;
        if (!array_key_exists('totalEmails', $data)) {
            throw new \InvalidArgumentException('Missing required field: totalEmails');
        }
        $instance->totalEmails = $data['totalEmails'] ?? null;
        if (!array_key_exists('delivered', $data)) {
            throw new \InvalidArgumentException('Missing required field: delivered');
        }
        $instance->delivered = $data['delivered'] ?? null;
        if (!array_key_exists('deliveryRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: deliveryRate');
        }
        $instance->deliveryRate = $data['deliveryRate'] ?? null;
        if (!array_key_exists('opened', $data)) {
            throw new \InvalidArgumentException('Missing required field: opened');
        }
        $instance->opened = $data['opened'] ?? null;
        if (!array_key_exists('openRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: openRate');
        }
        $instance->openRate = $data['openRate'] ?? null;
        if (!array_key_exists('clicked', $data)) {
            throw new \InvalidArgumentException('Missing required field: clicked');
        }
        $instance->clicked = $data['clicked'] ?? null;
        if (!array_key_exists('clickRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: clickRate');
        }
        $instance->clickRate = $data['clickRate'] ?? null;
        if (!array_key_exists('bounced', $data)) {
            throw new \InvalidArgumentException('Missing required field: bounced');
        }
        $instance->bounced = $data['bounced'] ?? null;
        if (!array_key_exists('bounceRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: bounceRate');
        }
        $instance->bounceRate = $data['bounceRate'] ?? null;
        if (!array_key_exists('complained', $data)) {
            throw new \InvalidArgumentException('Missing required field: complained');
        }
        $instance->complained = $data['complained'] ?? null;
        if (!array_key_exists('complaintRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: complaintRate');
        }
        $instance->complaintRate = $data['complaintRate'] ?? null;
        if (!array_key_exists('unsubscribed', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribed');
        }
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        if (!array_key_exists('unsubscribeRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribeRate');
        }
        $instance->unsubscribeRate = $data['unsubscribeRate'] ?? null;
        if (!array_key_exists('readEngaged', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngaged');
        }
        $instance->readEngaged = $data['readEngaged'] ?? null;
        if (!array_key_exists('readEngagementRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngagementRate');
        }
        $instance->readEngagementRate = $data['readEngagementRate'] ?? null;
        if (!array_key_exists('avgReadTimeSeconds', $data)) {
            throw new \InvalidArgumentException('Missing required field: avgReadTimeSeconds');
        }
        $instance->avgReadTimeSeconds = $data['avgReadTimeSeconds'] ?? null;
        if (!array_key_exists('optInCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: optInCount');
        }
        $instance->optInCount = $data['optInCount'] ?? null;
        if (!array_key_exists('optOutCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: optOutCount');
        }
        $instance->optOutCount = $data['optOutCount'] ?? null;
        if (!array_key_exists('computedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: computedAt');
        }
        $instance->computedAt = $data['computedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'topicId' => $this->topicId,
            'topicName' => $this->topicName,
            'window' => $this->window,
            'totalEmails' => $this->totalEmails,
            'delivered' => $this->delivered,
            'deliveryRate' => $this->deliveryRate,
            'opened' => $this->opened,
            'openRate' => $this->openRate,
            'clicked' => $this->clicked,
            'clickRate' => $this->clickRate,
            'bounced' => $this->bounced,
            'bounceRate' => $this->bounceRate,
            'complained' => $this->complained,
            'complaintRate' => $this->complaintRate,
            'unsubscribed' => $this->unsubscribed,
            'unsubscribeRate' => $this->unsubscribeRate,
            'readEngaged' => $this->readEngaged,
            'readEngagementRate' => $this->readEngagementRate,
            'avgReadTimeSeconds' => $this->avgReadTimeSeconds,
            'optInCount' => $this->optInCount,
            'optOutCount' => $this->optOutCount,
            'computedAt' => $this->computedAt,
        ];
    }
}

/** EmailPerformanceResponse schema model. */
class EmailPerformanceResponse
{
    /** @var string */
    public string $emailId;
    /** @var string */
    public string $subject;
    /** @var string */
    public string $fromAddress;
    /** @var string|null */
    public ?string $topicId;
    /** @var string */
    public string $status;
    /** @var bool */
    public bool $delivered;
    /** @var bool */
    public bool $opened;
    /** @var bool */
    public bool $clicked;
    /** @var int */
    public int $totalClicks;
    /** @var bool */
    public bool $bounced;
    /** @var bool */
    public bool $complained;
    /** @var bool */
    public bool $unsubscribed;
    /** @var bool */
    public bool $readEngaged;
    /** @var float|null */
    public ?float $readTimeSeconds;
    /** @var string|null */
    public ?string $readCategory;
    /** @var string|null */
    public ?string $sentAt;
    /** @var string|null */
    public ?string $lastEventAt;
    /** @var string */
    public string $computedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('emailId', $data)) {
            throw new \InvalidArgumentException('Missing required field: emailId');
        }
        $instance->emailId = $data['emailId'] ?? null;
        if (!array_key_exists('subject', $data)) {
            throw new \InvalidArgumentException('Missing required field: subject');
        }
        $instance->subject = $data['subject'] ?? null;
        if (!array_key_exists('fromAddress', $data)) {
            throw new \InvalidArgumentException('Missing required field: fromAddress');
        }
        $instance->fromAddress = $data['fromAddress'] ?? null;
        if (!array_key_exists('topicId', $data)) {
            throw new \InvalidArgumentException('Missing required field: topicId');
        }
        $instance->topicId = $data['topicId'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('delivered', $data)) {
            throw new \InvalidArgumentException('Missing required field: delivered');
        }
        $instance->delivered = $data['delivered'] ?? null;
        if (!array_key_exists('opened', $data)) {
            throw new \InvalidArgumentException('Missing required field: opened');
        }
        $instance->opened = $data['opened'] ?? null;
        if (!array_key_exists('clicked', $data)) {
            throw new \InvalidArgumentException('Missing required field: clicked');
        }
        $instance->clicked = $data['clicked'] ?? null;
        if (!array_key_exists('totalClicks', $data)) {
            throw new \InvalidArgumentException('Missing required field: totalClicks');
        }
        $instance->totalClicks = $data['totalClicks'] ?? null;
        if (!array_key_exists('bounced', $data)) {
            throw new \InvalidArgumentException('Missing required field: bounced');
        }
        $instance->bounced = $data['bounced'] ?? null;
        if (!array_key_exists('complained', $data)) {
            throw new \InvalidArgumentException('Missing required field: complained');
        }
        $instance->complained = $data['complained'] ?? null;
        if (!array_key_exists('unsubscribed', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribed');
        }
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        if (!array_key_exists('readEngaged', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngaged');
        }
        $instance->readEngaged = $data['readEngaged'] ?? null;
        if (!array_key_exists('readTimeSeconds', $data)) {
            throw new \InvalidArgumentException('Missing required field: readTimeSeconds');
        }
        $instance->readTimeSeconds = $data['readTimeSeconds'] ?? null;
        if (!array_key_exists('readCategory', $data)) {
            throw new \InvalidArgumentException('Missing required field: readCategory');
        }
        $instance->readCategory = $data['readCategory'] ?? null;
        if (!array_key_exists('sentAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: sentAt');
        }
        $instance->sentAt = $data['sentAt'] ?? null;
        if (!array_key_exists('lastEventAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastEventAt');
        }
        $instance->lastEventAt = $data['lastEventAt'] ?? null;
        if (!array_key_exists('computedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: computedAt');
        }
        $instance->computedAt = $data['computedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'emailId' => $this->emailId,
            'subject' => $this->subject,
            'fromAddress' => $this->fromAddress,
            'topicId' => $this->topicId,
            'status' => $this->status,
            'delivered' => $this->delivered,
            'opened' => $this->opened,
            'clicked' => $this->clicked,
            'totalClicks' => $this->totalClicks,
            'bounced' => $this->bounced,
            'complained' => $this->complained,
            'unsubscribed' => $this->unsubscribed,
            'readEngaged' => $this->readEngaged,
            'readTimeSeconds' => $this->readTimeSeconds,
            'readCategory' => $this->readCategory,
            'sentAt' => $this->sentAt,
            'lastEventAt' => $this->lastEventAt,
            'computedAt' => $this->computedAt,
        ];
    }
}

/** EmailReadScrollAnalyticsResponse schema model. */
class EmailReadScrollAnalyticsResponse
{
    /** @var string */
    public string $emailId;
    /** @var string */
    public string $subject;
    /** @var string */
    public string $computedAt;
    /** @var bool */
    public bool $readEngaged;
    /** @var float|null */
    public ?float $readTimeSeconds;
    /** @var string|null */
    public ?string $readCategory;
    /** @var string|null */
    public ?string $mailClient;
    /** @var string|null */
    public ?string $deviceType;
    /** @var string|null */
    public ?string $os;
    /** @var string|null */
    public ?string $readEngagedAt;
    /** @var bool */
    public bool $shortEmail;
    /** @var int */
    public int $depth25Count;
    /** @var int */
    public int $depth50Count;
    /** @var int */
    public int $depth75Count;
    /** @var int */
    public int $depth100Count;
    /** @var int|null */
    public ?int $maxDepthPct;
    /** @var float|null */
    public ?float $depth25Rate;
    /** @var float|null */
    public ?float $depth50Rate;
    /** @var float|null */
    public ?float $depth75Rate;
    /** @var float|null */
    public ?float $depth100Rate;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('emailId', $data)) {
            throw new \InvalidArgumentException('Missing required field: emailId');
        }
        $instance->emailId = $data['emailId'] ?? null;
        if (!array_key_exists('subject', $data)) {
            throw new \InvalidArgumentException('Missing required field: subject');
        }
        $instance->subject = $data['subject'] ?? null;
        if (!array_key_exists('computedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: computedAt');
        }
        $instance->computedAt = $data['computedAt'] ?? null;
        if (!array_key_exists('readEngaged', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngaged');
        }
        $instance->readEngaged = $data['readEngaged'] ?? null;
        if (!array_key_exists('readTimeSeconds', $data)) {
            throw new \InvalidArgumentException('Missing required field: readTimeSeconds');
        }
        $instance->readTimeSeconds = $data['readTimeSeconds'] ?? null;
        if (!array_key_exists('readCategory', $data)) {
            throw new \InvalidArgumentException('Missing required field: readCategory');
        }
        $instance->readCategory = $data['readCategory'] ?? null;
        if (!array_key_exists('mailClient', $data)) {
            throw new \InvalidArgumentException('Missing required field: mailClient');
        }
        $instance->mailClient = $data['mailClient'] ?? null;
        if (!array_key_exists('deviceType', $data)) {
            throw new \InvalidArgumentException('Missing required field: deviceType');
        }
        $instance->deviceType = $data['deviceType'] ?? null;
        if (!array_key_exists('os', $data)) {
            throw new \InvalidArgumentException('Missing required field: os');
        }
        $instance->os = $data['os'] ?? null;
        if (!array_key_exists('readEngagedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngagedAt');
        }
        $instance->readEngagedAt = $data['readEngagedAt'] ?? null;
        if (!array_key_exists('shortEmail', $data)) {
            throw new \InvalidArgumentException('Missing required field: shortEmail');
        }
        $instance->shortEmail = $data['shortEmail'] ?? null;
        if (!array_key_exists('depth25Count', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth25Count');
        }
        $instance->depth25Count = $data['depth25Count'] ?? null;
        if (!array_key_exists('depth50Count', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth50Count');
        }
        $instance->depth50Count = $data['depth50Count'] ?? null;
        if (!array_key_exists('depth75Count', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth75Count');
        }
        $instance->depth75Count = $data['depth75Count'] ?? null;
        if (!array_key_exists('depth100Count', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth100Count');
        }
        $instance->depth100Count = $data['depth100Count'] ?? null;
        if (!array_key_exists('maxDepthPct', $data)) {
            throw new \InvalidArgumentException('Missing required field: maxDepthPct');
        }
        $instance->maxDepthPct = $data['maxDepthPct'] ?? null;
        if (!array_key_exists('depth25Rate', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth25Rate');
        }
        $instance->depth25Rate = $data['depth25Rate'] ?? null;
        if (!array_key_exists('depth50Rate', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth50Rate');
        }
        $instance->depth50Rate = $data['depth50Rate'] ?? null;
        if (!array_key_exists('depth75Rate', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth75Rate');
        }
        $instance->depth75Rate = $data['depth75Rate'] ?? null;
        if (!array_key_exists('depth100Rate', $data)) {
            throw new \InvalidArgumentException('Missing required field: depth100Rate');
        }
        $instance->depth100Rate = $data['depth100Rate'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'emailId' => $this->emailId,
            'subject' => $this->subject,
            'computedAt' => $this->computedAt,
            'readEngaged' => $this->readEngaged,
            'readTimeSeconds' => $this->readTimeSeconds,
            'readCategory' => $this->readCategory,
            'mailClient' => $this->mailClient,
            'deviceType' => $this->deviceType,
            'os' => $this->os,
            'readEngagedAt' => $this->readEngagedAt,
            'shortEmail' => $this->shortEmail,
            'depth25Count' => $this->depth25Count,
            'depth50Count' => $this->depth50Count,
            'depth75Count' => $this->depth75Count,
            'depth100Count' => $this->depth100Count,
            'maxDepthPct' => $this->maxDepthPct,
            'depth25Rate' => $this->depth25Rate,
            'depth50Rate' => $this->depth50Rate,
            'depth75Rate' => $this->depth75Rate,
            'depth100Rate' => $this->depth100Rate,
        ];
    }
}

/** ProjectMetricsSummaryResponse schema model. */
class ProjectMetricsSummaryResponse
{
    /** @var string */
    public string $projectId;
    /** @var MetricsWindowResponse */
    public MetricsWindowResponse $window;
    /** @var int */
    public int $sent;
    /** @var int */
    public int $delivered;
    /** @var int */
    public int $opened;
    /** @var int */
    public int $clicked;
    /** @var int */
    public int $bounced;
    /** @var int */
    public int $complained;
    /** @var int */
    public int $failed;
    /** @var int */
    public int $unsubscribed;
    /** @var int */
    public int $readEngaged;
    /** @var float */
    public float $deliveryRate;
    /** @var float */
    public float $openRate;
    /** @var float */
    public float $clickRate;
    /** @var float */
    public float $bounceRate;
    /** @var float */
    public float $complaintRate;
    /** @var float */
    public float $readEngagementRate;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('window', $data)) {
            throw new \InvalidArgumentException('Missing required field: window');
        }
        $instance->window = $data['window'] ?? null;
        if (!array_key_exists('sent', $data)) {
            throw new \InvalidArgumentException('Missing required field: sent');
        }
        $instance->sent = $data['sent'] ?? null;
        if (!array_key_exists('delivered', $data)) {
            throw new \InvalidArgumentException('Missing required field: delivered');
        }
        $instance->delivered = $data['delivered'] ?? null;
        if (!array_key_exists('opened', $data)) {
            throw new \InvalidArgumentException('Missing required field: opened');
        }
        $instance->opened = $data['opened'] ?? null;
        if (!array_key_exists('clicked', $data)) {
            throw new \InvalidArgumentException('Missing required field: clicked');
        }
        $instance->clicked = $data['clicked'] ?? null;
        if (!array_key_exists('bounced', $data)) {
            throw new \InvalidArgumentException('Missing required field: bounced');
        }
        $instance->bounced = $data['bounced'] ?? null;
        if (!array_key_exists('complained', $data)) {
            throw new \InvalidArgumentException('Missing required field: complained');
        }
        $instance->complained = $data['complained'] ?? null;
        if (!array_key_exists('failed', $data)) {
            throw new \InvalidArgumentException('Missing required field: failed');
        }
        $instance->failed = $data['failed'] ?? null;
        if (!array_key_exists('unsubscribed', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribed');
        }
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        if (!array_key_exists('readEngaged', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngaged');
        }
        $instance->readEngaged = $data['readEngaged'] ?? null;
        if (!array_key_exists('deliveryRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: deliveryRate');
        }
        $instance->deliveryRate = $data['deliveryRate'] ?? null;
        if (!array_key_exists('openRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: openRate');
        }
        $instance->openRate = $data['openRate'] ?? null;
        if (!array_key_exists('clickRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: clickRate');
        }
        $instance->clickRate = $data['clickRate'] ?? null;
        if (!array_key_exists('bounceRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: bounceRate');
        }
        $instance->bounceRate = $data['bounceRate'] ?? null;
        if (!array_key_exists('complaintRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: complaintRate');
        }
        $instance->complaintRate = $data['complaintRate'] ?? null;
        if (!array_key_exists('readEngagementRate', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngagementRate');
        }
        $instance->readEngagementRate = $data['readEngagementRate'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'projectId' => $this->projectId,
            'window' => $this->window,
            'sent' => $this->sent,
            'delivered' => $this->delivered,
            'opened' => $this->opened,
            'clicked' => $this->clicked,
            'bounced' => $this->bounced,
            'complained' => $this->complained,
            'failed' => $this->failed,
            'unsubscribed' => $this->unsubscribed,
            'readEngaged' => $this->readEngaged,
            'deliveryRate' => $this->deliveryRate,
            'openRate' => $this->openRate,
            'clickRate' => $this->clickRate,
            'bounceRate' => $this->bounceRate,
            'complaintRate' => $this->complaintRate,
            'readEngagementRate' => $this->readEngagementRate,
        ];
    }
}

/** ProjectTimelineBucketResponse schema model. */
class ProjectTimelineBucketResponse
{
    /** @var string */
    public string $bucket;
    /** @var string */
    public string $type;
    /** @var int */
    public int $count;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('bucket', $data)) {
            throw new \InvalidArgumentException('Missing required field: bucket');
        }
        $instance->bucket = $data['bucket'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('count', $data)) {
            throw new \InvalidArgumentException('Missing required field: count');
        }
        $instance->count = $data['count'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'bucket' => $this->bucket,
            'type' => $this->type,
            'count' => $this->count,
        ];
    }
}

/** ProjectMetricsTimelineResponse schema model. */
class ProjectMetricsTimelineResponse
{
    /** @var string */
    public string $projectId;
    /** @var MetricsWindowResponse */
    public MetricsWindowResponse $window;
    /** @var string */
    public string $granularity;
    /** @var string */
    public string $format;
    /** @var list<ProjectTimelineBucketResponse> */
    public array $buckets;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('window', $data)) {
            throw new \InvalidArgumentException('Missing required field: window');
        }
        $instance->window = $data['window'] ?? null;
        if (!array_key_exists('granularity', $data)) {
            throw new \InvalidArgumentException('Missing required field: granularity');
        }
        $instance->granularity = $data['granularity'] ?? null;
        if (!array_key_exists('format', $data)) {
            throw new \InvalidArgumentException('Missing required field: format');
        }
        $instance->format = $data['format'] ?? null;
        if (!array_key_exists('buckets', $data)) {
            throw new \InvalidArgumentException('Missing required field: buckets');
        }
        $instance->buckets = $data['buckets'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'projectId' => $this->projectId,
            'window' => $this->window,
            'granularity' => $this->granularity,
            'format' => $this->format,
            'buckets' => $this->buckets,
        ];
    }
}

/** AdvisorRecommendationDataResponse schema model. */
class AdvisorRecommendationDataResponse
{
    /** @var float|null */
    public ?float $bounceRate = null;
    /** @var int|null */
    public ?int $bounced = null;
    /** @var int|null */
    public ?int $accepted = null;
    /** @var float|null */
    public ?float $complaintRate = null;
    /** @var int|null */
    public ?int $accepted24h = null;
    /** @var int|null */
    public ?int $avgDailyAccepted7d = null;
    /** @var int|null */
    public ?int $daysSinceLastSend = null;
    /** @var float|null */
    public ?float $reportedOpenRate = null;
    /** @var float|null */
    public ?float $adjustedOpenRate = null;
    /** @var float|null */
    public ?float $proxyRate = null;
    /** @var int|null */
    public ?int $proxyOpens = null;
    /** @var int|null */
    public ?int $totalOpens = null;
    /** @var float|null */
    public ?float $humanOpenRate = null;
    /** @var int|null */
    public ?int $delivered = null;
    /** @var float|null */
    public ?float $unsubRate = null;
    /** @var int|null */
    public ?int $unsubscribed = null;
    /** @var float|null */
    public ?float $dmarcAlignmentFailureRate7d = null;
    /** @var string|null */
    public ?string $dmarcDomain = null;
    /** @var string|null */
    public ?string $dmarcCurrentPolicy = null;
    /** @var string|null */
    public ?string $dmarcRecommendedPolicy = null;
    /** @var int|null */
    public ?int $dmarcObservedMessages = null;
    /** @var int|null */
    public ?int $dmarcAlignedMessages = null;
    /** @var float|null */
    public ?float $dmarcAccountedRate = null;
    /** @var int|null */
    public ?int $dmarcUnknownMessages = null;
    /** @var int|null */
    public ?int $dmarcUnknownSources = null;
    /** @var int|null */
    public ?int $dmarcReportingDays = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->bounceRate = $data['bounceRate'] ?? null;
        $instance->bounced = $data['bounced'] ?? null;
        $instance->accepted = $data['accepted'] ?? null;
        $instance->complaintRate = $data['complaintRate'] ?? null;
        $instance->accepted24h = $data['accepted24h'] ?? null;
        $instance->avgDailyAccepted7d = $data['avgDailyAccepted7d'] ?? null;
        $instance->daysSinceLastSend = $data['daysSinceLastSend'] ?? null;
        $instance->reportedOpenRate = $data['reportedOpenRate'] ?? null;
        $instance->adjustedOpenRate = $data['adjustedOpenRate'] ?? null;
        $instance->proxyRate = $data['proxyRate'] ?? null;
        $instance->proxyOpens = $data['proxyOpens'] ?? null;
        $instance->totalOpens = $data['totalOpens'] ?? null;
        $instance->humanOpenRate = $data['humanOpenRate'] ?? null;
        $instance->delivered = $data['delivered'] ?? null;
        $instance->unsubRate = $data['unsubRate'] ?? null;
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        $instance->dmarcAlignmentFailureRate7d = $data['dmarcAlignmentFailureRate7d'] ?? null;
        $instance->dmarcDomain = $data['dmarcDomain'] ?? null;
        $instance->dmarcCurrentPolicy = $data['dmarcCurrentPolicy'] ?? null;
        $instance->dmarcRecommendedPolicy = $data['dmarcRecommendedPolicy'] ?? null;
        $instance->dmarcObservedMessages = $data['dmarcObservedMessages'] ?? null;
        $instance->dmarcAlignedMessages = $data['dmarcAlignedMessages'] ?? null;
        $instance->dmarcAccountedRate = $data['dmarcAccountedRate'] ?? null;
        $instance->dmarcUnknownMessages = $data['dmarcUnknownMessages'] ?? null;
        $instance->dmarcUnknownSources = $data['dmarcUnknownSources'] ?? null;
        $instance->dmarcReportingDays = $data['dmarcReportingDays'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'bounceRate' => $this->bounceRate,
            'bounced' => $this->bounced,
            'accepted' => $this->accepted,
            'complaintRate' => $this->complaintRate,
            'accepted24h' => $this->accepted24h,
            'avgDailyAccepted7d' => $this->avgDailyAccepted7d,
            'daysSinceLastSend' => $this->daysSinceLastSend,
            'reportedOpenRate' => $this->reportedOpenRate,
            'adjustedOpenRate' => $this->adjustedOpenRate,
            'proxyRate' => $this->proxyRate,
            'proxyOpens' => $this->proxyOpens,
            'totalOpens' => $this->totalOpens,
            'humanOpenRate' => $this->humanOpenRate,
            'delivered' => $this->delivered,
            'unsubRate' => $this->unsubRate,
            'unsubscribed' => $this->unsubscribed,
            'dmarcAlignmentFailureRate7d' => $this->dmarcAlignmentFailureRate7d,
            'dmarcDomain' => $this->dmarcDomain,
            'dmarcCurrentPolicy' => $this->dmarcCurrentPolicy,
            'dmarcRecommendedPolicy' => $this->dmarcRecommendedPolicy,
            'dmarcObservedMessages' => $this->dmarcObservedMessages,
            'dmarcAlignedMessages' => $this->dmarcAlignedMessages,
            'dmarcAccountedRate' => $this->dmarcAccountedRate,
            'dmarcUnknownMessages' => $this->dmarcUnknownMessages,
            'dmarcUnknownSources' => $this->dmarcUnknownSources,
            'dmarcReportingDays' => $this->dmarcReportingDays,
        ];
    }
}

/** AdvisorRecommendationResponse schema model. */
class AdvisorRecommendationResponse
{
    /** @var string */
    public string $code;
    /** @var string */
    public string $severity;
    /** @var string */
    public string $title;
    /** @var string */
    public string $message;
    /** @var AdvisorRecommendationDataResponse|null */
    public ?AdvisorRecommendationDataResponse $data = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('code', $data)) {
            throw new \InvalidArgumentException('Missing required field: code');
        }
        $instance->code = $data['code'] ?? null;
        if (!array_key_exists('severity', $data)) {
            throw new \InvalidArgumentException('Missing required field: severity');
        }
        $instance->severity = $data['severity'] ?? null;
        if (!array_key_exists('title', $data)) {
            throw new \InvalidArgumentException('Missing required field: title');
        }
        $instance->title = $data['title'] ?? null;
        if (!array_key_exists('message', $data)) {
            throw new \InvalidArgumentException('Missing required field: message');
        }
        $instance->message = $data['message'] ?? null;
        $instance->data = $data['data'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'code' => $this->code,
            'severity' => $this->severity,
            'title' => $this->title,
            'message' => $this->message,
            'data' => $this->data,
        ];
    }
}

/** AdvisorReportResponse schema model. */
class AdvisorReportResponse
{
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $generatedAt;
    /** @var int */
    public int $score;
    /** @var list<AdvisorRecommendationResponse> */
    public array $recommendations;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('generatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: generatedAt');
        }
        $instance->generatedAt = $data['generatedAt'] ?? null;
        if (!array_key_exists('score', $data)) {
            throw new \InvalidArgumentException('Missing required field: score');
        }
        $instance->score = $data['score'] ?? null;
        if (!array_key_exists('recommendations', $data)) {
            throw new \InvalidArgumentException('Missing required field: recommendations');
        }
        $instance->recommendations = $data['recommendations'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'projectId' => $this->projectId,
            'generatedAt' => $this->generatedAt,
            'score' => $this->score,
            'recommendations' => $this->recommendations,
        ];
    }
}

/** SuppressionResponse schema model. */
class SuppressionResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $email;
    /** @var string */
    public string $reason;
    /** @var string */
    public string $createdAt;
    /** @var string|null */
    public ?string $contactId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        if (!array_key_exists('reason', $data)) {
            throw new \InvalidArgumentException('Missing required field: reason');
        }
        $instance->reason = $data['reason'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        $instance->contactId = $data['contactId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'projectId' => $this->projectId,
            'email' => $this->email,
            'reason' => $this->reason,
            'createdAt' => $this->createdAt,
            'contactId' => $this->contactId,
        ];
    }
}

/** PageInfo schema model. */
class PageInfo
{
    /** @var int */
    public int $page;
    /** @var int */
    public int $size;
    /** @var int */
    public int $total;
    /** @var int */
    public int $totalPages;
    /** @var bool */
    public bool $hasNextPage;
    /** @var bool */
    public bool $hasPreviousPage;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        if (!array_key_exists('size', $data)) {
            throw new \InvalidArgumentException('Missing required field: size');
        }
        $instance->size = $data['size'] ?? null;
        if (!array_key_exists('total', $data)) {
            throw new \InvalidArgumentException('Missing required field: total');
        }
        $instance->total = $data['total'] ?? null;
        if (!array_key_exists('totalPages', $data)) {
            throw new \InvalidArgumentException('Missing required field: totalPages');
        }
        $instance->totalPages = $data['totalPages'] ?? null;
        if (!array_key_exists('hasNextPage', $data)) {
            throw new \InvalidArgumentException('Missing required field: hasNextPage');
        }
        $instance->hasNextPage = $data['hasNextPage'] ?? null;
        if (!array_key_exists('hasPreviousPage', $data)) {
            throw new \InvalidArgumentException('Missing required field: hasPreviousPage');
        }
        $instance->hasPreviousPage = $data['hasPreviousPage'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'page' => $this->page,
            'size' => $this->size,
            'total' => $this->total,
            'totalPages' => $this->totalPages,
            'hasNextPage' => $this->hasNextPage,
            'hasPreviousPage' => $this->hasPreviousPage,
        ];
    }
}

/** SuppressionPageResponse schema model. */
class SuppressionPageResponse
{
    /** @var list<SuppressionResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** AddSuppressionBody schema model. */
class AddSuppressionBody
{
    /** @var string */
    public string $email;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'email' => $this->email,
        ];
    }
}

/** SuppressionImportRowSerializable schema model. */
class SuppressionImportRowSerializable
{
    /** @var string */
    public string $email;
    /** @var string|null */
    public ?string $reason = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        $instance->reason = $data['reason'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'email' => $this->email,
            'reason' => $this->reason,
        ];
    }
}

/** SuppressionImportBody schema model. */
class SuppressionImportBody
{
    /** @var list<SuppressionImportRowSerializable> */
    public array $suppressions;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('suppressions', $data)) {
            throw new \InvalidArgumentException('Missing required field: suppressions');
        }
        $instance->suppressions = $data['suppressions'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'suppressions' => $this->suppressions,
        ];
    }
}

/** SuppressionImportResponse schema model. */
class SuppressionImportResponse
{
    /** @var int */
    public int $imported;
    /** @var int */
    public int $skipped;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('imported', $data)) {
            throw new \InvalidArgumentException('Missing required field: imported');
        }
        $instance->imported = $data['imported'] ?? null;
        if (!array_key_exists('skipped', $data)) {
            throw new \InvalidArgumentException('Missing required field: skipped');
        }
        $instance->skipped = $data['skipped'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'imported' => $this->imported,
            'skipped' => $this->skipped,
        ];
    }
}

/** SegmentResponse schema model. */
class SegmentResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $id;
    /** @var string */
    public string $name;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $createdAt;
    /** @var int|null */
    public ?int $contactCount = null;
    /** @var int|null */
    public ?int $unsubscribedCount = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        $instance->contactCount = $data['contactCount'] ?? null;
        $instance->unsubscribedCount = $data['unsubscribedCount'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'id' => $this->id,
            'name' => $this->name,
            'projectId' => $this->projectId,
            'createdAt' => $this->createdAt,
            'contactCount' => $this->contactCount,
            'unsubscribedCount' => $this->unsubscribedCount,
        ];
    }
}

/** SegmentPageResponse schema model. */
class SegmentPageResponse
{
    /** @var list<SegmentResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** SegmentContactResponse schema model. */
class SegmentContactResponse
{
    /** @var string */
    public string $contactId;
    /** @var string */
    public string $email;
    /** @var string|null */
    public ?string $firstName;
    /** @var string|null */
    public ?string $lastName;
    /** @var list<string> */
    public array $segments;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('contactId', $data)) {
            throw new \InvalidArgumentException('Missing required field: contactId');
        }
        $instance->contactId = $data['contactId'] ?? null;
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        if (!array_key_exists('firstName', $data)) {
            throw new \InvalidArgumentException('Missing required field: firstName');
        }
        $instance->firstName = $data['firstName'] ?? null;
        if (!array_key_exists('lastName', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastName');
        }
        $instance->lastName = $data['lastName'] ?? null;
        if (!array_key_exists('segments', $data)) {
            throw new \InvalidArgumentException('Missing required field: segments');
        }
        $instance->segments = $data['segments'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'contactId' => $this->contactId,
            'email' => $this->email,
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'segments' => $this->segments,
        ];
    }
}

/** CursorInfo schema model. */
class CursorInfo
{
    /** @var string|null */
    public ?string $nextCursor;
    /** @var string|null */
    public ?string $previousCursor;
    /** @var bool */
    public bool $hasNextPage;
    /** @var bool */
    public bool $hasPreviousPage;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('nextCursor', $data)) {
            throw new \InvalidArgumentException('Missing required field: nextCursor');
        }
        $instance->nextCursor = $data['nextCursor'] ?? null;
        if (!array_key_exists('previousCursor', $data)) {
            throw new \InvalidArgumentException('Missing required field: previousCursor');
        }
        $instance->previousCursor = $data['previousCursor'] ?? null;
        if (!array_key_exists('hasNextPage', $data)) {
            throw new \InvalidArgumentException('Missing required field: hasNextPage');
        }
        $instance->hasNextPage = $data['hasNextPage'] ?? null;
        if (!array_key_exists('hasPreviousPage', $data)) {
            throw new \InvalidArgumentException('Missing required field: hasPreviousPage');
        }
        $instance->hasPreviousPage = $data['hasPreviousPage'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'nextCursor' => $this->nextCursor,
            'previousCursor' => $this->previousCursor,
            'hasNextPage' => $this->hasNextPage,
            'hasPreviousPage' => $this->hasPreviousPage,
        ];
    }
}

/** CursorPage schema model. */
class CursorPage
{
    /** @var list<SegmentContactResponse> */
    public array $data;
    /** @var CursorInfo */
    public CursorInfo $cursor;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('cursor', $data)) {
            throw new \InvalidArgumentException('Missing required field: cursor');
        }
        $instance->cursor = $data['cursor'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'cursor' => $this->cursor,
        ];
    }
}

/** CreateSegmentBody schema model. */
class CreateSegmentBody
{
    /** @var string */
    public string $name;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
        ];
    }
}

/** TopicResponse schema model. */
class TopicResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $id;
    /** @var string */
    public string $name;
    /** @var string */
    public string $defaultSubscription;
    /** @var string|null */
    public ?string $description;
    /** @var string */
    public string $visibility;
    /** @var string */
    public string $projectId;
    /** @var int */
    public int $optInCount;
    /** @var int */
    public int $optOutCount;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('defaultSubscription', $data)) {
            throw new \InvalidArgumentException('Missing required field: defaultSubscription');
        }
        $instance->defaultSubscription = $data['defaultSubscription'] ?? null;
        if (!array_key_exists('description', $data)) {
            throw new \InvalidArgumentException('Missing required field: description');
        }
        $instance->description = $data['description'] ?? null;
        if (!array_key_exists('visibility', $data)) {
            throw new \InvalidArgumentException('Missing required field: visibility');
        }
        $instance->visibility = $data['visibility'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('optInCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: optInCount');
        }
        $instance->optInCount = $data['optInCount'] ?? null;
        if (!array_key_exists('optOutCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: optOutCount');
        }
        $instance->optOutCount = $data['optOutCount'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'id' => $this->id,
            'name' => $this->name,
            'defaultSubscription' => $this->defaultSubscription,
            'description' => $this->description,
            'visibility' => $this->visibility,
            'projectId' => $this->projectId,
            'optInCount' => $this->optInCount,
            'optOutCount' => $this->optOutCount,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** TopicPageResponse schema model. */
class TopicPageResponse
{
    /** @var list<TopicResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** CreateTopicBody schema model. */
class CreateTopicBody
{
    /** @var string */
    public string $name;
    /** @var string */
    public string $defaultSubscription;
    /** @var string|null */
    public ?string $description = null;
    /** @var string|null */
    public ?string $visibility = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('defaultSubscription', $data)) {
            throw new \InvalidArgumentException('Missing required field: defaultSubscription');
        }
        $instance->defaultSubscription = $data['defaultSubscription'] ?? null;
        $instance->description = $data['description'] ?? null;
        $instance->visibility = $data['visibility'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'defaultSubscription' => $this->defaultSubscription,
            'description' => $this->description,
            'visibility' => $this->visibility,
        ];
    }
}

/** UpdateTopicBody schema model. */
class UpdateTopicBody
{
    /** @var string|null */
    public ?string $name = null;
    /** @var string|null */
    public ?string $description = null;
    /** @var string|null */
    public ?string $visibility = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->name = $data['name'] ?? null;
        $instance->description = $data['description'] ?? null;
        $instance->visibility = $data['visibility'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'description' => $this->description,
            'visibility' => $this->visibility,
        ];
    }
}

/** ContactPropertyResponse schema model. */
class ContactPropertyResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $id;
    /** @var string */
    public string $key;
    /** @var string */
    public string $type;
    /** @var string|null */
    public ?string $fallbackValue;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('key', $data)) {
            throw new \InvalidArgumentException('Missing required field: key');
        }
        $instance->key = $data['key'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('fallbackValue', $data)) {
            throw new \InvalidArgumentException('Missing required field: fallbackValue');
        }
        $instance->fallbackValue = $data['fallbackValue'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'id' => $this->id,
            'key' => $this->key,
            'type' => $this->type,
            'fallbackValue' => $this->fallbackValue,
            'projectId' => $this->projectId,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** ContactPropertyPageResponse schema model. */
class ContactPropertyPageResponse
{
    /** @var list<ContactPropertyResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** CreateContactPropertyBody schema model. */
class CreateContactPropertyBody
{
    /** @var string */
    public string $key;
    /** @var string */
    public string $type;
    /** @var string|null */
    public ?string $fallbackValue = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('key', $data)) {
            throw new \InvalidArgumentException('Missing required field: key');
        }
        $instance->key = $data['key'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        $instance->fallbackValue = $data['fallbackValue'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'key' => $this->key,
            'type' => $this->type,
            'fallbackValue' => $this->fallbackValue,
        ];
    }
}

/** UpdateContactPropertyBody schema model. */
class UpdateContactPropertyBody
{
    /** @var string|null */
    public ?string $fallbackValue = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->fallbackValue = $data['fallbackValue'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'fallbackValue' => $this->fallbackValue,
        ];
    }
}

/** TopicSubscriptionResponse schema model. */
class TopicSubscriptionResponse
{
    /** @var string */
    public string $topicId;
    /** @var string */
    public string $subscription;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('topicId', $data)) {
            throw new \InvalidArgumentException('Missing required field: topicId');
        }
        $instance->topicId = $data['topicId'] ?? null;
        if (!array_key_exists('subscription', $data)) {
            throw new \InvalidArgumentException('Missing required field: subscription');
        }
        $instance->subscription = $data['subscription'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'topicId' => $this->topicId,
            'subscription' => $this->subscription,
        ];
    }
}

/** ContactResponse schema model. */
class ContactResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $id;
    /** @var string */
    public string $email;
    /** @var string|null */
    public ?string $phone = null;
    /** @var string|null */
    public ?string $firstName;
    /** @var string|null */
    public ?string $lastName;
    /** @var bool */
    public bool $unsubscribed;
    /** @var array<string, string> */
    public array $properties;
    /** @var string|null */
    public ?string $profileImageUrl;
    /** @var string */
    public string $projectId;
    /** @var list<string> */
    public array $segments;
    /** @var list<TopicSubscriptionResponse> */
    public array $topics;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        $instance->phone = $data['phone'] ?? null;
        if (!array_key_exists('firstName', $data)) {
            throw new \InvalidArgumentException('Missing required field: firstName');
        }
        $instance->firstName = $data['firstName'] ?? null;
        if (!array_key_exists('lastName', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastName');
        }
        $instance->lastName = $data['lastName'] ?? null;
        if (!array_key_exists('unsubscribed', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribed');
        }
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        if (!array_key_exists('properties', $data)) {
            throw new \InvalidArgumentException('Missing required field: properties');
        }
        $instance->properties = $data['properties'] ?? null;
        if (!array_key_exists('profileImageUrl', $data)) {
            throw new \InvalidArgumentException('Missing required field: profileImageUrl');
        }
        $instance->profileImageUrl = $data['profileImageUrl'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('segments', $data)) {
            throw new \InvalidArgumentException('Missing required field: segments');
        }
        $instance->segments = $data['segments'] ?? null;
        if (!array_key_exists('topics', $data)) {
            throw new \InvalidArgumentException('Missing required field: topics');
        }
        $instance->topics = $data['topics'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'id' => $this->id,
            'email' => $this->email,
            'phone' => $this->phone,
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'unsubscribed' => $this->unsubscribed,
            'properties' => $this->properties,
            'profileImageUrl' => $this->profileImageUrl,
            'projectId' => $this->projectId,
            'segments' => $this->segments,
            'topics' => $this->topics,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** ContactPageResponse schema model. */
class ContactPageResponse
{
    /** @var list<ContactResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** SegmentRef schema model. */
class SegmentRef
{
    /** @var string */
    public string $id;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
        ];
    }
}

/** TopicSubscriptionBody schema model. */
class TopicSubscriptionBody
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $subscription;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('subscription', $data)) {
            throw new \InvalidArgumentException('Missing required field: subscription');
        }
        $instance->subscription = $data['subscription'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'subscription' => $this->subscription,
        ];
    }
}

/** CreateContactBody schema model. */
class CreateContactBody
{
    /** @var string */
    public string $email;
    /** @var string|null */
    public ?string $phone = null;
    /** @var string|null */
    public ?string $firstName = null;
    /** @var string|null */
    public ?string $lastName = null;
    /** @var bool|null */
    public ?bool $unsubscribed = null;
    /** @var array<string, string>|null */
    public ?array $properties = null;
    /** @var list<SegmentRef>|null */
    public ?array $segments = null;
    /** @var list<TopicSubscriptionBody>|null */
    public ?array $topics = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('email', $data)) {
            throw new \InvalidArgumentException('Missing required field: email');
        }
        $instance->email = $data['email'] ?? null;
        $instance->phone = $data['phone'] ?? null;
        $instance->firstName = $data['firstName'] ?? null;
        $instance->lastName = $data['lastName'] ?? null;
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        $instance->properties = $data['properties'] ?? null;
        $instance->segments = $data['segments'] ?? null;
        $instance->topics = $data['topics'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'email' => $this->email,
            'phone' => $this->phone,
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'unsubscribed' => $this->unsubscribed,
            'properties' => $this->properties,
            'segments' => $this->segments,
            'topics' => $this->topics,
        ];
    }
}

/** UpdateContactBody schema model. */
class UpdateContactBody
{
    /** @var string|null */
    public ?string $firstName = null;
    /** @var string|null */
    public ?string $lastName = null;
    /** @var string|null */
    public ?string $phone = null;
    /** @var bool|null */
    public ?bool $unsubscribed = null;
    /** @var array<string, string> */
    public ?array $properties = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->firstName = $data['firstName'] ?? null;
        $instance->lastName = $data['lastName'] ?? null;
        $instance->phone = $data['phone'] ?? null;
        $instance->unsubscribed = $data['unsubscribed'] ?? null;
        $instance->properties = $data['properties'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'phone' => $this->phone,
            'unsubscribed' => $this->unsubscribed,
            'properties' => $this->properties,
        ];
    }
}

/** SetImageUrlBody schema model. */
class SetImageUrlBody
{
    /** @var string */
    public string $url;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('url', $data)) {
            throw new \InvalidArgumentException('Missing required field: url');
        }
        $instance->url = $data['url'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'url' => $this->url,
        ];
    }
}

/** AddToSegmentBody schema model. */
class AddToSegmentBody
{
    /** @var string */
    public string $segmentId;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('segmentId', $data)) {
            throw new \InvalidArgumentException('Missing required field: segmentId');
        }
        $instance->segmentId = $data['segmentId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'segmentId' => $this->segmentId,
        ];
    }
}

/** UpdateTopicsBody schema model. */
class UpdateTopicsBody
{
    /** @var list<TopicSubscriptionBody> */
    public array $topics;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('topics', $data)) {
            throw new \InvalidArgumentException('Missing required field: topics');
        }
        $instance->topics = $data['topics'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'topics' => $this->topics,
        ];
    }
}

/** ActivityMetadataResponse schema model. */
class ActivityMetadataResponse
{
    /** @var string|null */
    public ?string $topicId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->topicId = $data['topicId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'topicId' => $this->topicId,
        ];
    }
}

/** ActivityResponse schema model. */
class ActivityResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $id;
    /** @var string */
    public string $type;
    /** @var string|null */
    public ?string $referenceId = null;
    /** @var string|null */
    public ?string $referenceName = null;
    /** @var ActivityMetadataResponse|null */
    public ?ActivityMetadataResponse $metadata = null;
    /** @var string */
    public string $occurredAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        $instance->referenceId = $data['referenceId'] ?? null;
        $instance->referenceName = $data['referenceName'] ?? null;
        $instance->metadata = $data['metadata'] ?? null;
        if (!array_key_exists('occurredAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: occurredAt');
        }
        $instance->occurredAt = $data['occurredAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'id' => $this->id,
            'type' => $this->type,
            'referenceId' => $this->referenceId,
            'referenceName' => $this->referenceName,
            'metadata' => $this->metadata,
            'occurredAt' => $this->occurredAt,
        ];
    }
}

/** EngagementScoreResponse schema model. */
class EngagementScoreResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var int */
    public int $score;
    /** @var string */
    public string $tier;
    /** @var string */
    public string $scoredAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('score', $data)) {
            throw new \InvalidArgumentException('Missing required field: score');
        }
        $instance->score = $data['score'] ?? null;
        if (!array_key_exists('tier', $data)) {
            throw new \InvalidArgumentException('Missing required field: tier');
        }
        $instance->tier = $data['tier'] ?? null;
        if (!array_key_exists('scoredAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: scoredAt');
        }
        $instance->scoredAt = $data['scoredAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'score' => $this->score,
            'tier' => $this->tier,
            'scoredAt' => $this->scoredAt,
        ];
    }
}

/** EmailValidationStatusResponse schema model. */
class EmailValidationStatusResponse
{
    /** @var string|null */
    public ?string $object = null;
    /** @var string */
    public string $status;
    /** @var string|null */
    public ?string $reason;
    /** @var string|null */
    public ?string $validatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->object = $data['object'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('reason', $data)) {
            throw new \InvalidArgumentException('Missing required field: reason');
        }
        $instance->reason = $data['reason'] ?? null;
        if (!array_key_exists('validatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: validatedAt');
        }
        $instance->validatedAt = $data['validatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'object' => $this->object,
            'status' => $this->status,
            'reason' => $this->reason,
            'validatedAt' => $this->validatedAt,
        ];
    }
}

/** RecordValidationBody schema model. */
class RecordValidationBody
{
    /** @var EmailValidationStatusInput */
    public EmailValidationStatusInput $status;
    /** @var string|null */
    public ?string $reason = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        $instance->reason = $data['reason'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'status' => $this->status,
            'reason' => $this->reason,
        ];
    }
}

/** WebhookFilterSerializable schema model. */
class WebhookFilterSerializable
{
    /** @var string */
    public string $field;
    /** @var string */
    public string $operator;
    /** @var string|null */
    public ?string $value = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('field', $data)) {
            throw new \InvalidArgumentException('Missing required field: field');
        }
        $instance->field = $data['field'] ?? null;
        if (!array_key_exists('operator', $data)) {
            throw new \InvalidArgumentException('Missing required field: operator');
        }
        $instance->operator = $data['operator'] ?? null;
        $instance->value = $data['value'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'field' => $this->field,
            'operator' => $this->operator,
            'value' => $this->value,
        ];
    }
}

/** WebhookTransformationSerializable schema model. */
class WebhookTransformationSerializable
{
    /** @var string */
    public string $type;
    /** @var string|null */
    public ?string $from = null;
    /** @var string|null */
    public ?string $to = null;
    /** @var string|null */
    public ?string $field = null;
    /** @var string|null */
    public ?string $value = null;
    /** @var string|null */
    public ?string $template = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        $instance->from = $data['from'] ?? null;
        $instance->to = $data['to'] ?? null;
        $instance->field = $data['field'] ?? null;
        $instance->value = $data['value'] ?? null;
        $instance->template = $data['template'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'type' => $this->type,
            'from' => $this->from,
            'to' => $this->to,
            'field' => $this->field,
            'value' => $this->value,
            'template' => $this->template,
        ];
    }
}

/** WebhookResponse schema model. */
class WebhookResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $name;
    /** @var string */
    public string $url;
    /** @var list<string> */
    public array $events;
    /** @var bool */
    public bool $enabled;
    /** @var list<WebhookFilterSerializable> */
    public ?array $filters;
    /** @var list<WebhookTransformationSerializable> */
    public ?array $transformations;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('url', $data)) {
            throw new \InvalidArgumentException('Missing required field: url');
        }
        $instance->url = $data['url'] ?? null;
        if (!array_key_exists('events', $data)) {
            throw new \InvalidArgumentException('Missing required field: events');
        }
        $instance->events = $data['events'] ?? null;
        if (!array_key_exists('enabled', $data)) {
            throw new \InvalidArgumentException('Missing required field: enabled');
        }
        $instance->enabled = $data['enabled'] ?? null;
        if (!array_key_exists('filters', $data)) {
            throw new \InvalidArgumentException('Missing required field: filters');
        }
        $instance->filters = $data['filters'] ?? null;
        if (!array_key_exists('transformations', $data)) {
            throw new \InvalidArgumentException('Missing required field: transformations');
        }
        $instance->transformations = $data['transformations'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'projectId' => $this->projectId,
            'name' => $this->name,
            'url' => $this->url,
            'events' => $this->events,
            'enabled' => $this->enabled,
            'filters' => $this->filters,
            'transformations' => $this->transformations,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** WebhookPageResponse schema model. */
class WebhookPageResponse
{
    /** @var list<WebhookResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** WebhookDeliveryResponse schema model. */
class WebhookDeliveryResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $webhookEndpointId;
    /** @var string */
    public string $eventType;
    /** @var string */
    public string $status;
    /** @var int */
    public int $attemptCount;
    /** @var int|null */
    public ?int $lastStatusCode;
    /** @var string|null */
    public ?string $lastError;
    /** @var string|null */
    public ?string $responseBodySnippet;
    /** @var string|null */
    public ?string $nextAttemptAt;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('webhookEndpointId', $data)) {
            throw new \InvalidArgumentException('Missing required field: webhookEndpointId');
        }
        $instance->webhookEndpointId = $data['webhookEndpointId'] ?? null;
        if (!array_key_exists('eventType', $data)) {
            throw new \InvalidArgumentException('Missing required field: eventType');
        }
        $instance->eventType = $data['eventType'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('attemptCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: attemptCount');
        }
        $instance->attemptCount = $data['attemptCount'] ?? null;
        if (!array_key_exists('lastStatusCode', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastStatusCode');
        }
        $instance->lastStatusCode = $data['lastStatusCode'] ?? null;
        if (!array_key_exists('lastError', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastError');
        }
        $instance->lastError = $data['lastError'] ?? null;
        if (!array_key_exists('responseBodySnippet', $data)) {
            throw new \InvalidArgumentException('Missing required field: responseBodySnippet');
        }
        $instance->responseBodySnippet = $data['responseBodySnippet'] ?? null;
        if (!array_key_exists('nextAttemptAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: nextAttemptAt');
        }
        $instance->nextAttemptAt = $data['nextAttemptAt'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'projectId' => $this->projectId,
            'webhookEndpointId' => $this->webhookEndpointId,
            'eventType' => $this->eventType,
            'status' => $this->status,
            'attemptCount' => $this->attemptCount,
            'lastStatusCode' => $this->lastStatusCode,
            'lastError' => $this->lastError,
            'responseBodySnippet' => $this->responseBodySnippet,
            'nextAttemptAt' => $this->nextAttemptAt,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** WebhookDeliveryPageResponse schema model. */
class WebhookDeliveryPageResponse
{
    /** @var list<WebhookDeliveryResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** CreateWebhookBody schema model. */
class CreateWebhookBody
{
    /** @var string */
    public string $url;
    /** @var list<string> */
    public array $events;
    /** @var string|null */
    public ?string $name = null;
    /** @var string|null */
    public ?string $secret = null;
    /** @var list<WebhookFilterSerializable> */
    public ?array $filters = null;
    /** @var list<WebhookTransformationSerializable> */
    public ?array $transformations = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('url', $data)) {
            throw new \InvalidArgumentException('Missing required field: url');
        }
        $instance->url = $data['url'] ?? null;
        if (!array_key_exists('events', $data)) {
            throw new \InvalidArgumentException('Missing required field: events');
        }
        $instance->events = $data['events'] ?? null;
        $instance->name = $data['name'] ?? null;
        $instance->secret = $data['secret'] ?? null;
        $instance->filters = $data['filters'] ?? null;
        $instance->transformations = $data['transformations'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'url' => $this->url,
            'events' => $this->events,
            'name' => $this->name,
            'secret' => $this->secret,
            'filters' => $this->filters,
            'transformations' => $this->transformations,
        ];
    }
}

/** WebhookCreateResponse schema model. */
class WebhookCreateResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $name;
    /** @var string */
    public string $url;
    /** @var list<string> */
    public array $events;
    /** @var bool */
    public bool $enabled;
    /** @var list<WebhookFilterSerializable> */
    public ?array $filters;
    /** @var list<WebhookTransformationSerializable> */
    public ?array $transformations;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;
    /** @var string */
    public string $secret;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('url', $data)) {
            throw new \InvalidArgumentException('Missing required field: url');
        }
        $instance->url = $data['url'] ?? null;
        if (!array_key_exists('events', $data)) {
            throw new \InvalidArgumentException('Missing required field: events');
        }
        $instance->events = $data['events'] ?? null;
        if (!array_key_exists('enabled', $data)) {
            throw new \InvalidArgumentException('Missing required field: enabled');
        }
        $instance->enabled = $data['enabled'] ?? null;
        if (!array_key_exists('filters', $data)) {
            throw new \InvalidArgumentException('Missing required field: filters');
        }
        $instance->filters = $data['filters'] ?? null;
        if (!array_key_exists('transformations', $data)) {
            throw new \InvalidArgumentException('Missing required field: transformations');
        }
        $instance->transformations = $data['transformations'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        if (!array_key_exists('secret', $data)) {
            throw new \InvalidArgumentException('Missing required field: secret');
        }
        $instance->secret = $data['secret'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'projectId' => $this->projectId,
            'name' => $this->name,
            'url' => $this->url,
            'events' => $this->events,
            'enabled' => $this->enabled,
            'filters' => $this->filters,
            'transformations' => $this->transformations,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
            'secret' => $this->secret,
        ];
    }
}

/** UpdateWebhookBody schema model. */
class UpdateWebhookBody
{
    /** @var string|null */
    public ?string $name = null;
    /** @var string|null */
    public ?string $url = null;
    /** @var list<string> */
    public ?array $events = null;
    /** @var string|null */
    public ?string $secret = null;
    /** @var bool|null */
    public ?bool $enabled = null;
    /** @var list<WebhookFilterSerializable> */
    public ?array $filters = null;
    /** @var list<WebhookTransformationSerializable> */
    public ?array $transformations = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->name = $data['name'] ?? null;
        $instance->url = $data['url'] ?? null;
        $instance->events = $data['events'] ?? null;
        $instance->secret = $data['secret'] ?? null;
        $instance->enabled = $data['enabled'] ?? null;
        $instance->filters = $data['filters'] ?? null;
        $instance->transformations = $data['transformations'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'url' => $this->url,
            'events' => $this->events,
            'secret' => $this->secret,
            'enabled' => $this->enabled,
            'filters' => $this->filters,
            'transformations' => $this->transformations,
        ];
    }
}

/** ApiKey schema model. */
class ApiKey
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $configId;
    /** @var string|null */
    public ?string $name;
    /** @var string|null */
    public ?string $start;
    /** @var string|null */
    public ?string $prefix;
    /** @var string */
    public string $organizationId;
    /** @var string|null */
    public ?string $projectId;
    /** @var bool */
    public bool $enabled;
    /** @var bool */
    public bool $rateLimitEnabled;
    /** @var int|null */
    public ?int $rateLimitTimeWindow;
    /** @var int|null */
    public ?int $rateLimitMax;
    /** @var int */
    public int $requestCount;
    /** @var int|null */
    public ?int $remaining;
    /** @var string|null */
    public ?string $lastRequest;
    /** @var string|null */
    public ?string $expiresAt;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;
    /** @var array<string, string> */
    public ?array $metadata;
    /** @var array<string, list<string>> */
    public ?array $permissions;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('configId', $data)) {
            throw new \InvalidArgumentException('Missing required field: configId');
        }
        $instance->configId = $data['configId'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('start', $data)) {
            throw new \InvalidArgumentException('Missing required field: start');
        }
        $instance->start = $data['start'] ?? null;
        if (!array_key_exists('prefix', $data)) {
            throw new \InvalidArgumentException('Missing required field: prefix');
        }
        $instance->prefix = $data['prefix'] ?? null;
        if (!array_key_exists('organizationId', $data)) {
            throw new \InvalidArgumentException('Missing required field: organizationId');
        }
        $instance->organizationId = $data['organizationId'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('enabled', $data)) {
            throw new \InvalidArgumentException('Missing required field: enabled');
        }
        $instance->enabled = $data['enabled'] ?? null;
        if (!array_key_exists('rateLimitEnabled', $data)) {
            throw new \InvalidArgumentException('Missing required field: rateLimitEnabled');
        }
        $instance->rateLimitEnabled = $data['rateLimitEnabled'] ?? null;
        if (!array_key_exists('rateLimitTimeWindow', $data)) {
            throw new \InvalidArgumentException('Missing required field: rateLimitTimeWindow');
        }
        $instance->rateLimitTimeWindow = $data['rateLimitTimeWindow'] ?? null;
        if (!array_key_exists('rateLimitMax', $data)) {
            throw new \InvalidArgumentException('Missing required field: rateLimitMax');
        }
        $instance->rateLimitMax = $data['rateLimitMax'] ?? null;
        if (!array_key_exists('requestCount', $data)) {
            throw new \InvalidArgumentException('Missing required field: requestCount');
        }
        $instance->requestCount = $data['requestCount'] ?? null;
        if (!array_key_exists('remaining', $data)) {
            throw new \InvalidArgumentException('Missing required field: remaining');
        }
        $instance->remaining = $data['remaining'] ?? null;
        if (!array_key_exists('lastRequest', $data)) {
            throw new \InvalidArgumentException('Missing required field: lastRequest');
        }
        $instance->lastRequest = $data['lastRequest'] ?? null;
        if (!array_key_exists('expiresAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: expiresAt');
        }
        $instance->expiresAt = $data['expiresAt'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        if (!array_key_exists('metadata', $data)) {
            throw new \InvalidArgumentException('Missing required field: metadata');
        }
        $instance->metadata = $data['metadata'] ?? null;
        if (!array_key_exists('permissions', $data)) {
            throw new \InvalidArgumentException('Missing required field: permissions');
        }
        $instance->permissions = $data['permissions'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'configId' => $this->configId,
            'name' => $this->name,
            'start' => $this->start,
            'prefix' => $this->prefix,
            'organizationId' => $this->organizationId,
            'projectId' => $this->projectId,
            'enabled' => $this->enabled,
            'rateLimitEnabled' => $this->rateLimitEnabled,
            'rateLimitTimeWindow' => $this->rateLimitTimeWindow,
            'rateLimitMax' => $this->rateLimitMax,
            'requestCount' => $this->requestCount,
            'remaining' => $this->remaining,
            'lastRequest' => $this->lastRequest,
            'expiresAt' => $this->expiresAt,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
            'metadata' => $this->metadata,
            'permissions' => $this->permissions,
        ];
    }
}

/** ApiKeyUsageRecord schema model. */
class ApiKeyUsageRecord
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $keyId;
    /** @var string */
    public string $orgId;
    /** @var string */
    public string $method;
    /** @var string */
    public string $route;
    /** @var int */
    public int $statusCode;
    /** @var int|null */
    public ?int $durationMs;
    /** @var string|null */
    public ?string $ip;
    /** @var string */
    public string $ts;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('keyId', $data)) {
            throw new \InvalidArgumentException('Missing required field: keyId');
        }
        $instance->keyId = $data['keyId'] ?? null;
        if (!array_key_exists('orgId', $data)) {
            throw new \InvalidArgumentException('Missing required field: orgId');
        }
        $instance->orgId = $data['orgId'] ?? null;
        if (!array_key_exists('method', $data)) {
            throw new \InvalidArgumentException('Missing required field: method');
        }
        $instance->method = $data['method'] ?? null;
        if (!array_key_exists('route', $data)) {
            throw new \InvalidArgumentException('Missing required field: route');
        }
        $instance->route = $data['route'] ?? null;
        if (!array_key_exists('statusCode', $data)) {
            throw new \InvalidArgumentException('Missing required field: statusCode');
        }
        $instance->statusCode = $data['statusCode'] ?? null;
        if (!array_key_exists('durationMs', $data)) {
            throw new \InvalidArgumentException('Missing required field: durationMs');
        }
        $instance->durationMs = $data['durationMs'] ?? null;
        if (!array_key_exists('ip', $data)) {
            throw new \InvalidArgumentException('Missing required field: ip');
        }
        $instance->ip = $data['ip'] ?? null;
        if (!array_key_exists('ts', $data)) {
            throw new \InvalidArgumentException('Missing required field: ts');
        }
        $instance->ts = $data['ts'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'keyId' => $this->keyId,
            'orgId' => $this->orgId,
            'method' => $this->method,
            'route' => $this->route,
            'statusCode' => $this->statusCode,
            'durationMs' => $this->durationMs,
            'ip' => $this->ip,
            'ts' => $this->ts,
        ];
    }
}

/** UsagePage schema model. */
class UsagePage
{
    /** @var int */
    public int $size;
    /** @var int */
    public int $totalPages;
    /** @var bool */
    public bool $hasMore;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('size', $data)) {
            throw new \InvalidArgumentException('Missing required field: size');
        }
        $instance->size = $data['size'] ?? null;
        if (!array_key_exists('totalPages', $data)) {
            throw new \InvalidArgumentException('Missing required field: totalPages');
        }
        $instance->totalPages = $data['totalPages'] ?? null;
        if (!array_key_exists('hasMore', $data)) {
            throw new \InvalidArgumentException('Missing required field: hasMore');
        }
        $instance->hasMore = $data['hasMore'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'size' => $this->size,
            'totalPages' => $this->totalPages,
            'hasMore' => $this->hasMore,
        ];
    }
}

/** ApiKeyUsageResponse schema model. */
class ApiKeyUsageResponse
{
    /** @var list<ApiKeyUsageRecord> */
    public array $data;
    /** @var UsagePage */
    public UsagePage $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** ProjectLimitsModel schema model. */
class ProjectLimitsModel
{
    /** @var int */
    public int $dailySends;
    /** @var int */
    public int $perSecondSends;
    /** @var int */
    public int $maxRecipientsPerMessage;
    /** @var int */
    public int $maxDomains;
    /** @var int */
    public int $maxApiKeys;
    /** @var int */
    public int $maxWebhooks;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('dailySends', $data)) {
            throw new \InvalidArgumentException('Missing required field: dailySends');
        }
        $instance->dailySends = $data['dailySends'] ?? null;
        if (!array_key_exists('perSecondSends', $data)) {
            throw new \InvalidArgumentException('Missing required field: perSecondSends');
        }
        $instance->perSecondSends = $data['perSecondSends'] ?? null;
        if (!array_key_exists('maxRecipientsPerMessage', $data)) {
            throw new \InvalidArgumentException('Missing required field: maxRecipientsPerMessage');
        }
        $instance->maxRecipientsPerMessage = $data['maxRecipientsPerMessage'] ?? null;
        if (!array_key_exists('maxDomains', $data)) {
            throw new \InvalidArgumentException('Missing required field: maxDomains');
        }
        $instance->maxDomains = $data['maxDomains'] ?? null;
        if (!array_key_exists('maxApiKeys', $data)) {
            throw new \InvalidArgumentException('Missing required field: maxApiKeys');
        }
        $instance->maxApiKeys = $data['maxApiKeys'] ?? null;
        if (!array_key_exists('maxWebhooks', $data)) {
            throw new \InvalidArgumentException('Missing required field: maxWebhooks');
        }
        $instance->maxWebhooks = $data['maxWebhooks'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'dailySends' => $this->dailySends,
            'perSecondSends' => $this->perSecondSends,
            'maxRecipientsPerMessage' => $this->maxRecipientsPerMessage,
            'maxDomains' => $this->maxDomains,
            'maxApiKeys' => $this->maxApiKeys,
            'maxWebhooks' => $this->maxWebhooks,
        ];
    }
}

/** ProjectTrackingSettingsModel schema model. */
class ProjectTrackingSettingsModel
{
    /** @var bool */
    public bool $openTracking;
    /** @var bool */
    public bool $clickTracking;
    /** @var bool */
    public bool $unsubscribeTracking;
    /** @var bool */
    public bool $readEngagement;
    /** @var bool|null */
    public ?bool $scrollDepth = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('openTracking', $data)) {
            throw new \InvalidArgumentException('Missing required field: openTracking');
        }
        $instance->openTracking = $data['openTracking'] ?? null;
        if (!array_key_exists('clickTracking', $data)) {
            throw new \InvalidArgumentException('Missing required field: clickTracking');
        }
        $instance->clickTracking = $data['clickTracking'] ?? null;
        if (!array_key_exists('unsubscribeTracking', $data)) {
            throw new \InvalidArgumentException('Missing required field: unsubscribeTracking');
        }
        $instance->unsubscribeTracking = $data['unsubscribeTracking'] ?? null;
        if (!array_key_exists('readEngagement', $data)) {
            throw new \InvalidArgumentException('Missing required field: readEngagement');
        }
        $instance->readEngagement = $data['readEngagement'] ?? null;
        $instance->scrollDepth = $data['scrollDepth'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'openTracking' => $this->openTracking,
            'clickTracking' => $this->clickTracking,
            'unsubscribeTracking' => $this->unsubscribeTracking,
            'readEngagement' => $this->readEngagement,
            'scrollDepth' => $this->scrollDepth,
        ];
    }
}

/** ProjectResponse schema model. */
class ProjectResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $name;
    /** @var string */
    public string $slug;
    /** @var string */
    public string $status;
    /** @var string|null */
    public ?string $suspensionReason;
    /** @var string */
    public string $region;
    /** @var ProjectLimitsModel */
    public ProjectLimitsModel $limits;
    /** @var ProjectTrackingSettingsModel */
    public ProjectTrackingSettingsModel $trackingSettings;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('slug', $data)) {
            throw new \InvalidArgumentException('Missing required field: slug');
        }
        $instance->slug = $data['slug'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('suspensionReason', $data)) {
            throw new \InvalidArgumentException('Missing required field: suspensionReason');
        }
        $instance->suspensionReason = $data['suspensionReason'] ?? null;
        if (!array_key_exists('region', $data)) {
            throw new \InvalidArgumentException('Missing required field: region');
        }
        $instance->region = $data['region'] ?? null;
        if (!array_key_exists('limits', $data)) {
            throw new \InvalidArgumentException('Missing required field: limits');
        }
        $instance->limits = $data['limits'] ?? null;
        if (!array_key_exists('trackingSettings', $data)) {
            throw new \InvalidArgumentException('Missing required field: trackingSettings');
        }
        $instance->trackingSettings = $data['trackingSettings'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'status' => $this->status,
            'suspensionReason' => $this->suspensionReason,
            'region' => $this->region,
            'limits' => $this->limits,
            'trackingSettings' => $this->trackingSettings,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** ProjectPageResponse schema model. */
class ProjectPageResponse
{
    /** @var list<ProjectResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** UpdateProjectRequest schema model. */
class UpdateProjectRequest
{
    /** @var string|null */
    public ?string $name = null;
    /** @var string|null */
    public ?string $slug = null;
    /** @var ProjectLimitsModel|null */
    public ?ProjectLimitsModel $limits = null;
    /** @var ProjectTrackingSettingsModel|null */
    public ?ProjectTrackingSettingsModel $trackingSettings = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->name = $data['name'] ?? null;
        $instance->slug = $data['slug'] ?? null;
        $instance->limits = $data['limits'] ?? null;
        $instance->trackingSettings = $data['trackingSettings'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'slug' => $this->slug,
            'limits' => $this->limits,
            'trackingSettings' => $this->trackingSettings,
        ];
    }
}

/** EmailPageResponse schema model. */
class EmailPageResponse
{
    /** @var list<EmailDetailResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** EmailTimelineItem schema model. */
class EmailTimelineItem
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $type;
    /** @var string|null */
    public ?string $providerEventId;
    /** @var array<string, string|null> */
    public ?array $payload;
    /** @var string */
    public string $occurredAt;
    /** @var string */
    public string $createdAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('providerEventId', $data)) {
            throw new \InvalidArgumentException('Missing required field: providerEventId');
        }
        $instance->providerEventId = $data['providerEventId'] ?? null;
        if (!array_key_exists('payload', $data)) {
            throw new \InvalidArgumentException('Missing required field: payload');
        }
        $instance->payload = $data['payload'] ?? null;
        if (!array_key_exists('occurredAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: occurredAt');
        }
        $instance->occurredAt = $data['occurredAt'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'type' => $this->type,
            'providerEventId' => $this->providerEventId,
            'payload' => $this->payload,
            'occurredAt' => $this->occurredAt,
            'createdAt' => $this->createdAt,
        ];
    }
}

/** EmailTimelineResponse schema model. */
class EmailTimelineResponse
{
    /** @var list<EmailTimelineItem> */
    public array $items;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('items', $data)) {
            throw new \InvalidArgumentException('Missing required field: items');
        }
        $instance->items = $data['items'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'items' => $this->items,
        ];
    }
}

/** DomainListItemResponse schema model. */
class DomainListItemResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $domain;
    /** @var string */
    public string $region;
    /** @var string */
    public string $status;
    /** @var string */
    public string $dkimStatus;
    /** @var string */
    public string $bimiStatus;
    /** @var string */
    public string $trackingStatus;
    /** @var string */
    public string $updatedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('domain', $data)) {
            throw new \InvalidArgumentException('Missing required field: domain');
        }
        $instance->domain = $data['domain'] ?? null;
        if (!array_key_exists('region', $data)) {
            throw new \InvalidArgumentException('Missing required field: region');
        }
        $instance->region = $data['region'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('dkimStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: dkimStatus');
        }
        $instance->dkimStatus = $data['dkimStatus'] ?? null;
        if (!array_key_exists('bimiStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: bimiStatus');
        }
        $instance->bimiStatus = $data['bimiStatus'] ?? null;
        if (!array_key_exists('trackingStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: trackingStatus');
        }
        $instance->trackingStatus = $data['trackingStatus'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'domain' => $this->domain,
            'region' => $this->region,
            'status' => $this->status,
            'dkimStatus' => $this->dkimStatus,
            'bimiStatus' => $this->bimiStatus,
            'trackingStatus' => $this->trackingStatus,
            'updatedAt' => $this->updatedAt,
        ];
    }
}

/** DomainListPageResponse schema model. */
class DomainListPageResponse
{
    /** @var list<DomainListItemResponse> */
    public array $data;
    /** @var PageInfo */
    public PageInfo $page;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('data', $data)) {
            throw new \InvalidArgumentException('Missing required field: data');
        }
        $instance->data = $data['data'] ?? null;
        if (!array_key_exists('page', $data)) {
            throw new \InvalidArgumentException('Missing required field: page');
        }
        $instance->page = $data['page'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'data' => $this->data,
            'page' => $this->page,
        ];
    }
}

/** DkimRecordResponse schema model. */
class DkimRecordResponse
{
    /** @var string */
    public string $name;
    /** @var string */
    public string $type;
    /** @var string */
    public string $value;
    /** @var string|null */
    public ?string $status = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('value', $data)) {
            throw new \InvalidArgumentException('Missing required field: value');
        }
        $instance->value = $data['value'] ?? null;
        $instance->status = $data['status'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'type' => $this->type,
            'value' => $this->value,
            'status' => $this->status,
        ];
    }
}

/** DnsRecordResponse schema model. */
class DnsRecordResponse
{
    /** @var string */
    public string $name;
    /** @var string */
    public string $type;
    /** @var string */
    public string $value;
    /** @var int|null */
    public ?int $priority = null;
    /** @var bool|null */
    public ?bool $optional = null;
    /** @var string|null */
    public ?string $status = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('name', $data)) {
            throw new \InvalidArgumentException('Missing required field: name');
        }
        $instance->name = $data['name'] ?? null;
        if (!array_key_exists('type', $data)) {
            throw new \InvalidArgumentException('Missing required field: type');
        }
        $instance->type = $data['type'] ?? null;
        if (!array_key_exists('value', $data)) {
            throw new \InvalidArgumentException('Missing required field: value');
        }
        $instance->value = $data['value'] ?? null;
        $instance->priority = $data['priority'] ?? null;
        $instance->optional = $data['optional'] ?? null;
        $instance->status = $data['status'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'type' => $this->type,
            'value' => $this->value,
            'priority' => $this->priority,
            'optional' => $this->optional,
            'status' => $this->status,
        ];
    }
}

/** VerificationRecordsResponse schema model. */
class VerificationRecordsResponse
{
    /** @var list<DkimRecordResponse> */
    public array $dkim;
    /** @var DnsRecordResponse */
    public DnsRecordResponse $mailFromMx;
    /** @var DnsRecordResponse */
    public DnsRecordResponse $mailFromSpf;
    /** @var DnsRecordResponse|null */
    public ?DnsRecordResponse $dmarcRecommended = null;
    /** @var DnsRecordResponse|null */
    public ?DnsRecordResponse $bimi = null;
    /** @var DnsRecordResponse|null */
    public ?DnsRecordResponse $trackingCname = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('dkim', $data)) {
            throw new \InvalidArgumentException('Missing required field: dkim');
        }
        $instance->dkim = $data['dkim'] ?? null;
        if (!array_key_exists('mailFromMx', $data)) {
            throw new \InvalidArgumentException('Missing required field: mailFromMx');
        }
        $instance->mailFromMx = $data['mailFromMx'] ?? null;
        if (!array_key_exists('mailFromSpf', $data)) {
            throw new \InvalidArgumentException('Missing required field: mailFromSpf');
        }
        $instance->mailFromSpf = $data['mailFromSpf'] ?? null;
        $instance->dmarcRecommended = $data['dmarcRecommended'] ?? null;
        $instance->bimi = $data['bimi'] ?? null;
        $instance->trackingCname = $data['trackingCname'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'dkim' => $this->dkim,
            'mailFromMx' => $this->mailFromMx,
            'mailFromSpf' => $this->mailFromSpf,
            'dmarcRecommended' => $this->dmarcRecommended,
            'bimi' => $this->bimi,
            'trackingCname' => $this->trackingCname,
        ];
    }
}

/** DomainResponse schema model. */
class DomainResponse
{
    /** @var string */
    public string $id;
    /** @var string */
    public string $projectId;
    /** @var string */
    public string $domain;
    /** @var string */
    public string $region;
    /** @var string */
    public string $status;
    /** @var string */
    public string $dkimStatus;
    /** @var string */
    public string $spfStatus;
    /** @var string */
    public string $dmarcStatus;
    /** @var string */
    public string $mailFromStatus;
    /** @var string */
    public string $mailFromDomain;
    /** @var VerificationRecordsResponse */
    public VerificationRecordsResponse $verificationRecords;
    /** @var string */
    public string $bimiStatus;
    /** @var string|null */
    public ?string $bimiLogoUrl;
    /** @var string */
    public string $createdAt;
    /** @var string */
    public string $updatedAt;
    /** @var string|null */
    public ?string $verifiedAt;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('id', $data)) {
            throw new \InvalidArgumentException('Missing required field: id');
        }
        $instance->id = $data['id'] ?? null;
        if (!array_key_exists('projectId', $data)) {
            throw new \InvalidArgumentException('Missing required field: projectId');
        }
        $instance->projectId = $data['projectId'] ?? null;
        if (!array_key_exists('domain', $data)) {
            throw new \InvalidArgumentException('Missing required field: domain');
        }
        $instance->domain = $data['domain'] ?? null;
        if (!array_key_exists('region', $data)) {
            throw new \InvalidArgumentException('Missing required field: region');
        }
        $instance->region = $data['region'] ?? null;
        if (!array_key_exists('status', $data)) {
            throw new \InvalidArgumentException('Missing required field: status');
        }
        $instance->status = $data['status'] ?? null;
        if (!array_key_exists('dkimStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: dkimStatus');
        }
        $instance->dkimStatus = $data['dkimStatus'] ?? null;
        if (!array_key_exists('spfStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: spfStatus');
        }
        $instance->spfStatus = $data['spfStatus'] ?? null;
        if (!array_key_exists('dmarcStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: dmarcStatus');
        }
        $instance->dmarcStatus = $data['dmarcStatus'] ?? null;
        if (!array_key_exists('mailFromStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: mailFromStatus');
        }
        $instance->mailFromStatus = $data['mailFromStatus'] ?? null;
        if (!array_key_exists('mailFromDomain', $data)) {
            throw new \InvalidArgumentException('Missing required field: mailFromDomain');
        }
        $instance->mailFromDomain = $data['mailFromDomain'] ?? null;
        if (!array_key_exists('verificationRecords', $data)) {
            throw new \InvalidArgumentException('Missing required field: verificationRecords');
        }
        $instance->verificationRecords = $data['verificationRecords'] ?? null;
        if (!array_key_exists('bimiStatus', $data)) {
            throw new \InvalidArgumentException('Missing required field: bimiStatus');
        }
        $instance->bimiStatus = $data['bimiStatus'] ?? null;
        if (!array_key_exists('bimiLogoUrl', $data)) {
            throw new \InvalidArgumentException('Missing required field: bimiLogoUrl');
        }
        $instance->bimiLogoUrl = $data['bimiLogoUrl'] ?? null;
        if (!array_key_exists('createdAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: createdAt');
        }
        $instance->createdAt = $data['createdAt'] ?? null;
        if (!array_key_exists('updatedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: updatedAt');
        }
        $instance->updatedAt = $data['updatedAt'] ?? null;
        if (!array_key_exists('verifiedAt', $data)) {
            throw new \InvalidArgumentException('Missing required field: verifiedAt');
        }
        $instance->verifiedAt = $data['verifiedAt'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'id' => $this->id,
            'projectId' => $this->projectId,
            'domain' => $this->domain,
            'region' => $this->region,
            'status' => $this->status,
            'dkimStatus' => $this->dkimStatus,
            'spfStatus' => $this->spfStatus,
            'dmarcStatus' => $this->dmarcStatus,
            'mailFromStatus' => $this->mailFromStatus,
            'mailFromDomain' => $this->mailFromDomain,
            'verificationRecords' => $this->verificationRecords,
            'bimiStatus' => $this->bimiStatus,
            'bimiLogoUrl' => $this->bimiLogoUrl,
            'createdAt' => $this->createdAt,
            'updatedAt' => $this->updatedAt,
            'verifiedAt' => $this->verifiedAt,
        ];
    }
}

/** RegisterDomainRequest schema model. */
class RegisterDomainRequest
{
    /** @var string */
    public string $domain;
    /** @var string */
    public string $region;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        if (!array_key_exists('domain', $data)) {
            throw new \InvalidArgumentException('Missing required field: domain');
        }
        $instance->domain = $data['domain'] ?? null;
        if (!array_key_exists('region', $data)) {
            throw new \InvalidArgumentException('Missing required field: region');
        }
        $instance->region = $data['region'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'domain' => $this->domain,
            'region' => $this->region,
        ];
    }
}

/** UpdateBimiRequest schema model. */
class UpdateBimiRequest
{
    /** @var string|null */
    public ?string $logoUrl = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->logoUrl = $data['logoUrl'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'logoUrl' => $this->logoUrl,
        ];
    }
}

enum EmailValidationStatusInput: string
{
    case Valid = 'valid';
    case Risky = 'risky';
    case Invalid = 'invalid';
    case Unknown = 'unknown';
}

/** GetTopicPerformanceQuery schema model. */
class GetTopicPerformanceQuery
{
    /** @var string|null */
    public ?string $window = null;
    /** @var string|null */
    public ?string $projectId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->window = $data['window'] ?? null;
        $instance->projectId = $data['projectId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'window' => $this->window,
            'projectId' => $this->projectId,
        ];
    }
}

/** GetProjectMetricsSummaryQuery schema model. */
class GetProjectMetricsSummaryQuery
{
    /** @var string|null */
    public ?string $window = null;
    /** @var string|null */
    public ?string $projectId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->window = $data['window'] ?? null;
        $instance->projectId = $data['projectId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'window' => $this->window,
            'projectId' => $this->projectId,
        ];
    }
}

/** GetProjectMetricsTimelineQuery schema model. */
class GetProjectMetricsTimelineQuery
{
    /** @var string|null */
    public ?string $window = null;
    /** @var string|null */
    public ?string $granularity = null;
    /** @var string|null */
    public ?string $format = null;
    /** @var string|null */
    public ?string $projectId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->window = $data['window'] ?? null;
        $instance->granularity = $data['granularity'] ?? null;
        $instance->format = $data['format'] ?? null;
        $instance->projectId = $data['projectId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'window' => $this->window,
            'granularity' => $this->granularity,
            'format' => $this->format,
            'projectId' => $this->projectId,
        ];
    }
}

/** GetMetricsAdvisorQuery schema model. */
class GetMetricsAdvisorQuery
{
    /** @var string|null */
    public ?string $projectId = null;

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        $instance->projectId = $data['projectId'] ?? null;
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
            'projectId' => $this->projectId,
        ];
    }
}

// Type alias ListContactSegmentsResponse is represented inline.

// Type alias GetContactTopicsResponse is represented inline.

// Type alias GetContactActivityResponse is represented inline.

/** ListApiKeysResponse schema model. */
class ListApiKeysResponse
{

    /** @param array<string, mixed> $data */
    public static function fromArray(array $data): self
    {
        $instance = new self();
        return $instance;
    }

    /** @return array<string, mixed> */
    public function toArray(): array
    {
        return [
        ];
    }
}

