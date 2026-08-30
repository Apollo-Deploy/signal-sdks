# Apollo Signal API SDK documentation

Reference documentation for the Apollo Signal API SDK.

[Back to the SDK overview](../README.md)

## API domains

| Domain | Client accessor | Operations | Description |
|---|---|---:|---|
| [EmailsAPI](./domains/emails.md) | `client.Emails` | 8 | emails operations |
| [MetricsAPI](./domains/metrics.md) | `client.Metrics` | 6 | metrics operations |
| [SuppressionsAPI](./domains/suppressions.md) | `client.Suppressions` | 5 | suppressions operations |
| [SegmentsAPI](./domains/segments.md) | `client.Segments` | 5 | segments operations |
| [TopicsAPI](./domains/topics.md) | `client.Topics` | 6 | topics operations |
| [ContactPropertiesAPI](./domains/contact-properties.md) | `client.ContactProperties` | 5 | contactProperties operations |
| [ContactsAPI](./domains/contacts.md) | `client.Contacts` | 18 | contacts operations |
| [WebhooksAPI](./domains/webhooks.md) | `client.Webhooks` | 9 | webhooks operations |
| [ApiKeysAPI](./domains/api-keys.md) | `client.ApiKeys` | 4 | apiKeys operations |
| [ProjectsAPI](./domains/projects.md) | `client.Projects` | 6 | projects operations |
| [SendingDomainsAPI](./domains/sending-domains.md) | `client.SendingDomains` | 7 | sendingDomains operations |

## Models and types

- [Generated types reference](./types.md)

## Reliability behavior

Generated clients use bounded request timeouts, structured SDK errors, request ID propagation, and retry transient failures with exponential backoff. Unsafe requests are not retried unless the generated client can establish idempotency or the caller explicitly enables it.

