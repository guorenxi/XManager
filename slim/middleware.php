<?php

use Selective\BasePath\BasePathMiddleware;
use Slim\App;
use Slim\Exception\HttpNotFoundException;
use Slim\Exception\HttpMethodNotAllowedException;
use Slim\Exception\HttpInternalServerErrorException;
use Slim\Psr7\Response;
use Psr\Http\Message\ServerRequestInterface;
use App\Template as View;
use Middlewares\Whoops;


return function (App $app) {

	require __DIR__ . '/settings.php';

	$app->addBodyParsingMiddleware();
	
	$app->addRoutingMiddleware();
	
	$app->add(BasePathMiddleware::class);
	
	$errorMiddleware = $app->addErrorMiddleware(
		(bool)$settings['error']['display_error_details'], 
		(bool)$settings['error']['log_errors'], 
		(bool)$settings['error']['log_error_details']
	);


	// Set the Not Found Handler
	$errorMiddleware->setErrorHandler(
		HttpNotFoundException::class,
		function (ServerRequestInterface $request, Throwable $exception, bool $displayErrorDetails) {
			$response = new Response();
			$view = View::getSmarty();
			$response->getBody()->write($view->fetch('errors/404.tpl'));
			return $response;
		});

	// Set the Not Allowed Handler
	$errorMiddleware->setErrorHandler(
		HttpMethodNotAllowedException::class,
		function (ServerRequestInterface $request, Throwable $exception, bool $displayErrorDetails) {
			$response = new Response();
			$view = View::getSmarty();
			$response->getBody()->write($view->fetch('errors/405.tpl'));
			return $response;
		});

	// Set the Not Allowed Handler
	if ($XManager['debug'] == false) {
		$errorMiddleware->setErrorHandler(
			HttpInternalServerErrorException::class,
			function (ServerRequestInterface $request, Throwable $exception, bool $displayErrorDetails) {
				$response = new Response();
				$view = View::getSmarty();
				$response->getBody()->write($view->fetch('errors/500.tpl'));
				return $response;
			});	
	}else{
		$errorMiddleware->setErrorHandler(
			HttpInternalServerErrorException::class,
			function (ServerRequestInterface $request, Throwable $exception, bool $displayErrorDetails) {
				$app->add(new Whoops());
				$response = new Response();
				$view = View::getSmarty();
				$response->getBody()->write($view->fetch('errors/500.tpl'));
				return $response;
			});	
	}	
};