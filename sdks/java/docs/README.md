# Apollo Signal API SDK documentation

Reference documentation for the Apollo Signal API SDK.

[Back to the SDK overview](../README.md)

## API domains

| Domain | Client accessor | Operations | Description |
|---|---|---:|---|
| [EmailsAPI](./domains/emails.md) | `ApolloSignalApiClient.emails()` | 8 | emails operations |
| [MetricsAPI](./domains/metrics.md) | `ApolloSignalApiClient.metrics()` | 6 | metrics operations |
| [SuppressionsAPI](./domains/suppressions.md) | `ApolloSignalApiClient.suppressions()` | 5 | suppressions operations |
| [SegmentsAPI](./domains/segments.md) | `ApolloSignalApiClient.segments()` | 5 | segments operations |
| [TopicsAPI](./domains/topics.md) | `ApolloSignalApiClient.topics()` | 6 | topics operations |
| [ContactPropertiesAPI](./domains/contact-properties.md) | `ApolloSignalApiClient.contactProperties()` | 5 | contactProperties operations |
| [ContactsAPI](./domains/contacts.md) | `ApolloSignalApiClient.contacts()` | 18 | contacts operations |
| [WebhooksAPI](./domains/webhooks.md) | `ApolloSignalApiClient.webhooks()` | 9 | webhooks operations |
| [ApiKeysAPI](./domains/api-keys.md) | `ApolloSignalApiClient.apiKeys()` | 4 | apiKeys operations |
| [ProjectsAPI](./domains/projects.md) | `ApolloSignalApiClient.projects()` | 6 | projects operations |
| [SendingDomainsAPI](./domains/sending-domains.md) | `ApolloSignalApiClient.sendingDomains()` | 7 | sendingDomains operations |

## Models and types

- [Generated types reference](./types.md)

## Reliability behavior

Generated clients use bounded request timeouts, structured SDK errors, request ID propagation, and retry transient failures with exponential backoff. Unsafe requests are not retried unless the generated client can establish idempotency or the caller explicitly enables it.

