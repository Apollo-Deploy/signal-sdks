# Apollo Signal API Elixir SDK

Generated Elixir client for the Apollo Signal API API.

See the generated [documentation index](docs/README.md) for domains, operations, and types.

This Mix library uses [Req](https://hexdocs.pm/req) for HTTP and Jason for JSON. Configure
`base_url`, `timeout_ms`, `max_retries`, `retry_unsafe_requests`, and credentials when
constructing the client. Retries are bounded, only safe methods are retried by default,
`Retry-After` is honored, and unsafe retries require either an explicit option or an
`idempotency_key`.

```elixir
client = ApolloSignal.new(
  base_url: "https://signal.apollodeploy.com",
  timeout_ms: 5_000,
  max_retries: 3
)

api = ApolloSignal.Client.emails(client)
```

Each API group is available through `ApolloSignal.Client.<group>/1`, and every operation is
also available as a direct function on `ApolloSignal.Client`. Successful JSON operations
return `{:ok, value, metadata}`; void operations return `{:ok, metadata}`; failures return
`{:error, %ApolloSignal.Errors{}}` with status, response headers/body, and request ID metadata.

SSE operations return `{:ok, stream}`. The stream is an `Enumerable` of typed
`ApolloSignal.Transport.SSEEvent` values and carries response metadata:

```elixir

{:ok, stream} = ApolloSignal.Client.emails(client).stream_email_events()
Enum.each(stream, fn event -> IO.inspect(event.data) end)
metadata = ApolloSignal.Transport.SSEStream.metadata(stream)

```
