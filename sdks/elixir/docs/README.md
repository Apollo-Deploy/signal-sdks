# Apollo Signal API SDK documentation

Reference documentation for the Apollo Signal API SDK.

[Back to the SDK overview](../README.md)

## API domains

| Domain | Client accessor | Operations | Description |
|---|---|---:|---|
| [EmailsAPI](./domains/emails.md) | `ApolloSignal.Client.emails(client)` | 8 | emails operations |
| [MetricsAPI](./domains/metrics.md) | `ApolloSignal.Client.metrics(client)` | 6 | metrics operations |
| [SuppressionsAPI](./domains/suppressions.md) | `ApolloSignal.Client.suppressions(client)` | 5 | suppressions operations |
| [SegmentsAPI](./domains/segments.md) | `ApolloSignal.Client.segments(client)` | 5 | segments operations |
| [TopicsAPI](./domains/topics.md) | `ApolloSignal.Client.topics(client)` | 6 | topics operations |
| [ContactPropertiesAPI](./domains/contact-properties.md) | `ApolloSignal.Client.contact_properties(client)` | 5 | contactProperties operations |
| [ContactsAPI](./domains/contacts.md) | `ApolloSignal.Client.contacts(client)` | 18 | contacts operations |
| [WebhooksAPI](./domains/webhooks.md) | `ApolloSignal.Client.webhooks(client)` | 9 | webhooks operations |
| [ApiKeysAPI](./domains/api-keys.md) | `ApolloSignal.Client.api_keys(client)` | 4 | apiKeys operations |
| [ProjectsAPI](./domains/projects.md) | `ApolloSignal.Client.projects(client)` | 6 | projects operations |
| [SendingDomainsAPI](./domains/sending-domains.md) | `ApolloSignal.Client.sending_domains(client)` | 7 | sendingDomains operations |

## Models and types

- [Generated types reference](./types.md)

## Reliability behavior

Generated clients use bounded request timeouts, structured SDK errors, request ID propagation, and retry transient failures with exponential backoff. Unsafe requests are not retried unless the generated client can establish idempotency or the caller explicitly enables it.

