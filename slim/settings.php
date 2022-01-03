<?php
use App\XManager;

$XManager = (new XManager())->GlobalConfig();
// Should be set to 0 in production
error_reporting(0);

// Should be set to '0' in production
ini_set('display_errors', '0');

// Settings
$settings = [];

// Path settings
$settings['root'] = dirname(__DIR__);

// Error Handling Middleware settings
$settings['error'] = [
    // Should be set to false in production
    'display_error_details' => $XManager['debug'],

    // Parameter is passed to the default ErrorHandler
    // View in rendered output by enabling the "displayErrorDetails" setting.
    // For the console and unit tests we also disable it
    'log_errors' => false,

    // Display error details in error log
    'log_error_details' => false,
];

$settings['commands'] = [
    \App\Console\CreateAdminCommand::class,
	\App\Console\ExchangeRateCommand::class,
    \App\Console\setTelegramCommand::class,
	\App\Console\BackupCommand::class,
	\App\Console\CheckUpdateCommand::class,
	\App\Console\ClearLogsCommand::class,
	\App\Console\DataAutoResetCommand::class,
	\App\Console\DataExpireStatusCommand::class,
	\App\Console\DataResetCommand::class,
	\App\Console\ServerStatusCommand::class,
	\App\Console\UpdateCommand::class,
	\App\Console\UsedDataStatusCommand::class,
	\App\Console\DownloadAppsCommand::class,
];

return $settings;