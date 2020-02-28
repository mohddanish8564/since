		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<aside id="left-panel">

			<!-- User info -->
			<div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as is --> 
					
					<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
						<img src="<?php echo ASSETS_URL; ?>/img/avatars/sunny.png" alt="me" class="online" /> 
					
						<i class="fa fa-angle-down"></i>
					</a> 
					
				</span>
			</div>
			<!-- end user info -->

			<!-- NAVIGATION : This navigation is also responsive

			To make this navigation dynamic please make sure to link the node
			(the reference to the nav > ul) after page load. Or the navigation
			will not initialize.
			-->

<nav>
				<!-- NOTE: Notice the gaps after each icon usage <i></i>..78043678
				Please note that these links work a bit different than
				traditional hre="" links. See documentation for details.
				-->
				<ul style="">
				<li class="active"><a href="<?php echo APP_URL; ?>/custom-dashboard" title="Dashboard">
					<i class="fa fa-lg fa-fw fa-home"></i>
					<span class="menu-item-parent">Dashboard </span>
					
				</a></li>
				<?php if($this->session->userdata('role')==1) {?>
				<li class=""><a href="#" title="Smart UI">
					<i class="fa fa-lg fa-fw fa-users"></i>
					<span class="menu-item-parent">Create Users</span>
					
				<b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a><ul style="display: none;">
				<li><a href="<?php echo base_url();?>create-user" title="Carousel">
					
					Create Users 
					
				</a></li><li><a href="<?php echo base_url();?>user-list" title="Tab">
					
					User List 
					
				</a></li></ul>
				</li>


				<?php } ?>
				
										<?php if($this->session->userdata('role')==1) {?>
				<li class="active"><a href="<?php echo APP_URL; ?>/import-database" title="Dashboard">
					<i class="fa fa-lg fa-fw fa-database"></i>
					<span class="menu-item-parent">Import Database</span>
					
				</a></li>
				
						<?php } ?>
				
				
				<li class=""><a href="#" title="Smart UI">
					<i class="fa fa-lg fa-fw fa-file-excel-o"></i>
					<span class="menu-item-parent">Reports</span>
					
				<b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b><b class="collapse-sign"><em class="fa fa-plus-square-o"></em></b></a><ul style="display: none;">
				<li><a href="<?php echo base_url(); ?>overall_objective_report" title="Carousel">Overall Objective Reports.</a></li>
				<!--<li><a href="<?php echo base_url(); ?>overall_objective_reportold" title="Carousel">Overall Objective Reports Old.</a></li>	-->			
			<!--	<li><a href="<?php echo base_url(); ?>expected_outcome1_report" title="Tab">Expected Outcome 1 Reports</a></li>
				<li><a href="<?php echo base_url(); ?>expected_outcome2_report" title="Tab">Expected Outcome 2 Reports</a></li>-->
				<li><a href="<?php echo base_url(); ?>specific_objective_report" title="Tab">Specific Objective Reports</a></li>
				<li><a href="<?php echo base_url(); ?>report-er1" title="Tab">Report Er1</a></li>
				<li><a href="<?php echo base_url(); ?>report-er2" title="Tab">Report Er2</a></li>
				<li><a href="<?php echo base_url(); ?>summary-report" title="Tab">Summary Report</a></li>
					<li><a href="<?php echo base_url(); ?>disaggregriate-summary-report" title="Tab">Disaggregriate Summary Report</a></li>
				
				<li><a href="<?php echo base_url(); ?>log-report" title="Tab">Upload Xlx Logs</a></li>			
								

				
				
				</ul>
				</li>

				</ul>
			</nav>
			
		<span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>

		</aside>
		<!-- END NAVIGATION -->
		
		<!-- ==========================CONTENT STARTS HERE ========================== -->
<!-- MAIN PANEL -->
<div id="main" role="main">
	<!-- RIBBON -->
	<div id="ribbon">

		<span class="ribbon-button-alignment"> 
			<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh" rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true"><i class="fa fa-refresh"></i></span> 
		</span>

		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<?php
				// foreach ($breadcrumbs as $display => $url) {
					// $breadcrumb = $url != "" ? '<a href="'.$url.'">'.$display.'</a>' : $display;
					// echo '<li>'.$breadcrumb.'</li>';
				// }
				// echo '<li>'.$page_title.'</li>';
			?>
		</ol>
		<!-- end breadcrumb -->

		<!-- You can also add more buttons to the
		ribbon for further usability

		Example below:

		<span class="ribbon-button-alignment pull-right">
		<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
		<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
		<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
		</span> -->

	</div>
	<!-- END RIBBON -->
