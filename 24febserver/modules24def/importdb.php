<div id="content">


<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-database"></i> 
			<?php echo $title; ?>

		</h1>
	</div>
	
</div>



<!-- widget grid -->
<section id="widget-grid" class="">


	<!-- START ROW -->

	<div class="row">

		<!-- NEW COL START -->
		
		<!-- END COL -->

		<!-- NEW COL START -->
		<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false" role="widget">
			
				<!-- widget div-->
				<div role="content">
					
		
					<!-- widget content -->
					<div class="widget-body no-padding">
					<?php  
					
if($this->session->flashdata('notify')!="" || $this->session->flashdata('notify')!=null){	
	echo $this->session->flashdata('notify');
}

if($this->session->flashdata('errUpload')!="" || $this->session->flashdata('errUpload')!=null){	

$msgs=explode(',',$this->session->flashdata(errUpload));
for($jk=0; $jk<count($msgs); $jk++){
?>
						<div class="alert alert-danger fade in">
								<button class="close" data-dismiss="alert">×</button>
								<i class="fa-fw fa fa-times"></i>
								<strong>Error!</strong> <?php echo $msgs[$jk];?>
							</div>

<?php 

}


}
					?>
						
						<form enctype="multipart/form-data" id="smart-form-register" action="<?php echo base_url();?>upload-csv" method="post" class="smart-form" >
							<header>
							Please Select File To <?php echo $title; ?>
							</header>

							<fieldset>
								<section>
								<div class="col-md-3 ">
									<select name="table_name" class="form-control mb15" required>
									<option value="">--- Select Csv Type ---</option>
									<option value="import_beneficiaries">Beneficiary</option>
									<option value="import_job_placement">Job Placement</option>
									<option value="import_beneficiary_trainings">Beneficiary Trainings</option>
									<option value="import_smecompanies">SME Companies</option>
									<option value="import_tvet">TVET</option>
										
									</select>
							</div>
										
								<div class="col-md-3 ml12 ml0">
									<label class="input"> <i class="icon-append fa fa-file-excel-o"></i>
										<input type="file" name="uploadcsv" placeholder="importcsv" class="mb15" accept=".csv" required>
										<b class="tooltip tooltip-bottom-right">please select the csv file</b> </label>
										</div>
										<div class="col-md-3 ml12 ml0 ">
											<button name="csvsubmit" type="submit" class="btn btn-primary btnsumit">
									Submit
								</button>
										</div>
								</section>												
								</div>	
							</fieldset>

						</form>						
						
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->
			
			<!-- Widget ID (each widget will need unique ID)-->
			
			
				
			
			
			
			<!-- end widget -->								


		</article>
		<!-- END COL -->		

	</div>

	<!-- END ROW -->

</section>
<!-- end widget grid -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title">
					<img src="img/logo.png" width="150" alt="SmartAdmin">
				</h4>
			</div>
			<div class="modal-body no-padding">

				<form id="login-form" class="smart-form" novalidate="novalidate">

							<fieldset>
								<section>
									<div class="row">
										<label class="label col col-2">Username</label>
										<div class="col col-10">
											<label class="input"> <i class="icon-append fa fa-user"></i>
												<input type="email" name="email">
											</label>
										</div>
									</div>
								</section>

								<section>
									<div class="row">
										<label class="label col col-2">Password</label>
										<div class="col col-10">
											<label class="input"> <i class="icon-append fa fa-lock"></i>
												<input type="password" name="password">
											</label>
											<div class="note">
												<a href="javascript:void(0)">Forgot password?</a>
											</div>
										</div>
									</div>
								</section>

								<section>
									<div class="row">
										<div class="col col-2"></div>
										<div class="col col-10">
											<label class="checkbox">
												<input type="checkbox" name="remember" checked="">
												<i></i>Keep me logged in</label>
										</div>
									</div>
								</section>
							</fieldset>
							
							<footer>
								<button type="submit" class="btn btn-primary">
									Sign in
								</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">
									Cancel
								</button>

							</footer>
						</form>						
						

			</div>

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


			</div>