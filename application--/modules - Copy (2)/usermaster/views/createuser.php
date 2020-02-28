
<div id="content">
  <div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-user"></i> 
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
					
if($this->session->flashdata('msg')!="" || $this->session->flashdata('msg')!=null){	
	echo $this->session->flashdata('msg');
}

?>
			
						
						<form enctype="multipart/form-data" id="create-user" action="<?php echo base_url();?>insert-user" method="post" class="custom-form" >
						
							<header>
							Please Fill the Form to <?php echo $title; ?>
							</header>

					
								<section>			
								
								<div class="row col-md-12 form-group">
									
									<div title="First Name" class="col-md-3">
															<input  autocomplete="off" type="text" name="firstname" class="form-control" placeholder="Enter First Name" required>
										</div>
										
														<div title="Last Name" autocomplete="off" class="col-md-3">
															<input type="text" name="lastname" class="form-control" placeholder="Enter Last Name" required>
										</div>
										
												<div title="Gender" class="col-md-3 hidden">
												<select  name="gender" class="form-control" required>
												<option value="">--- Select Gender ---</option>
												<option selected value="male">Male</option>
												<option value="female">Female</option>
												</select>
										</div>
										
										
												<div title="Email" autocomplete="off" class="col-md-3">
															<input  type="text" name="email" class="form-control" placeholder="Enter Email" required>
										</div>
										
										
							
							</div>
							
							<div class="row col-md-12 form-group">
									
									<div title="Mobile No." class="col-md-3">
										<input type="text" name="mobileNo" maxlength="10" class="form-control number" placeholder="Enter MobileNo" required>
										</div>
										
											
			      	<div  title="Role" class="col-md-3">
												<select name="role" class="form-control" required>
												<option value="">--- Select Role ---</option>
											<?php
											foreach($roles as $rdata){
												echo '<option value="'.$rdata['urole'].'">'.$rdata['name'].'</option>';
											}
											?>
												</select>
										</div>
										
										<div title="Password"  class="col-md-3">
						  				<input  type="text" name="password" id="password" class="form-control form-group" placeholder="Enter password" required>
															 
										</div>
									
										<div class="col-md-3">
						  		
															  <input type="button" class="btn btn-primary" value="Generate" onClick="generate();" >
										</div>
										
								</div>
							
										
										
								</div>
										
				<div class="row col-md-12 form-group">
										<div class="col-md-3 pl0">
											<button name="csvsubmit" type="submit" class="btn btn-primary btnsumit">
									Create User
								</button>
										</div>
										
					</div>
								</section>												
								</div>	
	

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


			</div>
			
			
			
			<script>
			function randomPassword(length) {
    var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&*()-+<>ABCDEFGHIJKLMNOP1234567890";
    var pass = "";
    for (var x = 0; x < length; x++) {
        var i = Math.floor(Math.random() * chars.length);
        pass += chars.charAt(i);
    }
    return pass;
}

function generate() {
	var genval=randomPassword(10);
$('#password').val(genval);

}
			</script>