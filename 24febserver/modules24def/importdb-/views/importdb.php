<style>
.customdiv{
	    float: left;
    width: 100%;
    position: relative;
    font-size: 13px;
    -moz-border-radius: 0;
    -khtml-border-radius: 0;
    -webkit-border-radius: 0;
    border-radius: 0;
    margin: 0;
    border-width: 1px 1px 2px;
    border-style: solid;
    border-top: none;
    border-right-color: #CCC!important;
    border-bottom-color: #CCC!important;
    border-left-color: #CCC!important;
    padding: 13px 13px 0;
    overflow: visible;
}
</style>

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
					
						<form enctype="multipart/form-data" id="smart-form-register" action="<?php echo base_url();?>upload-xls" method="post" class="smart-form" >
							<header>
							Please Select File To <?php echo $title; ?>
							</header>

							<fieldset>
								<section>
								<div class="col-md-3 ml12 ml0">
									<label class="input"> <i class="icon-append fa fa-file-excel-o"></i>
										<input type="file" name="uploadcsv" placeholder="importcsv" class="mb15" accept=".csv,.xls" required>
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
				
				
					<?php
				
		//	unset($_SESSION['summary']);

if($this->session->flashdata('notify')!="" || $this->session->flashdata('notify')!=null){	
	echo $this->session->flashdata('notify');
	

 if(isset($_SESSION['summary'])){
//  print_r($_SESSION['summary']);
	// die;
?>

<table class="table table-responsive table-bordered">
	<thead>
		<tr>
			<td>Table Name</td>
			<td>Uploaded Records</td>
			<td>Total Records</td>
			<td>Date</td>
		</tr>
	</thead>
	<tbody>
	<?php foreach($_SESSION['summary'] as $array){ ?>
		<tr>
			<td><?php echo $array['table_name'] ?></td>
			<td><?php echo $array['uploaded_rec'] ?></td>
			<td><?php echo $array['total_records'] ?></td>
			<td><?php echo date("d-m-Y", strtotime($array['date'])) ?></td>
		</tr>
	<?php } ?>
	</tbody>
	
</table>
<?php

unset($_SESSION['summary']);

 }

}

// if($this->session->flashdata('errUpload')!="" || $this->session->flashdata('errUpload')!=null){	




// $msgs=explode(',',$this->session->flashdata(errUpload));
// for($jk=0; $jk<count($msgs); $jk++){
?>
					<!--	<div class="alert alert-danger fade in">
								<button class="close" data-dismiss="alert">×</button>
								<i class="fa-fw fa fa-times"></i>
								<strong>Error!</strong> <?php //echo $msgs[$jk];?>
							</div> -->

<?php 

// }


// }


					?>
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

