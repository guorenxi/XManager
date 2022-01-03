<?php

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\App;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\AppMiddleware;
use App\Http\Middleware\WebapiMiddleware;
use App\Http\Middleware\GuestMiddleware;
use App\Http\Middleware\UserMiddleware;
use App\Http\Middleware\AdminLoginMiddleware;
use App\Http\Middleware\CartMiddleware;
use Slim\Routing\RouteCollectorProxy;

return function (App $app) {
	$app->get('/license',          				\App\Http\Controllers\HomeController::class . ':license');
    $app->get('/',          					\App\Http\Controllers\HomeController::class . ':index');
    $app->get('/404',       					\App\Http\Controllers\HomeController::class . ':page404');
    $app->get('/405',       					\App\Http\Controllers\HomeController::class . ':page405');
    $app->get('/500',       					\App\Http\Controllers\HomeController::class . ':page500');
    $app->get('/tos',       					\App\Http\Controllers\HomeController::class . ':tos');
	$app->get('/restricted',       				\App\Http\Controllers\HomeController::class . ':restricted');
    $app->get('/staff',     					\App\Http\Controllers\HomeController::class . ':staff');
    $app->get('/index',     	  				\App\Http\Controllers\HomeController::class . ':index');
	$app->get('/maintenance',     				\App\Http\Controllers\HomeController::class . ':maintenance');	
    $app->post('/telegram_callback',    		\App\Http\Controllers\HomeController::class . ':telegram');
	$app->group('', function (RouteCollectorProxy $group) {
		$group->get('/packages',    			\App\Http\Controllers\HomeController::class . ':packages')->add(new AppMiddleware());
		$group->get('/checkout', 	    		\App\Http\Controllers\HomeController::class . ':checkout')->add(new AppMiddleware());
	})->add(new CartMiddleware());
	$app->post('/coupon_check',        			\App\Http\Controllers\HomeController::class . ':CouponCheck');
	$app->post('/recaptcha',                	\App\Http\Controllers\User\CaptchaController::class . ':recaptcha');	
	$app->post('/affclicks',        			\App\Http\Controllers\User\RegController::class . ':affclicks');
    $app->post('/send',            				\App\Http\Controllers\User\RegController::class . ':sendVerify');
	$app->post('/tgcode',            			\App\Http\Controllers\User\RegController::class . ':TGVerify');
    $app->post('/registerUser',        			\App\Http\Controllers\HomeController::class . ':registerUser');	
	$app->get('/gareset',                   	\App\Http\Controllers\User\SettingsController::class . ':GaReset');
	$app->post('/gaset',                  		\App\Http\Controllers\User\SettingsController::class . ':GaSet');	
	$app->get('/getOrder',  					\App\Payments\VPay::class . ':getOrder');
	$app->get('/appPush',  						\App\Payments\VPay::class . ':appPush');
	$app->get('/checkOrder',  					\App\Payments\VPay::class . ':checkOrder');
	$app->get('/appHeart',  					\App\Payments\VPay::class . ':appHeart');
	$app->get('/closeOrder',  					\App\Payments\VPay::class . ':closeOrder');	
	$app->get('/getState',  					\App\Payments\VPay::class . ':getState');
	$app->get('/setExpire', 					\App\Payments\VPay::class . ':setExpire');	
	$app->get('/create',  			    		\App\Payments\VPay::class . ':createOrder');	
	$app->post('/coinpayments_callback', 		\App\Payments\CoinPayments::class . ':coinpayments_callback');
	$app->get('/coinpayments_callback', 		\App\Payments\CoinPayments::class . ':coinpayments_callback');	
	$app->post('/f2fpay_callback', 		    	\App\Payments\F2F::class . ':f2fpay_callback');
	$app->get('/f2fpay_callback', 		    	\App\Payments\F2F::class . ':f2fpay_callback');
	$app->post('/f2fpay_query', 		    	\App\Payments\F2F::class . ':f2fpay_query');
	$app->get('/f2fpay_query', 		    		\App\Payments\F2F::class . ':f2fpay_query');	
	$app->post('/theadpay_callback', 			\App\Payments\THeadPay::class . ':theadpay_callback');
	$app->get('/theadpay_callback', 			\App\Payments\THeadPay::class . ':theadpay_callback');	
	$app->post('/stripe_callback', 				\App\Payments\StripePay::class . ':stripe_callback');
	$app->get('/stripe_callback', 				\App\Payments\StripePay::class . ':stripe_callback');	
	$app->post('/mgate_callback', 				\App\Payments\MGatepay::class . ':mgate_callback');
	$app->get('/mgate_callback', 				\App\Payments\MGatepay::class . ':mgate_callback');	
	$app->post('/easypay_callback', 			\App\Payments\EasyPay::class . ':easypay_callback');
	$app->get('/easypay_callback', 				\App\Payments\EasyPay::class . ':easypay_callback');	
	$app->post('/paypal_callback', 				\App\Payments\PayPalExpress::class . ':callback');
	$app->get('/paypal_callback', 		 		\App\Payments\PayPalExpress::class . ':callback');	
	$app->get('/enQrcode',  					\App\Payments\QrcodeGenerator::class . ':enQrcode');	
	$app->get('/getGoogleToken',            	\App\Services\MailServices\GoogleToken::class . ':getGoogleToken');
	$app->post('/getGoogleToken',           	\App\Services\MailServices\GoogleToken::class . ':getGoogleToken');
			
    $app->group('/portal', function (RouteCollectorProxy $group) {
        $group->get('',                      	 \App\Http\Controllers\User\IndexController::class . ':index');
        $group->get('/clientarea',           	 \App\Http\Controllers\User\IndexController::class . ':index');
		$group->get('/license',              	 \App\Http\Controllers\User\IndexController::class . ':license');
		$group->post('/userdetails',         	 \App\Http\Controllers\User\IndexController::class . ':userdetails');
        $group->get('/suspend',              	 \App\Http\Controllers\User\IndexController::class . ':suspend');
		$group->get('/sys',                  	 \App\Http\Controllers\User\IndexController::class . ':sys');
        $group->get('/logout',               	 \App\Http\Controllers\User\IndexController::class . ':logout');
        $group->get('/backtoadmin',          	 \App\Http\Controllers\User\IndexController::class . ':backtoadmin');
		$group->get('/traffic_reset',        	 \App\Http\Controllers\User\IndexController::class . ':Allow_Reset');
		
		$group->get('/telegram_reset',       	 \App\Http\Controllers\User\SettingsController::class . ':telegram_reset');
        $group->post('/url_reset',           	 \App\Http\Controllers\User\SettingsController::class . ':resetURL');
		$group->post('/mobilecode',          	 \App\Http\Controllers\User\SettingsController::class . ':mobilecode');
		$group->post('/mobileverify',        	 \App\Http\Controllers\User\SettingsController::class . ':mobileverify'); 
		
		$group->get('/affiliate',           	 \App\Http\Controllers\User\AffiliateController::class . ':affiliate');
        $group->get('/affiliate_reset',      	 \App\Http\Controllers\User\AffiliateController::class . ':resetAfflink');
		$group->post('/affiliate_ajax',      	 \App\Http\Controllers\User\AffiliateController::class . ':affiliate_ajax');
		$group->post('/payout',              	 \App\Http\Controllers\Admin\AffiliateController::class . ':rebate');
		
		$group->get('/notice',             	 	 \App\Http\Controllers\User\NoticeController::class . ':notice');
		$group->get('/faqs',              	 	 \App\Http\Controllers\User\FaqController::class . ':faqs');
			
		$group->post('/notify',              	 \App\Http\Controllers\User\SettingsController::class . ':notification');

		$group->get('/settings',             	 \App\Http\Controllers\User\SettingsController::class . ':settings')->add(new AppMiddleware());
		$group->post('/loginajax',           	 \App\Http\Controllers\User\SettingsController::class . ':login_ajax');		
		$group->post('/method',              	 \App\Http\Controllers\User\SettingsController::class . ':update_method');
		$group->get('/kill',                 	 \App\Http\Controllers\User\SettingsController::class . ':kill');
        $group->post('/kill',                    \App\Http\Controllers\User\SettingsController::class . ':handleKill');
		$group->post('/password',             	 \App\Http\Controllers\User\SettingsController::class . ':updateLogin');
        $group->post('/pwd',                 	 \App\Http\Controllers\User\SettingsController::class . ':updateTrojanUUID');
		
		$group->get('/accounts',             	 \App\Http\Controllers\User\AccountsController::class . ':account')->add(new AppMiddleware());
		$group->post('/idcheck',            	 \App\Http\Controllers\User\AccountsController::class . ':idCheck');
		
        $group->get('/servers',              	 \App\Http\Controllers\User\ServerController::class . ':server');
        $group->get('/trojan/{id}',       	 	 \App\Http\Controllers\User\ServerController::class . ':trojan');
		$group->get('/shadowsocks/{id}',     	 \App\Http\Controllers\User\ServerController::class . ':shadowsocks');
		$group->get('/ssv2plugin/{id}',      	 \App\Http\Controllers\User\ServerController::class . ':ssv2plugin');
		$group->get('/vmess/{id}',     		 	 \App\Http\Controllers\User\ServerController::class . ':vmess');
		$group->get('/vless/{id}',     		 	 \App\Http\Controllers\User\ServerController::class . ':vless');
			
        $group->get('/packages',             	 \App\Http\Controllers\User\PackageController::class . ':package')->add(new AppMiddleware());
		$group->get('/checkout', 	    	 	 \App\Http\Controllers\User\PackageController::class . ':checkout')->add(new AppMiddleware());
		$group->get('/topup', 	    	 	 	 \App\Http\Controllers\User\PackageController::class . ':topup')->add(new AppMiddleware());
		$group->get('/renew', 	     	     	 \App\Http\Controllers\User\PackageController::class . ':renew')->add(new AppMiddleware());
        $group->post('/coupon_check',        	 \App\Http\Controllers\User\PackageController::class . ':CouponCheck');
        $group->post('/buy',                  	 \App\Http\Controllers\User\PackageController::class . ':buy');		
		
		$group->get('/orders',               	 \App\Http\Controllers\User\PackageController::class . ':order');	
        $group->post('/order_ajax',          	 \App\Http\Controllers\User\PackageController::class . ':order_ajax');		
		
		$group->post('/coinpayments', 		  	 \App\Payments\CoinPayments::class . ':coinpayments');
		$group->get('/coinpayments_status',   	 \App\Payments\CoinPayments::class . ':coinpayments_checkorder');
		$group->post('/coinpayments_cancel',  	 \App\Payments\CoinPayments::class . ':coinpayments_cancel');
		
		$group->post('/f2f', 		    	  	 \App\Payments\F2F::class . ':f2f');
		$group->get('/f2fpay_status',      	  	 \App\Payments\F2F::class . ':f2fpay_checkorder');
		$group->post('/f2fpay_cancel',     	  	 \App\Payments\F2F::class . ':f2fpay_cancel');
		
		$group->post('/theadpay', 		      	 \App\Payments\THeadPay::class . ':theadpay');
		$group->get('/theadpay_status',       	 \App\Payments\THeadPay::class . ':theadpay_checkorder');
		$group->post('/theadpay_cancel',      	 \App\Payments\THeadPay::class . ':theadpay_cancel');
		
		$group->post('/token188', 		      	 \App\Payments\Token188::class . ':token188');

		$group->post('/stripe', 		      	 \App\Payments\StripePay::class . ':stripe');
		$group->get('/stripe_checkorder',     	 \App\Payments\StripePay::class . ':stripe_checkorder');
		$group->post('/stripe_cancel',     	  	 \App\Payments\StripePay::class . ':stripe_cancel');
		
		$group->post('/paypal', 		      	 \App\Payments\PayPal::class . ':paypal');
		$group->post('/paypal/create', 		  	 \App\Payments\PayPalExpress::class . ':create');
		
		$group->post('/vpay', 				  	 \App\Payments\VPay::class . ':vpay_order');
		$group->post('/delorder',             	 \App\Payments\VPay::class . ':delorder');
		$group->get('/orderstatus',           	 \App\Payments\VPay::class . ':orderstatus');
		
		$group->post('/mgatepay', 		   	  	 \App\Payments\MGatepay::class . ':mgatepay');
		
		$group->post('/easypay', 		      	 \App\Payments\EasyPay::class . ':easypay');
    })->add(new UserMiddleware());


    $app->group('', function (RouteCollectorProxy $group) {
		$group->get('/login',            	     \App\Http\Controllers\User\LoginController::class . ':login');
        $group->post('/login',                   \App\Http\Controllers\User\LoginController::class . ':loginHandle');		
		$group->post('/loginverify',             \App\Http\Controllers\User\LoginController::class . ':loginverify');
        $group->get('/register',         	     \App\Http\Controllers\User\RegController::class . ':register');
        $group->post('/register',        	     \App\Http\Controllers\User\RegController::class . ':registerHandle');
    })->add(new GuestMiddleware());
	
    $app->group('/password', function (RouteCollectorProxy $group) {
        $group->get('/reset',            	     \App\Http\Controllers\User\PasswordController::class . ':reset');
        $group->post('/reset',           	     \App\Http\Controllers\User\PasswordController::class . ':handleReset');
		$group->post('/tgsend',           	     \App\Http\Controllers\User\PasswordController::class . ':TGVerify');
		$group->post('/send',           	     \App\Http\Controllers\User\PasswordController::class . ':mobileVerify');
		$group->post('/resett',           	     \App\Http\Controllers\User\PasswordController::class . ':mobilereset');
        $group->get('/token/{token}',    	     \App\Http\Controllers\User\PasswordController::class . ':token');
        $group->post('/token/{token}',   	     \App\Http\Controllers\User\PasswordController::class . ':handleToken');
    })->add(new GuestMiddleware());

	$app->group('/auth', function (RouteCollectorProxy $group) {
		$group->get("/administrator",      	     \App\Http\Controllers\Admin\AdminController::class . ':adminlogin');
		$group->post("/administrator",           \App\Http\Controllers\Admin\AdminController::class . ':adminloginHandle');
		$group->post("/recaptcha",      	     \App\Http\Controllers\User\CaptchaController::class . ':recaptcha');
    })->add(new AdminLoginMiddleware());
	
    $app->group('/admin', function (RouteCollectorProxy $group) {
        $group->get('',                          \App\Http\Controllers\Admin\AdminController::class . ':index');
        $group->get('/',                         \App\Http\Controllers\Admin\AdminController::class . ':index');
		$group->get('/analytics',                \App\Http\Controllers\Admin\AdminController::class . ':analytics');
		$group->get('/license',             	 \App\Http\Controllers\Admin\AdminController::class . ':license');
		$group->get('/trafficlog',               \App\Http\Controllers\Admin\AdminController::class . ':trafficLog');
        $group->post('/trafficlog/ajax',         \App\Http\Controllers\Admin\AdminController::class . ':ajax_trafficLog');
		
        $group->get('/sys',                      \App\Http\Controllers\Admin\AdminController::class . ':sys');
        $group->get('/logout',                   \App\Http\Controllers\Admin\AdminController::class . ':logout');
		$group->post('/query',        			 \App\Http\Controllers\Admin\AdminController::class . ':query');
		
		$group->get('/affiliate',              	 \App\Http\Controllers\Admin\AffiliateController::class . ':affiliate')->add(new AppMiddleware());
		$group->get('/payout',              	 \App\Http\Controllers\Admin\AffiliateController::class . ':payout')->add(new AppMiddleware());
        $group->post('/affiliate/ajax',          \App\Http\Controllers\Admin\AffiliateController::class . ':ajax_affiliate');
		$group->post('/payout/ajax',             \App\Http\Controllers\Admin\AffiliateController::class . ':ajax_payout');
		$group->post('/payouts',                 \App\Http\Controllers\Admin\AffiliateController::class . ':updatePayout');

		$group->post('/revenuequery',            \App\Http\Controllers\Admin\AnalyticsController::class . ':revenuequery');	
		$group->post('/salesquery',              \App\Http\Controllers\Admin\AnalyticsController::class . ':salesquery');	
		$group->post('/getGoogleToken',          \App\Services\MailServices\GoogleToken::class . ':getGoogleToken');
		
		$group->post('/cartquery',               \App\Http\Controllers\Admin\PackageController::class . ':cartquery');
		$group->post('/planquery',               \App\Http\Controllers\Admin\OrdersController::class . ':planquery');
		
		$group->post('/affiliate',               \App\Http\Controllers\Admin\SetttingsController::class . ':affiliate');	
		$group->post('/payout',                  \App\Http\Controllers\Admin\SetttingsController::class . ':payoutmode');
		$group->get('/system',                   \App\Http\Controllers\Admin\SetttingsController::class . ':sysview');
		$group->post('/sysconfig',               \App\Http\Controllers\Admin\SetttingsController::class . ':sysconfig');				
		$group->get('/payments',                 \App\Http\Controllers\Admin\SetttingsController::class . ':payview')->add(new AppMiddleware());
		$group->post('/payments',                \App\Http\Controllers\Admin\SetttingsController::class . ':payments')->add(new AppMiddleware());	
		$group->get('/notification',             \App\Http\Controllers\Admin\SetttingsController::class . ':notiview')->add(new AppMiddleware());
		$group->post('/notification',            \App\Http\Controllers\Admin\SetttingsController::class . ':notification')->add(new AppMiddleware());	
		$group->get('/google',                	 \App\Http\Controllers\Admin\SetttingsController::class . ':googleview')->add(new AppMiddleware());
		$group->post('/google',               	 \App\Http\Controllers\Admin\SetttingsController::class . ':google')->add(new AppMiddleware());			
		$group->get('/others',                	 \App\Http\Controllers\Admin\SetttingsController::class . ':othersview');
		$group->post('/others',               	 \App\Http\Controllers\Admin\SetttingsController::class . ':others');			
		$group->get('/access',                	 \App\Http\Controllers\Admin\SetttingsController::class . ':accessview')->add(new AppMiddleware());
		$group->post('/access',               	 \App\Http\Controllers\Admin\SetttingsController::class . ':access')->add(new AppMiddleware());		
		$group->get('/register',                 \App\Http\Controllers\Admin\SetttingsController::class . ':regview');
		$group->post('/register',                \App\Http\Controllers\Admin\SetttingsController::class . ':register');
			
		
		$group->post('/upload_logo',             \App\Http\Controllers\Admin\SetttingsController::class . ':upload_logo');
		$group->post('/remove_logo',             \App\Http\Controllers\Admin\SetttingsController::class . ':remove_logo');
        $group->post('/config',                  \App\Http\Controllers\Admin\SetttingsController::class . ':config');
		$group->post('/restriction',             \App\Http\Controllers\Admin\SetttingsController::class . ':restriction');
		$group->post('/upload',            	   	 \App\Http\Controllers\Admin\SetttingsController::class . ':upload');
		$group->post('/uploadwx',                \App\Http\Controllers\Admin\SetttingsController::class . ':uploadwx');
		$group->post('/apikey',            	   	 \App\Http\Controllers\Admin\SetttingsController::class . ':apikey');
		
        $group->get('/server',                   \App\Http\Controllers\Admin\ServerController::class . ':index');
        $group->get('/server/create',            \App\Http\Controllers\Admin\ServerController::class . ':create');
        $group->post('/server',                  \App\Http\Controllers\Admin\ServerController::class . ':add');
        $group->get('/server/{id}/edit',         \App\Http\Controllers\Admin\ServerController::class . ':edit');
        $group->put('/server/{id}',              \App\Http\Controllers\Admin\ServerController::class . ':update');
        $group->delete('/server',                \App\Http\Controllers\Admin\ServerController::class . ':delete');
        $group->post('/server/ajax',             \App\Http\Controllers\Admin\ServerController::class . ':ajax');
		$group->post('/server/status',   		 \App\Http\Controllers\Admin\ServerController::class . ':status');
		
		$group->get('/currency',             	 \App\Http\Controllers\Admin\CurrencyController::class . ':index')->add(new AppMiddleware());
        $group->post('/currency',            	 \App\Http\Controllers\Admin\CurrencyController::class . ':add');
        $group->get('/currency/{id}/edit',   	 \App\Http\Controllers\Admin\CurrencyController::class . ':edit')->add(new AppMiddleware());
        $group->put('/currency/{id}',        	 \App\Http\Controllers\Admin\CurrencyController::class . ':update');
        $group->delete('/currency',          	 \App\Http\Controllers\Admin\CurrencyController::class . ':delete');
        $group->post('/currency/ajax',       	 \App\Http\Controllers\Admin\CurrencyController::class . ':ajax_currency');
		$group->post('/currency_update',       	 \App\Http\Controllers\Admin\CurrencyController::class . ':currency_update');
		$group->post('/currency_settings',       \App\Http\Controllers\Admin\CurrencyController::class . ':currency_settings');
		$group->post('/currency/status',   		 \App\Http\Controllers\Admin\CurrencyController::class . ':status');
		
        $group->get('/package',             	 \App\Http\Controllers\Admin\PackageController::class . ':index')->add(new AppMiddleware());
        $group->post('/package/ajax',            \App\Http\Controllers\Admin\PackageController::class . ':ajax_package');		
        $group->get('/package/create',      	 \App\Http\Controllers\Admin\PackageController::class . ':create')->add(new AppMiddleware());
        $group->post('/package',                 \App\Http\Controllers\Admin\PackageController::class . ':add');
        $group->get('/package/{id}/edit',        \App\Http\Controllers\Admin\PackageController::class . ':edit')->add(new AppMiddleware());
        $group->put('/package/{id}',             \App\Http\Controllers\Admin\PackageController::class . ':update');
        $group->delete('/package',               \App\Http\Controllers\Admin\PackageController::class . ':deleteGet');
		$group->post('/package/status',   		 \App\Http\Controllers\Admin\PackageController::class . ':status');
		
		$group->get('/setup',               	\App\Http\Controllers\Admin\TutorialController::class . ':setup');
		$group->post('/setup/ajax',   			\App\Http\Controllers\Admin\TutorialController::class . ':ajax_setup');	
		$group->post('/setup/status',   		\App\Http\Controllers\Admin\TutorialController::class . ':setup_status');
		$group->get('/setup/create',  			\App\Http\Controllers\Admin\TutorialController::class . ':setup_create');
		$group->post('/setup',   				\App\Http\Controllers\Admin\TutorialController::class . ':setup_add');
		$group->get('/setup/{id}/edit', 		\App\Http\Controllers\Admin\TutorialController::class . ':setup_edit');
		$group->put('/setup/{id}',    			\App\Http\Controllers\Admin\TutorialController::class . ':setup_update');
		$group->delete('/setup',      			\App\Http\Controllers\Admin\TutorialController::class . ':setup_delete');
		$group->post('/uploads',            	\App\Http\Controllers\Admin\TutorialController::class . ':upload');
		
		$group->get('/faq',               		\App\Http\Controllers\Admin\FaqController::class . ':faq')->add(new AppMiddleware());
		$group->post('/faq/ajax',   			\App\Http\Controllers\Admin\FaqController::class . ':ajax_faq');	
		$group->post('/faq/status',   			\App\Http\Controllers\Admin\FaqController::class . ':faq_status');
		$group->get('/faq/create',  			\App\Http\Controllers\Admin\FaqController::class . ':faq_create')->add(new AppMiddleware());
		$group->post('/faq',   					\App\Http\Controllers\Admin\FaqController::class . ':faq_add');
		$group->get('/faq/{id}/edit', 			\App\Http\Controllers\Admin\FaqController::class . ':faq_edit')->add(new AppMiddleware());
		$group->put('/faq/{id}',    			\App\Http\Controllers\Admin\FaqController::class . ':faq_update');
		
		$group->get('/account',               	\App\Http\Controllers\Admin\AccountsController::class . ':account')->add(new AppMiddleware());
		$group->post('/account/ajax',   		\App\Http\Controllers\Admin\AccountsController::class . ':ajax_account');	
		$group->post('/account/status',   		\App\Http\Controllers\Admin\AccountsController::class . ':account_status');
		$group->get('/account/create',  		\App\Http\Controllers\Admin\AccountsController::class . ':account_create')->add(new AppMiddleware());
		$group->post('/account',   				\App\Http\Controllers\Admin\AccountsController::class . ':account_add');
		$group->get('/account/{id}/edit', 		\App\Http\Controllers\Admin\AccountsController::class . ':account_edit')->add(new AppMiddleware());
		$group->put('/account/{id}',    		\App\Http\Controllers\Admin\AccountsController::class . ':account_update');
		
		
		$group->get('/cloudflare',              \App\Http\Controllers\Admin\CloudflareController::class . ':index')->add(new AppMiddleware());
		$group->post('/cloudflare/ajax',   		\App\Http\Controllers\Admin\CloudflareController::class . ':ajax_zones');	
		$group->post('/cloudflare/status',   	\App\Http\Controllers\Admin\CloudflareController::class . ':zone_status');
		$group->get('/cloudflare/create',  		\App\Http\Controllers\Admin\CloudflareController::class . ':add_zone')->add(new AppMiddleware());
		$group->post('/cloudflare',   			\App\Http\Controllers\Admin\CloudflareController::class . ':create_zone');
		$group->get('/cloudflare/{id}/edit', 	\App\Http\Controllers\Admin\CloudflareController::class . ':edit_zone')->add(new AppMiddleware());
		$group->put('/cloudflare/{id}',    		\App\Http\Controllers\Admin\CloudflareController::class . ':update_zone');

        $group->get('/notice',             	 	\App\Http\Controllers\Admin\NoticeController::class . ':index');
        $group->get('/notice/create',      	 	\App\Http\Controllers\Admin\NoticeController::class . ':create');
        $group->post('/notice',            	 	\App\Http\Controllers\Admin\NoticeController::class . ':add');
        $group->get('/notice/{id}/edit',   	 	\App\Http\Controllers\Admin\NoticeController::class . ':edit');
        $group->put('/notice/{id}',        	 	\App\Http\Controllers\Admin\NoticeController::class . ':update');
        $group->delete('/notice',          	 	\App\Http\Controllers\Admin\NoticeController::class . ':delete');
        $group->post('/notice/ajax',       	 	\App\Http\Controllers\Admin\NoticeController::class . ':ajax');
		
        $group->get('/login',               	\App\Http\Controllers\Admin\IpController::class . ':index')->add(new AppMiddleware());
        $group->get('/online',              	\App\Http\Controllers\Admin\IpController::class . ':alive')->add(new AppMiddleware());
        $group->post('/login/ajax',             \App\Http\Controllers\Admin\IpController::class . ':ajax_login');
        $group->post('/alive/ajax',             \App\Http\Controllers\Admin\IpController::class . ':ajax_alive');
		
        $group->get('/user',                    \App\Http\Controllers\Admin\UserController::class . ':index')->add(new AppMiddleware());
        $group->get('/user/{id}/edit',          \App\Http\Controllers\Admin\UserController::class . ':edit')->add(new AppMiddleware());
		$group->get('/contact/{id}',           	\App\Http\Controllers\Admin\UserController::class . ':contact');
		$group->get('/data',           		    \App\Http\Controllers\Admin\UserController::class . ':getData');
		$group->post('/data',           		\App\Http\Controllers\Admin\UserController::class . ':addData');
		$group->post('/addData',           		\App\Http\Controllers\Admin\UserController::class . ':packageList');
		$group->post('/contact',           		\App\Http\Controllers\Admin\UserController::class . ':send_message');
		$group->put('/user/{id}',               \App\Http\Controllers\Admin\UserController::class . ':update');
        $group->delete('/user',                 \App\Http\Controllers\Admin\UserController::class . ':delete');
        $group->post('/user/changetouser',      \App\Http\Controllers\Admin\UserController::class . ':changetouser');
        $group->post('/user/ajax',              \App\Http\Controllers\Admin\UserController::class . ':ajax');
        $group->post('/user/create',            \App\Http\Controllers\Admin\UserController::class . ':createNewUser');
		$group->post('/userquery',              \App\Http\Controllers\Admin\UserController::class . ':userquery');
		
        $group->get('/coupon',                  \App\Http\Controllers\Admin\CouponController::class . ':index')->add(new AppMiddleware());
        $group->post('/coupon/ajax',            \App\Http\Controllers\Admin\CouponController::class . ':ajax_coupon');
		$group->get('/coupon/create',  			\App\Http\Controllers\Admin\CouponController::class . ':create')->add(new AppMiddleware());
		$group->post('/coupon',   				\App\Http\Controllers\Admin\CouponController::class . ':addCoupon');
		$group->get('/coupon/{id}/edit', 		\App\Http\Controllers\Admin\CouponController::class . ':edit')->add(new AppMiddleware());
		$group->put('/coupon/{id}',    			\App\Http\Controllers\Admin\CouponController::class . ':editCoupon');
		
        $group->get('/subscribe',         		\App\Http\Controllers\Admin\SubscribeController::class . ':index')->add(new AppMiddleware());
        $group->post('/subscribe/ajax',         \App\Http\Controllers\Admin\SubscribeController::class . ':ajax_subscribe_log');

		$group->get('/orders',           		\App\Http\Controllers\Admin\OrdersController::class . ':order')->add(new AppMiddleware());
		$group->delete('/order',           	   	\App\Http\Controllers\Admin\OrdersController::class . ':delete');
		$group->post('/order/ajax',       	   	\App\Http\Controllers\Admin\OrdersController::class . ':ajax_order');
		$group->get('/order/notify',       	   	\App\Http\Controllers\Admin\OrdersController::class . ':notify');
		$group->get('/order/delexp',       	   	\App\Http\Controllers\Admin\OrdersController::class . ':delexp');
		$group->get('/order/delall',       	   	\App\Http\Controllers\Admin\OrdersController::class . ':delall');
		$group->get('/order/cancel',       	   	\App\Http\Controllers\Admin\OrdersController::class . ':cancel_order');
 
        $group->get('/rule',                   	\App\Http\Controllers\Admin\RuleController::class . ':index')->add(new AppMiddleware());
        $group->get('/rule/create',            	\App\Http\Controllers\Admin\RuleController::class . ':create')->add(new AppMiddleware());
        $group->post('/rule',                  	\App\Http\Controllers\Admin\RuleController::class . ':add');
        $group->get('/rule/{id}/edit',         	\App\Http\Controllers\Admin\RuleController::class . ':edit')->add(new AppMiddleware());
        $group->put('/rule/{id}',              	\App\Http\Controllers\Admin\RuleController::class . ':update');
        $group->delete('/rule',                	\App\Http\Controllers\Admin\RuleController::class . ':delete');
        $group->get('/rule/log',               	\App\Http\Controllers\Admin\RuleController::class . ':log');
        $group->post('/rule/ajax',             	\App\Http\Controllers\Admin\RuleController::class . ':ajax_rule');
        $group->post('/rule/log/ajax',         	\App\Http\Controllers\Admin\RuleController::class . ':ajax_log');
    })->add(new AdminMiddleware());	
	

    $app->group('/api', function (RouteCollectorProxy $group) { 
        $group->get('/users',                	\App\Http\Controllers\Api\UserApiController::class . ':userList'); 
        $group->post('/users/traffic',       	\App\Http\Controllers\Api\TrafficController::class . ':addTraffic');
        $group->post('/users/aliveip',       	\App\Http\Controllers\Api\AliveIpController::class . ':addAliveIp');
		$group->post('/server/{id}/info',     	\App\Http\Controllers\Api\ServerStatusController::class . ':server_status');		
		$group->get('/server/{id}/info',      	\App\Http\Controllers\Api\ServerController::class . ':server_info');
		$group->get('/rules/detect_rules',    	\App\Http\Controllers\Api\DetectController::class . ':detectRules');
		$group->post('/users/detectlog',     	\App\Http\Controllers\Api\DetectController::class . ':detectLogs');
		$group->get('/server/relay/{id}/info',  \App\Http\Controllers\Api\RelayController::class . ':relay_info');
		
	})->add(new WebapiMiddleware());
	
    $app->group('/link', function (RouteCollectorProxy $group) {
        $group->get('/{token}',          	    \App\Http\Controllers\User\LinkController::class . ':GetContent');
    });
};