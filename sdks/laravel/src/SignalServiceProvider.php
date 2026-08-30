<?php

declare(strict_types=1);

namespace Apollo\Deploy\Signal\Laravel;

use Apollo\Deploy\Signal\Sdk\Client;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Support\ServiceProvider;

final class SignalServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->mergeConfigFrom(dirname(__DIR__) . '/config/signal.php', 'signal');

        $this->app->singleton(Client::class, static function (Application $app): Client {
            $config = $app->make('config')->get('signal', []);

            return new Client(is_array($config) ? $config : []);
        });
    }

    public function boot(): void
    {
        $this->publishes([
            dirname(__DIR__) . '/config/signal.php' => config_path('signal.php'),
        ], 'signal-config');
    }
}
