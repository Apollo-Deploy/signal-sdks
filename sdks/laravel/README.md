# Apollo Signal Laravel integration

The Laravel integration bundled with the Apollo Signal PHP SDK. The single Composer package
contains the generated PHP client and registers it with Laravel's service container.

> This integration is generated from Apollo Signal release `v1.0.2`. Do not edit generated
> files manually.

## Installation

```bash
composer require apollo-deploy/signal-sdk:^1.0.2
```

Laravel discovers `SignalServiceProvider` automatically. Set the Signal API key:

```dotenv
APOLLO_SIGNAL_API_KEY=ap_signal_...
```

Then inject the core client where it is needed:

```php
use Apollo\Deploy\Signal\Sdk\Client;

final class SendWelcomeEmail
{
    public function __construct(private readonly Client $signal)
    {
    }
}
```

The default configuration works without publishing a file. To customize it:

```bash
php artisan vendor:publish --tag=signal-config
```

The generated `config/signal.php` file maps `APOLLO_SIGNAL_API_KEY` to the required bearer header.
It also supports `APOLLO_SIGNAL_BASE_URL`, timeout, and retry environment variables.

## Canonical source

All generated Signal SDKs live in
[`Apollo-Deploy/signal-sdks`](https://github.com/Apollo-Deploy/signal-sdks).

## License

MIT
