<?php 
use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseFactoryInterface;
use Slim\App;
use Slim\Factory\AppFactory;
use Selective\BasePath\BasePathMiddleware;
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Input\InputOption;


return [

    'settings' => function () {
        return require __DIR__ . '/settings.php';
    },
	
    App::class => function (ContainerInterface $container) {
        AppFactory::setContainer($container);

        return AppFactory::create();
    },

    BasePathMiddleware::class => function (ContainerInterface $container) {
        return new BasePathMiddleware($container->get(App::class));
    },

    Application::class => function (ContainerInterface $container) {
        $application = new Application();

        foreach ($container->get('settings')['commands'] as $class) {
            $application->add($container->get($class));
        }

        return $application;
    },
];