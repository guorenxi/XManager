<script>
window.addEventListener('load', () => { 
	$(".duration li a").first().addClass("active");
	$(".paym:first-child").addClass("active");
	$(".paym li a").first().addClass("active");	
}); 
</script>
{include file='user/header.tpl'}
{$custom = json_decode($package->custom)}
{$monthly = json_decode($package->monthly)}
{$quaterly = json_decode($package->quaterly)}
{$semiannually = json_decode($package->semiannually)}
{$annually = json_decode($package->annually)}
<script src="/assets/js/core/mobile-detect.min.js"></script>
<div class="content-header row">
   <div class="content-header-left col-md-9 col-12 mb-2">
      <div class="row breadcrumbs-top">
         <div class="col-12">
            <h2 class="content-header-title float-left mb-0">{$lang->get('Checkout')}</h2>
            <div class="breadcrumb-wrapper">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/portal/clientarea">{$lang->get('home')}</a>
                  </li>
                  <li class="breadcrumb-item"><a href="/portal/packages">{$lang->get('packages')}</a>
                  </li>
                  <li class="breadcrumb-item active"><a href="/portal/checkout?id={$package->id}">{$lang->get('Checkout')}</a>
                  </li>
               </ol>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="content-body">
<div class="row">
<div class="col-12 col-md-7 col-lg-8">
<div class="row">
	{if $package->note != ""}
	<div class="col-12 col-md-12 col-lg-12">
	<div class="card">
	<div class="card-body justify-content-center">
		<h4><b>{$lang->get('bnote')}</b></h4>
		<hr>
		{$package->note}
	</div>
	</div>
	</div>
	{/if}
	
	<div class="col-12 col-md-12 col-lg-12">
	<div class="card">
	<div class="card-body justify-content-center">
		<h4><b>{if $lang_cookie == "en"}{$package->name}{else}{$package->cn_name}{/if} </b></h4>
		<hr>
		<br>
		{if $package->type == 2}
		<h6><b>{$lang->get('Data')} : </b> {if $package->bandwidth >= 10000}{$lang->get('Unlimited')}{else}{$package->bandwidth} GB{/if} </h6>
		<h6><b>{$lang->get('devices')} : </b> {if $package->connector == '0' } {$lang->get('Unlimited')}{else}{$package->connector}{/if}</h6>
		<h6><b>{$lang->get('userlevel')} : </b> {if $package->level <= 0}{$lang->get('userfree')}{else}Lv {$package->level}{/if}</h6>
		<h6><b>{$lang->get('Speed')} : </b> {if $package->speedlimit == '0' }1 Gbps{else}{$package->speedlimit} Mbps{/if}</h6>
		{if $package->reset_renew != 1}
		<h6><b>{$lang->get('Reset')} : </b>{$lang->get('None')}</h6>
		{else}
		<h6><b>{$lang->get('Reset')} : </b> {$package->bandwidth}GB / {$package->reset_every_days} {$lang->get('Days')}</h6>
		{/if}
		<h6><b>{$lang->get('OrderType')} : </b> {$lang->get('DataPackage')} </h6>
		{else}
		<h4><b>{$package->name} </b></h4>
		<h6>{$lang->get('OrderType')} : {$lang->get('DataTopUp')}</h6>
		<h6>{$lang->get('Data')} : {if $package->bandwidth >= 10000}{$lang->get('Unlimited')}{else}{$package->bandwidth} GB{/if}</h6>
		{/if}
	</div>
	</div>
	</div>
	
	<div class="col-12 col-md-12 col-lg-12">
	<div class="card">
	<div class="card-body justify-content-center">
		<h4><b>{$lang->get('BillingCycle')}</b></h4>
		<hr>
		<br>
		<div class="clo-lg-12 col-md-12 mb-2">
		   <div class="form-group row">
			  <label for="" class="col-sm-2 col-form-label"></label>
			  <div class="col-sm-10 duration" >
				 <ul class="nav nav-pills justify-content-center" id="duration">
					{if $package->type == 2}
						{if $custom->status == 1 && $custom->price != ""}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill" onClick="SwitchBilling('{$custom->expire}@{number_format($custom->price,2)}')" style="font-size:12px;width:140px" value="{$custom->expire}@{number_format($custom->price,2)}"><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$custom->expire} {$lang->get('Days')}</center></a>
						</li> 
						{/if}
						
						{if $monthly->status == 1 && $monthly->price != ""}
						<li class="nav-item mr-1">
							<a class="nav-link  text-center mb-1" data-toggle="pill" onClick="SwitchBilling('{$monthly->expire}@{number_format($monthly->price,2)}')" style="font-size:12px;width:140px" value="{$monthly->expire}@{number_format($monthly->price,2)}"><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$lang->get('PMonthly')}</center></a>
						</li> 
						{/if}
						
						{if $quaterly->status == 1 && $quaterly->price != ""}
						<li class="nav-item mr-1">
							<a class="nav-link  text-center mb-1" data-toggle="pill" onClick="SwitchBilling('{$quaterly->expire}@{number_format($quaterly->price,2)}')" style="font-size:12px;width:140px" value="{$quaterly->expire}@{number_format($quaterly->price,2)}"><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$lang->get('PQuaterly')}</center></a>
						</li>
						{/if}
						
						{if $semiannually->status == 1 && $semiannually->price != ""}
						<li class="nav-item mr-1">
							<a class="nav-link  text-center mb-1" data-toggle="pill" onClick="SwitchBilling('{$semiannually->expire}@{number_format($semiannually->price,2)}')" style="font-size:12px;width:140px" value="{$semiannually->expire}@{number_format($semiannually->price,2)}"><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$lang->get('PSemi')}</center></a>
						</li>
						{/if}
						
						{if $annually->status == 1 && $annually->price != ""}
						<li class="nav-item mr-1">
							<a class="nav-link  text-center mb-1" data-toggle="pill" onClick="SwitchBilling('{$annually->expire}@{number_format($annually->price,2)}')" style="font-size:12px;width:140px" value="{$annually->expire}@{number_format($annually->price,2)}"><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$lang->get('PAnnually')}</center></a>
						</li>
						{/if}
					{else}
						{if $package->status == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link  text-center mb-1" data-toggle="pill" onClick="SwitchBilling('1@{number_format($package->topup_price,2)}')" style="font-size:12px;width:140px" value="1@{number_format($package->topup_price,2)}" ><center><i class="fad fa-shopping-cart" style="font-size:20px"></i></br></br>{$lang->get('topup')} </center></a>
						</li>
						{/if}
					{/if}
					
				 </ul>
				 
			  </div>
		   </div>
		</div>
		
		<h4><b>{$lang->get('PaymentMethod')}</b></h4>
		<hr>
		<br>
		<div class="clo-lg-12 col-md-12 mb-2">
		   <div class="form-group row">
			  <label for="" class="col-sm-2 col-form-label"></label>
			  <div class="col-sm-10 paym ">
				   <ul class="nav nav-pills justify-content-center" id="paym">
						{if $Config['pay_bal'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill"  style="font-size:12px;width:140px" onClick="paySwitch('11')" value="11"><center><span class="currency currency-money" style="font-size:20px"></span> </br></br> {$lang->get('balance')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_vpay'] == 1 && $Config['enable_vpay_alipay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1 " data-toggle="pill"  style="font-size:12px;width:140px" onClick="paySwitch('1')" value="1"><center><span class="currency currency-alipay" style="font-size:20px"></span> </br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_vpay'] == 1 && $Config['enable_vpay_wechat'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"   data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('2')" value="2"><center><span class="currency currency-wechat-pay" style="font-size:20px"></span></br></br>{$lang->get('Wechat')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_stripe'] == 1 && $Config['enable_stripe_alipay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('4')" value="4"><center><span class="currency currency-alipay" style="font-size:20px"></span></br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_stripe'] == 1 && $Config['enable_stripe_wechat'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('3')" value="3"><center><span class="currency currency-wechat-pay" style="font-size:20px"></span> </br></br> {$lang->get('Wechat')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_stripe'] == 1 && $Config['enable_stripe_card'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('16')" value="16"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('credit_card')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_theadpay'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill"  style="font-size:12px;width:140px" onClick="paySwitch('8')" value="8"><center><span class="currency currency-alipay" style="font-size:20px"></span> </br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_mgate'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill"  style="font-size:12px;width:140px" onClick="paySwitch('10')" value="10"><center><span class="currency currency-alipay" style="font-size:20px"></span></br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_easypay'] == 1 && $Config['enable_easypay_alipay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('9')" value="9"><center><span class="currency currency-alipay" style="font-size:20px"></span></br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_easypay'] == 1 && $Config['enable_easypay_wechat'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('12')" value="12"><center><span class="currency currency-wechat-pay" style="font-size:20px"></span> </br></br> {$lang->get('Wechat')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_f2fpay'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('7')" value="7"><center><span class="currency currency-alipay" style="font-size:20px"></span> </br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paypal'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill" style="font-size:12px;width:140px" {if $Config['paypal_type'] == 1}onClick="paySwitch('5')"{else}onClick="paySwitch('13')"{/if} value="5"><center><span class="currency currency-paypal" style="font-size:20px"></span> </br></br> Paypal</center></a>
						</li> 
						{/if}
						{if $Config['enable_coinpayments'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('6')" value="6"><center>{if $Config['cp_currency'] == "BTC"}<span class="currency currency-bitcoin" style="font-size:20px"></span></br></br> BTC ({$lang->get('crytos')}){else}<span class="currency currency-usdt" style="font-size:20px"></span></br></br> USDT ({$lang->get('crytos')}){/if}</center></a>
						</li> 
						{/if}
						{if $Config['enable_token188'] == 1 }
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1" data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('14')" value="14"><center><span class="currency currency-usdt" style="font-size:20px"></span></br></br> USDT ({$lang->get('crytos')})</center></a>
						</li> 
						{/if}
						
						{if $Config['enable_paymentwall'] == 1 && $Config['paymentwall_alipay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('17')" value="17"><center><span class="currency currency-alipay" style="font-size:20px"></span></br></br> {$lang->get('alipay')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paymentwall'] == 1 && $Config['paymentwall_wechat'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('18')" value="18"><center><span class="currency currency-wechat-pay" style="font-size:20px"></span> </br></br> {$lang->get('Wechat')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paymentwall'] == 1 && $Config['paymentwall_card'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('19')" value="19"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('credit_card')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paymentwall'] == 1 && $Config['paymentwall_unionpay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('20')" value="20"><center><span class="currency currency-unionpay-3" style="font-size:20px"></span> </br></br> {$lang->get('unionpay')}</center></a>
						</li> 
						{/if}
						
						{if $Config['enable_rave'] == 1 && $Config['rave_card'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('21')" value="21"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('credit_card')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_rave'] == 1 && $Config['rave_mobile_money'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('22')" value="22"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('mobile_money')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paystack'] == 1 && $Config['paystack_card'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('23')" value="23"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('credit_card')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_paystack'] == 1 && $Config['paystack_mobile_money'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('24')" value="24"><center><span class="currency currency-bank-card" style="font-size:20px"></span> </br></br> {$lang->get('mobile_money')}</center></a>
						</li> 
						{/if}
						{if $Config['enable_binancepay'] == 1}
						<li class="nav-item mr-1">
							<a class="nav-link text-center mb-1"  data-toggle="pill" style="font-size:12px;width:140px" onClick="paySwitch('25')" value="25"><center><span class="currency currency-usdt" style="font-size:20px"></span></br></br> BinancePay</center></a>
						</li> 
						{/if}
					</ul>
			  </div>
		   </div>	
		</div>
	</div>
	</div>
	</div>	
</div>	
</div>


<div class="col-12 col-md-5 col-lg-4">
<div class="card ">
<div class="card-body justify-content-center">

		<h4><b>{$lang->get('ProductSummary')}</b></h4>
		<hr>
		<br>
		<div class="checkout-options">
		   <div class="price-details">
			  <ul class="list-unstyled ">
				 <li class="price-detail">
					<div class="detail-title"><b>{$lang->get('SubTotal')}</b></div>
					<div class="detail-amt" id="sub-total">
					   {$Config['default_currency_symbol']} {$price}
					</div>
				 </li>
				 <li class="price-detail mt-1" {if $Config['disable_coupon'] == 0}hidden{/if}>
					<div class="detail-title"><b>{$lang->get('discount')}</b></div>
					<div class="detail-amt discount-amt" id="credit">
						{$Config['default_currency_symbol']} 0.00
					</div>
				 </li>
				 <hr {if $Config['disable_coupon'] == 0}hidden{/if}>
				 <div class="input-group text-right" {if $Config['disable_coupon'] == 0}hidden{/if}>
                    <input type="text" id="coupon" class="form-control" placeholder="{$lang->get('DiscountCode')}" aria-describedby="button-addon2"/>
                    <div class="input-group-append">
                        <button class="btn btn-relief-primary discount" style="background-color:{$Config['app_color']};color:white" type="button" id="coupon_input"><i class="fad fa-tags"></i> {$lang->get('RedeemC')}</button>
                    </div>
                 </div>
				 <input type="text" id="camt" value="0.00" hidden class="form-control">
				 <input type="text" id="renew" value="0" hidden class="form-control">
				 <hr>
				 <li class="price-detail mt-1">
					<div class="detail-title"><h4><b>{$lang->get('TotalAmount')}</b></h4></div>
					<div class="detail-amt discount-amt" id="total">
						<h4><b>{$Config['default_currency_symbol']} {$price}</b></h4>
					</div>
				 </li>
			  </ul>
		   </div>
		</div>	
		<div class="col-12 col-md-12 col-lg-12 text-center mb-50 mt-3">
            <button class="btn btn-blockbtn-relief-primary" style="background-color:{$Config['app_color']};color:white;width:100%" type="button" id="pay" > <b>{$lang->get('PayNow')}</b></button>
			<div id="paypal-button" style="width: 100%;" hidden></div>
		</div>		
</div>
</div>	
</div>
</div>

<div class="modal fade" id="theadpaymod" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']}">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close"  id="deltheadpay" >x</button>
         </div>
         <div class="modal-body">
            <center>
               <div id="theadpayqrcode" style="position: relative;display: inline-block;" ></div></br>
               <b><span id="theadpaymobile" style="font-size:15px;color:black" hidden></span></br> <span  id="amountt" style="font-size:15px;color:red"></span></b>
            </center>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="payment2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']}">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignleft"  id="down" style="font-size:15px;color:#ffffff"></span>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close"  id="delorders" >x</button>
         </div>
         <div class="modal-body">
            <center>
               <input class="form-control " id="exp" hidden>
               <div id="qrcode" style="position: relative;display: inline-block;" ></div>
               <b><span id="address" style="font-size:10px;color:black"></span></br> <span  id="amount" style="font-size:15px;color:red"></span></b>
            </center>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']};color:#ffffff">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignleft" id="timeout" style="margin-top:-3px;font-size:15px;color:#ffffff"></span>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close" id="delorder" >x</button>
         </div>
         <div class="modal-body">
            <center>
               <div id="qrcode1" style="position: relative;display: inline-block;" ></div></br>
               <b><span id="mobile" style="font-size:15px;color:black"></span></br> <span id="pay_amount" style="font-size:15px;color:red"></span></b>
            </center>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="f2fpay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']};color:#ffffff">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close" id="delf2f" >x</button>
         </div>
         <div class="modal-body">
            <center>
               <div id="f2fqrcode" style="position: relative;display: inline-block;" ></div></br>
               <b><span id="f2fmobile" style="font-size:15px;color:black" hidden></span></br> <span id="f2famount" style="font-size:15px;color:red"></span></b>
            </center>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="stripepay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']};color:#ffffff">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close" id="stripedel" >x</button>
         </div>
         <div class="modal-body">
            <center>
               <div id="stripeqrcode" style="position: relative;display: inline-block;" ></div></br>
               <b></br> <span id="stripeamount" style="font-size:15px;color:red"></span></b>
            </center>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="binancepay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered modal-xs" role="document">
      <div class="modal-content" >
         <div class="modal-header" style="background-color:{$Config['app_color']};color:#ffffff">
            <h6 class="modal-title" style="width:100%">
               <div>
                  <span class="alignright"  style="font-size:15px;color:#ffffff">{$lang->get('wait')}</span>
               </div>
            </h6>
            <button type="button" class="close" id="del_borders" >x</button>
         </div>
         <div class="modal-body">
            <center>
			   <b><span id="bamount" style="font-size:15px;color:red"></span></b></br>
               <div id="bqrcode" style="position: relative;display: inline-block;" ></div></br>
               <b>
			   <span id="bmobile" style="font-size:15px;color:black"></span></br>
			   </b>
            </center>
         </div>
      </div>
   </div>
</div>
{include file='user/footer.tpl'}
<script>
layui.use('layer', function(){});

window.addEventListener('load', () => { 
	var val = $("#paym").find(".active");
    var paymentmethod = val.attr('value');
   	if (paymentmethod == 5){
   		document.getElementById("paypal-button").hidden = false;
   		document.getElementById("pay").hidden = true;
   	}else{
		document.getElementById("paypal-button").hidden = true;
   		document.getElementById("pay").hidden = false;	
   	}
})	


function paySwitch(val){
   	if (val == 5){
   		document.getElementById("paypal-button").hidden = false;
   		document.getElementById("pay").hidden = true;
   	}else{
		document.getElementById("paypal-button").hidden = true;
   		document.getElementById("pay").hidden = false;	
   	}	
}


function SwitchBilling(val){
    let discount = $("#camt").val();
	let price = val.split("@")[1];
	let p = price.replace(/,/g, "");
	let cost = Number(p) - Number(discount);
	document.getElementById('sub-total').innerHTML = "{$Config['default_currency_symbol']} " + price;
	document.getElementById('total').innerHTML = "<h4><b>{$Config['default_currency_symbol']} " + cost.toFixed(2) + "</b></h4>";
}

$(document).ready(function () {
   $("#coupon_input").click(function () {
      var coup = $("#coupon").val();
	  var val = $("#duration").find(".active");
      var duration = val.attr('value');
	  var p = duration.split('@')[1];
	  let price = p.replace(/,/g, "");
      if (coup == "" || coup == null) {
		Swal.fire({
			title: '',
			text: panel.CouponReq,
			icon: 'error',
			showCancelButton: false,
			showConfirmButton:true,
			confirmButtonText: "{$lang->get('ok')}",
			allowOutsideClick: false,
			width: '400px',
			height: '250px',
			padding: '1em',
			customClass: {
				confirmButton: 'btn btncolor ms-1 ',
				cancelButton: 'btn btn-dark ms-1'
			},
			buttonsStyling: false
		});
        return;
      }
      $.ajax({
         type: "POST",
         url: "/portal/coupon_check",
         dataType: "json",
         data: {
            package: {$package->id},
            coupon: $("#coupon").val(),
			price,
         },
         success: (data) => {
            if (data.ret) {
			   document.getElementById('camt').value = data.credit;
               document.getElementById('credit').innerHTML = "{$Config['default_currency_symbol']} " + data.credit;
               document.getElementById('total').innerHTML = "<h4><b>{$Config['default_currency_symbol']} " + data.total + "</b></h4>";
               document.getElementById("coupon").disabled = true;
               document.getElementById("coupon_input").disabled = true;
				Swal.fire({
					title: '',
					text: data.msg,
					icon: 'success',
					showCancelButton: false,
					showConfirmButton:true,
					confirmButtonText: "{$lang->get('ok')}",
					allowOutsideClick: false,
					width: '400px',
					height: '250px',
					padding: '1em',
					customClass: {
						confirmButton: 'btn btncolor ms-1 ',
						cancelButton: 'btn btn-dark ms-1'
					},
					buttonsStyling: false
				});
            } else {
				Swal.fire({
					title: '',
					text: data.msg,
					icon: 'error',
					showCancelButton: false,
					showConfirmButton:true,
					confirmButtonText: "{$lang->get('ok')}",
					allowOutsideClick: false,
					width: '400px',
					height: '250px',
					padding: '1em',
					customClass: {
						confirmButton: 'btn btncolor ms-1 ',
						cancelButton: 'btn btn-dark ms-1'
					},
					buttonsStyling: false
				});
            }
         },
         error: (jqXHR) => {
			Swal.fire({
				title: '',
				text: panel.error,
				icon: 'error',
				showCancelButton: false,
				showConfirmButton:true,
				confirmButtonText: "{$lang->get('ok')}",
				allowOutsideClick: false,
				width: '400px',
				height: '250px',
				padding: '1em',
				customClass: {
					confirmButton: 'btn btncolor ms-1 ',
					cancelButton: 'btn btn-dark ms-1'
				},
				buttonsStyling: false
			});
         }
      });
   });
});
</script>
{if $Config['paypal_type'] == 1}
	{include file='include/paymethod/paypal.tpl'}
{else}	
	{include file='include/paymethod/paypalex.tpl'}
{/if}
{include file='include/paymethod/balance.tpl'}
{include file='include/paymethod/vpay.tpl'}
{include file='include/paymethod/coinpayments.tpl'}
{include file='include/paymethod/f2fpay.tpl'}
{include file='include/paymethod/stripe.tpl'}
{include file='include/paymethod/mgate.tpl'}
{include file='include/paymethod/easypay.tpl'}
{include file='include/paymethod/theadpay.tpl'}
{include file='include/paymethod/token188.tpl'}
{include file='include/paymethod/paymentwall.tpl'}
{include file='include/paymethod/rave.tpl'}
{include file='include/paymethod/paystack.tpl'}
{include file='include/paymethod/binancepay.tpl'}
<script>
	document.getElementById('pay').addEventListener('click', () => {
		var val = $("#paym").find(".active");
        var paymethod = val.attr('value');
		
		if (paymethod == 1 || paymethod == 2){
			vpay(paymethod);
		}else if(paymethod == 3 ){
			Stripe();
		}else if(paymethod == 4 || paymethod == 16){
			StripePay(paymethod);
		}else if(paymethod == 6 ){
			Coinpayments();
		}else if(paymethod == 7){
			f2fcreate();
		}else if(paymethod == 8 ){
			theadpay();
		}else if(paymethod == 9 || paymethod == 12){
			easypay(paymethod);
		}else if(paymethod == 10 ){
			mgate();
		}else if(paymethod == 11 ){
			balance();
		}else if(paymethod == 5 ){
			paypal();
		}else if(paymethod == 14 ){
			Token188();
		}else if(paymethod == 17){
		    var type = "alipay";
			paymentwall(type);
		}else if(paymethod == 18){
			var type = "wechatpayments";
			paymentwall(type);
		}else if(paymethod == 19){
			var type = "cc";
			paymentwall(type);
		}else if(paymethod == 20){
			var type = "unionpay";
			paymentwall(type);
		}else if(paymethod == 21){
			var type = "card";
			rave(type);
		}else if(paymethod == 22){
			var type = "mobilemoney";
			rave(type);
		}else if(paymethod == 23){
			var type = "card";
			paystack(type);
		}else if(paymethod == 24){
			var type = "mobile_money";
			paystack(type);
		}else if(paymethod == 25){
			BinancePay();
		}	
	});
</script>	

