	<script>
	window.addEventListener('load', () => { 
		//$(".mlist li a").first().addClass("active");
		//$(".applist:first-child").addClass("active");
		//$(".applist li a").first().addClass("active");
		//$(".applist1 li a").first().addClass("active");
		//$(".applist2 li a").first().addClass("active");
		//$(".applist3 li a").first().addClass("active");
		//$(".applist4 li a").first().addClass("active");
		//$(".applist5 li a").first().addClass("active");
		//$(".applist6 li a").first().addClass("active");
		//$(".applist7 li a").first().addClass("active");
		$(".configlist:first-child").addClass("active");	
	}); 
	</script>
	<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
        <div class="card" >
			<div class="card-header d-flex justify-content-between align-items-center">
			  <h3 class="card-title">{$lang->get('appSetup')}</h3>
			  <i class="fad fa-sync font-medium-3 cursor-pointer" id="reset-link" style="color:{$Config['app_color']}" data-toggle="tooltip" data-placement="bottom" title="{$lang->get('ResetConfigLink')}"></i>
			</div>
            <div class="card mlist ">
			   <ul class="nav nav-pills justify-content-center" id="rounded-pills-icon-tab" role="tablist">
			    	
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link active text-center " id="rounded-pills-icon-A1-tab" data-toggle="pill" href="#rounded-pills-icon-A1" role="tab" aria-controls="rounded-pills-icon-A1" aria-selected="true" style="width:85px"><center><i class="fa-brands fa-android" style="font-size:20px"></i> </br></br> Android</center></a>
                    </li> 
					
					{if $app->getAppCount(3) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A3-tab" data-toggle="pill" href="#rounded-pills-icon-A3" role="tab" aria-controls="rounded-pills-icon-A3" aria-selected="true" style="width:85px"><center><i class="fa-brands fa-windows" style="font-size:20px"></i> </br></br>Windows</center></a>
					</li> 
				    {/if}
					{if $app->getAppCount(2) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A2-tab" data-toggle="pill" href="#rounded-pills-icon-A2" role="tab" aria-controls="rounded-pills-icon-A2" aria-selected="true" style="width:85px"><center><i class="fa-brands fa-apple" style="font-size:20px"></i> </br></br>IOS</center></a>
					</li> 
				    {/if}
				    {if $app->getAppCount(4) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A4-tab" data-toggle="pill" href="#rounded-pills-icon-A4" role="tab" aria-controls="rounded-pills-icon-A4" aria-selected="true" style="width:85px"><center><i class="fa-solid fa-apple-whole" style="font-size:20px"></i> </br></br>Mac</center></a>
					</li> 
				    {/if}
					{if $app->getAppCount(5) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A5-tab" data-toggle="pill" href="#rounded-pills-icon-A5" role="tab" aria-controls="rounded-pills-icon-A5" aria-selected="true" style="width:85px"><center><i class="fa-brands fa-linux" style="font-size:20px"></i> </br></br>Linux</center></a>
					</li> 
				    {/if}
					{if $app->getAppCount(6) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A6-tab" data-toggle="pill" href="#rounded-pills-icon-A6" role="tab" aria-controls="rounded-pills-icon-A6" aria-selected="true" style="width:85px"><center><i class="fa-solid fa-router" style="font-size:20px"></i> </br></br>Router</center></a>
					</li> 
				    {/if}
					{if $app->getAppCount(7) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A7-tab" data-toggle="pill" href="#rounded-pills-icon-A7" role="tab" aria-controls="rounded-pills-icon-A7" aria-selected="true" style="width:85px"><center><i class="fa-solid fa-user-headset" style="font-size:20px"></i> </br></br>Help</center></a>
					</li> 
					{/if}
					{if $app->getAppCount(8) > 0}
					<li class="nav-item ml-1 mr-1">
						<a class="nav-link text-center mb-1" id="rounded-pills-icon-A8-tab" data-toggle="pill" href="#rounded-pills-icon-A8" role="tab" aria-controls="rounded-pills-icon-A8" aria-selected="true" style="width:85px"><center><i class="fas fa-download fa-lg" style="font-size:20px"></i> </br></br>Others</center></a>
					</li> 
					{/if}
                </ul>
            </div>
			
			<div class="card tab-content apps" id="rounded-pills-icon-tabContent">	
				{include file='user/apps/android.tpl'}
				{include file='user/apps/windows.tpl'}
				{include file='user/apps/ios.tpl'}
				{include file='user/apps/mac.tpl'}
				{include file='user/apps/linux.tpl'}
				{include file='user/apps/router.tpl'}
				{include file='user/apps/help.tpl'}
				{include file='user/apps/others.tpl'}			
			</div>
        </div>
    </div>
	<style>				
	.modal-body {
		max-height: calc(70vh - 250px);
		overflow-y: auto;
	}
	</style>	   
    {include file='user/apps/modal.tpl'}
	{include file='user/apps/script.tpl'}
			