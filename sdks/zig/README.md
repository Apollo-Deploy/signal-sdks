# Apollo Signal API Zig SDK



Generated for Zig 0.16.0 as package `apollo_signal` version `1.0.4`.

## Requirements

- Zig 0.16.0 exactly.
- A caller-owned `std.mem.Allocator` and `std.Io` value.
- A valid `http` or `https` base URL.

## Usage

```zig
const std = @import("std");
const sdk = @import("apollo_signal");

var client = sdk.Client.init(.{
    .allocator = allocator,
    .io = io,
    .base_url = "https://signal.apollodeploy.com",
});
defer client.deinit();

// Domain accessors are narrow value views over the owned client transport.
// const result = try client.emails().someOperation(.{});
```

The generated root exports the client, typed models, request options, transport
configuration, owned responses, structured API error metadata, and SSE stream
types. Response bodies and parsed values are allocator-owned; call `deinit` on
successful results, API error metadata, and SSE events/streams when finished.

## Reliability and ownership

- `std.http.Client` is the only HTTP effect boundary.
- Request and response bodies are bounded at 16777216 and 16777216 bytes respectively.
- Retries are capped at 5 attempts, use bounded exponential backoff, and honor numeric `Retry-After` values up to 30000 milliseconds.
- Safe and idempotent methods may retry. Unsafe methods require an idempotency key or explicit `retry_unsafe_requests` opt-in.
- Request IDs are copied into successful responses and structured error metadata.
- SSE responses are buffered within the response bound and exposed as owned typed events.
- Timeouts are operation budgets covering request, response, and retry work; the caller controls the underlying `std.Io` implementation.

## Build and tests

```sh
zig build test
```

Generated API documentation is in [`docs/README.md`](docs/README.md), with the
MIT license in [`LICENSE`](LICENSE).
