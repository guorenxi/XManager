<?php
require_once __DIR__ . '/vendor/autoload.php';

$cron = new \Jobby\Jobby();

/*---汇率命令--*/
$cron->add('ExchangeRateCommand', array(  
    'command' => 'php bin/console.php updateRate',
    'schedule' => '0 */12 * * *',
    'output' => 'logs/rates.log',
    'enabled' => true,
));

/*---备份命令--*/
$cron->add('BackupCommand', array(
    'command' => 'php bin/console.php backup',
    'schedule' => '0 */1 * * *',
    'output' => 'logs/backup.log',
    'enabled' => true,
));

/*---检查更新命令--*/
$cron->add('CheckUpdateCommand', array(
    'command' => 'php bin/console.php versioncheck',
    'schedule' => '*/10 * * * *',
    'output' => 'logs/versioncheck.log',
    'enabled' => true,
));

/*---清除日志命令--*/
$cron->add('ClearLogsCommand', array(
    'command' => 'php bin/console.php clearlogs',
    'schedule' => '0 */6 * * *',
    'output' => 'logs/clearlogs.log',
    'enabled' => true,
));

/*---流量自动重置命令--*/
$cron->add('DataAutoResetCommand', array(
    'command' => 'php bin/console.php datautoreset',
    'schedule' => '59 23 * * *',
    'output' => 'logs/datautoreset.log',
    'enabled' => true,
));

/*---流量过期状态命令--*/
$cron->add('DataExpireStatusCommand', array(
    'command' => 'php bin/console.php expirestatus',
    'schedule' => '*/10 * * * *',
    'output' => 'logs/expirestatus.log',
    'enabled' => true,
));

/*---流量重置命令--*/
$cron->add('DataResetCommand', array(
    'command' => 'php bin/console.php datareset',
    'schedule' => '59 23 * * *',
    'output' => 'logs/datareset.log',
    'enabled' => true,
));

/*---已用流量状态命令--*/
$cron->add('UsedDataStatusCommand', array(
    'command' => 'php bin/console.php datastatus',
    'schedule' => '*/10 * * * *',
    'output' => 'logs/datastatus.log',
    'enabled' => true,
));

$cron->run();
