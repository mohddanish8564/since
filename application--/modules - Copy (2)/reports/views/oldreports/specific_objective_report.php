<style>
@page  
{ 
    size: auto;   /* auto is the initial value */ 

    /* this affects the margin in the printer settings */ 
    margin: 7mm 7mm 7mm 7mm;  
} 
@media print{
	.indcatortit{
   	text-align: center;
    background: #eff7f7;
}
thead {display: table-header-group;}
tfoot {display: table-header-group;}
	body
{ 
font-size:80%;
 -webkit-print-color-adjust: exact; 
  margin: 0.5mm 0.1mm 0.1mm 0.1mm;
}
	#header,#left-panel,.page-footer,.hidePrint,#shortcut,button,.demo,form{
		display:none !important;
	}

	table{
		    width: 100% !important;
    padding: 0px !important;
	}
	tr, th, td {
    border:0.5px solid !important;
    padding: 9px !important;
}

	
}
</style>


<div id="content">


<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa fa-lg fa-fw fa-file-excel-o"></i> 
			<?php echo $title; ?>

		</h1>
	</div>
	
</div>

<!-- Calender -->
<div class="row">
		<form action="" method="post">
		   <div class="col-md-3">
					<label> Entry To Since Date  </label>
					       <div class="form-group">
												<?php 
												if(isset($_POST['monthfil'])){
												
											 $monthfill=str_replace(' ', '',$_POST['monthfil']);
												$datexp=explode(' ',str_replace('-', ' ', $monthfill));
										
										   // print_r($datexp);
										
										
												 $startdate=$datexp[0];
											  $fromdate=$datexp[1];
													
													//	print_r($fromdate);
													$startdate = strtr($startdate, '/', '-');
													$fromdate= strtr($fromdate, '/', '-');

												 $startdateDB=date("Y-m-d",strtotime($startdate));
													$todateDB=date("Y-m-d",strtotime($fromdate));
																								
													
													
												}
												else{
											      	$startdate=date("01/m/Y");
										     		$lastday = date('t',strtotime($startdate));
											       $fromdate=date("$lastday/m/Y");
																	
																	$startdateDB=date("Y-m-d",strtotime($startdate));
															 	$todateDB=date("Y-m-$lastday");
																	
																	
												}
												?>
                <div class="input-group date" id="datetimepicker2">

									
									<input type="text" name="monthfil" class="form-control" value="<?php echo $startdate.' - '.$fromdate;?>" />

                  <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
            </div>
					</div>
					<div class="col-md-3">
						<label> Lots  </label>
						<select class="form-control" name="consortium">
							<option value='all'>All</option>
							<?php foreach ($consortiums as $key) {
								
								if($key['lots_id']==$_POST['consortium']){
									$selected='selected';
								}
								else{
									$selected='';
								}
								
								echo "<option $selected value='".$key['lots_id']."'>".$key['lots_name']."</option>";
							} ?>
						</select>
					</div>

<script>
$(function() {
  $('input[name="monthfil"]').daterangepicker({
	  locale:{
format:'DD/MM/YYYY'
}
  });
});
</script>
				<div class="col-md-3">
						<label style="visibility:hidden"> Entry Point Date  </label>
          <div class="form-group">
										 <input type="submit" class="form-control" name="submit"> 
										</div>	  
			</div>			</form>		
		</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.es.min.js"></script>

<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

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
				<div role="content printdiv">
					
					<button  class="btn-sm btn-primary print-btn" onclick="window.print();">Print</button>
					<div class="clearfix"></div>
					<!-- widget content -->
					

					<div class="widget-body no-padding mb20 printdiv">
					

		
									<!--Indicator1 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Indicator 1 :  No. of unemployed and/or inactive target beneficiaries  who are employed through job opportunities created by SINCE</th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								    <th  style="text-align: center;">Vaue Chain </th>
											<th colspan="5" style="text-align: center;">Target Group </th>
											<th style="text-align: center;">Total</th>
								        </tr>
								        <tr>
								          <th></th>
													<th>Women 15 - 35</th>
													<th>Youth</th>
													<th>Returnee</th>
													<th>Eritrean Refugee</th>
												
								      <th>Women beyond 36</th>
													<th></th>
							
												</tr>
								    </thead>
								    <tbody>
								    	<?php
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;
								
											
											// SELECT irregular_migration FROM xls_import_oo_indicators12 WHERE `data_entry_point` = "Endline" and  `age_group` ="15-19" and  `sex`="Male" and `Consortium` = "Lot1"
											$Alltotal=0;
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
												$targetGrp='Women 15 - 35 (Potential Migrant)';
												$EmpType='Employment';
												$LotId=$consortiumId;			
											// $sql_wome15_16="call specifictargetgrp('$targetGrp', '$EmpType', '$LotId');";											
		$indicator1_wome15_16="(SELECT COUNT(job.`beneficiary_id`) FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = '$EmpType' AND job.`consortium` like '%$LotId%' and  bene.value_chain=t2.value_chain)";
									
	$targetGrp='Youth (Potential Migrant)';
	$indicator1_Youth="(SELECT COUNT(job.`beneficiary_id`) FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = '$EmpType' AND job.`consortium` like '%$LotId%' and  bene.value_chain=t2.value_chain)";	

 $targetGrp='Returnee';
	$indicator1_Returnee="(SELECT COUNT(job.`beneficiary_id`) FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = '$EmpType' AND job.`consortium` like '%$LotId%' and  bene.value_chain=t2.value_chain)";			

	$targetGrp='Eritrean Refugee';
	$indicator1_Eritrean="(SELECT COUNT(job.`beneficiary_id`)  FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = '$EmpType' AND job.`consortium` like '%$LotId%' and  bene.value_chain=t2.value_chain)";	

	$targetGrp='Women beyond 36';
	$indicator1_womebeyond36="(SELECT COUNT(job.`beneficiary_id`) FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = '$EmpType' AND job.`consortium` like '%$LotId%' and  bene.value_chain=t2.value_chain)";		
	
		
		
		$sql_indicator1="select distinct $indicator1_wome15_16 as A,$indicator1_Youth as B,$indicator1_Returnee as C,$indicator1_Eritrean as D,$indicator1_womebeyond36 as E from xls_import_beneficiaries as t2 where `consortium` like '%$LotId%'  group by t2.value_chain";
	 echo $sql_indicator1;
		$indicator1res= $this->Allfunction->runQueryGet($sql_indicator1);
		
		
    if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B=0;
				}
				if($indicator1_male[0]['C']=='' && $indicator1_male[0]['C']==null){
					$C=0;
				}
				if($indicator1_male[0]['D']=='' && $indicator1_male[0]['D']==null){
					$D=0;
				}
				if($indicator1_male[0]['E']=='' && $indicator1_male[0]['E']==null){
					$E=0;
				}

								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
								
				
												
?>	            <td><?php echo $B; ?></td>
												 		<td><?php echo $A; ?></td>
								    			<td><?php echo $Be; ?></td>
								    			<td><?php echo $C; ?></td>
								    			<td><?php echo $D; ?></td>
								    
												 
				<?php

?>
												 		<td><?php echo $E; ?></td>
								    		
								    			<td><?php echo $C_female; ?></td>

				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

								

   <!-- end Indicator 1 -->			
			
							<div class="clearfix"></div>
				    	<hr class="mt0">								
									
						
												
												
							<div class="clearfix"></div>
				    	<hr class="mt0">								
							
												
												
																			<div class="clearfix"></div>
				    	<hr class="mt0">								
									
						
																	<div class="clearfix"></div>
				    	       <hr class="mt0">		
												
												
									
									
					</div>
  
					
				<!-- end widget content -->
					
						
					
					
								<!-- widget content -->
					

					
					<!--Indicator2 -->
					<div class="widget-body no-padding mb20">
						
						
					</div>
     <!-- end Indicator 1 -->			
					
				<!-- end widget content -->
				
				
				</div>
				
				<script>
				 function printDiv(divID) {
        //Get the HTML of div
        var divElements = document.getElementById(divID).innerHTML;
        //Get the HTML of whole page
        var oldPage = document.body.innerHTML;
        //Reset the page's HTML with div's HTML only
        document.body.innerHTML = 
          "<html><head><title></title></head><body>" + 
          divElements + "</body>";
        //Print Page
        window.print();
        //Restore orignal HTML
        document.body.innerHTML = oldPage;

    }
				</script>
				
