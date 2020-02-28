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

.table-center th,.table-center td{
	text-align:center;
}
</style>
<?php

													//and jp.EmploymentDate BETWEEN '2018-01-01' and '2018-03-31'
	
														if(isset($_POST['yearname'])){
															
															$selectedyear=$_POST['yearname'];
															
														}
														
														else{
															
															$selectedyear=date("Y");
														}
														
													if(isset($_POST['quarter'])){															
															$selectedquarter=$_POST['quarter'];	
															
														}
														
														else{
															$selectedquarter='All';
														}
												
												
												if(	$selectedquarter!='All'){							
														  $whereBetweenQuarter=findquaretrBetweenFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);  //   All data before quarter
										}
										
										else{
											
											$whereQuarter="and Year(jp.EmploymentDate)<='$selectedyear'";
											 $whereBetweenQuarter=$whereQuarter;
										}
										
							
				
			
										
								//		echo $whereQuarter;
					
																	
 ?>

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
		
				   <div class="col-md-2">
				   	<label> Year  </label>
					       <div class="form-group">

												
												<div class="input-group date">
												<select name="yearname" class="form-control">
																	
												<?php 
													$selyear='';
												foreach($years as $yearsDat){
												
										 if(isset($_POST['yearname'])){

												if(trim($_POST['yearname'])==$yearsDat['name']){													
													$selyear='selected';
												}
												
												else{
														$selyear='';
												}
																
											}
											
											else{
												
												if($yearsDat['name']==date("Y")){													
												$selyear='selected';
												}
												
												else{
													$selyear='';
												}
												
											}
											
							//		echo $selyear;
											

											
													echo '<option value="'.$yearsDat['name'].'" '.$selyear.'>'.$yearsDat['name'].'</opion>';
												}
												?>
												</select>
												
												</div>

            </div>
					</div>
			



		   <div class="col-md-2">
					<label> Quarters  </label>
					       <div class="form-group">

												
												<div class="input-group date">
												<select name="quarter" class="form-control">
												<option value="All">All Quarters</option>
												
												<?php 
													$sel='';
												foreach($quarters as $Qdata){
										 if(isset($_POST['quarter'])){
												if($_POST['quarter']==$Qdata['id']){
													
													$sel='selected';
												}
												else{
													$sel='';
												}
												
											}
											

											
													echo '<option value="'.$Qdata['id'].'"  '.	$sel.'>'.$Qdata['name'].'</opion>';
												}
												?>
												</select>
												
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
	debugger;
	setTimeout(function(){ 	$(".autoclick").trigger("click"); }, 500);

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
					


   <!--Indicator 1 -->			
			
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>Specific Objective</th>  
											<th colspan="13">Indicator 1 No. of unemployed and/or inactive target beneficiaries  who are employed through job opportunities created by SINCE </th>  
									  <th colspan="2">Until date:</th>  
									</tr>
									
										<tr>
									  <th  rowspan="2">Region</th>  
		         <th colspan="2">Age</th> 
											<th colspan="5">Value Chain</th> 
											<th colspan="3">Target Group</th> 
											<th colspan="4">Year: <?php echo $selectedyear ?> ,  Quarter:<?php echo $selectedquarter ?></th>		
						
									</tr>
									
									
															<tr>
		 
											<th>M</th>  
											<th>F</th>  
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>

											<th>Youth(Potential Migrant)</th>
											<th>Refugees</th>
											<th>Returnee</th>
											<th>Quarter</th>
											<th>Cumulative </th>
											<th>Target</th>
											<th>%achievement</th>
									
											
						
									</tr>
									
																<?php 

		
											foreach($sqlregions as $consortium) {
												$sex='Male';
												$totalvalue_indicator1=0;
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
													if($consortiumId=='Lot_1'){
												$indicator1achiveper=1500;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=1500;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=1500;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=1200;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=2500;
												}
												
												 				/* For Age OverAll */
					$sex='Male';

				$indicatorSex_male="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				$sex='Female';
				$indicatorSex_female="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				 $indicator1_sex_sql="select ".$indicatorSex_male." as male,".$indicatorSex_female." as female FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%'    group by jp.`Region`";


 // echo $indicator1_sex_sql;
// die;
					
				$indicator1_sex= $this->Allfunction->runQueryGet($indicator1_sex_sql);
	$maleValue=$indicator1_sex[0]['male'];
		$femaleValue=$indicator1_sex[0]['female'];
		
		if($maleValue==''){
				$maleValue=0;
		}
		
				if($femaleValue==''){
		  		$femaleValue=0;
		   }
 
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(jp.beneficiary_id) as mcount FROM  valuechain_master as vm left join `xls_import_beneficiaries` as bene on bene.`value_chain`=vm.name left join `xls_import_job_placement` as jp on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' $whereQuarter group by vm.name) aS TT  ON TT.name=MVM.NAME order by MVM.name asc";


 //echo $valuechainSql;
// die;
	$indicator1_valuechain= $this->Allfunction->runQueryGet($valuechainSql);
	
			
						
									?>
									<tr>
									

		 			     <th><?php echo $consortiumId.'-'.$regionName; ?></th>
											<td><?php echo $maleValue; ?></td>  
											<td><?php echo $femaleValue; ?></td>  
											
																				<?php
			
			$totalvalue_indicator1=$totalvalue_indicator1+$maleValue+$femaleValue;
		foreach($indicator1_valuechain as $ValuechainData){
			
			$totalvalue_indicator1=$totalvalue_indicator1+$ValuechainData['tcount'];
		?>
			<td><?php echo $ValuechainData['tcount']; ?></td>
		<?php 
		}


												 				/* For Age OverAll */
				$wherecolumn='Youth (Potential Migrant)';
				$indicator1_youth="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
			  $wherecolumn='Refugees';				
		   $indicator1_women="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
				 $wherecolumn='Returnee';				
		   $indicator1_returnee="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				 $indicator1_targetgrp_sql="select ".$indicator1_youth." as A,".$indicator1_women." as B,".$indicator1_returnee." as C  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' group by jp.`Region`";

				$indicator1_targetgrp= $this->Allfunction->runQueryGet($indicator1_targetgrp_sql);										
										
				$A=number_format($indicator1_targetgrp[0]['A'],0);
				$B=number_format($indicator1_targetgrp[0]['B'],0);
				$C=number_format($indicator1_targetgrp[0]['C'],0);

				
				if($indicator1_targetgrp[0]['A']=='' && $indicator1_targetgrp[0]['A']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['B']=='' && $indicator1_targetgrp[0]['B']==null){
					$B=0;
				}
				
							if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$B=0;
				}
				
				$totalvalue_indicator1=$totalvalue_indicator1+$A+$B+$C;
				

								
			
		   $indicator1_QuarterSql="SELECT count(jp.`beneficiary_id`) as quarterwisecount  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' $whereBetweenQuarter";
				 //echo $indicator1_QuarterSql;

					$indicator1_Quarter= $this->Allfunction->runQueryGet($indicator1_QuarterSql);		


									?>
									
									
											
										
											<td><?php echo $A; ?></td>
											<td><?php echo $B; ?></td>
											<td><?php echo $C; ?></td>
											<td><?php echo $indicator1_Quarter[0]['quarterwisecount']; ?></td>											
											<td><?php echo $maleValue+$femaleValue; ?></td>
											<td><?php echo $indicator1achiveper; ?></td>
											<td><?php echo findpercent($totalvalue_indicator1,$indicator1achiveper); ?></td>
									
											
						
									</tr>
									
											<?php } ?>
									
									</thead>
									<tbody>
									
									</tbody>
									
									</table>
					
												</div>
												
					
					<!-- End  indicator1 -->
					
					<div class="clearfix"></div>
				    	<hr class="mt0">			


<!-- Indicator2 -->

												<div class="table-responsive table-center">
								    <table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>Specific Objective</th>  
											<th colspan="13">Indicator 2  No. of beneficiaries who are still employed three months after employment contract </th>  
									  <th colspan="2" >Until date:</th>  
									</tr>
									
										<tr>
									  <th  rowspan="2">Region</th>  
		         <th colspan="2">Age</th> 
											<th colspan="5">Value Chain</th> 
											<th colspan="3">Target Group</th> 
											<th colspan="4">Year: <?php echo $selectedyear ?> ,  Quarter:<?php echo $selectedquarter ?></th>		
						
									</tr>
									
									
															<tr>
		 
											<th>M</th>  
											<th>F</th>  
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>

											<th>Youth(Potential Migrant)</th>
											<th>Refugees</th>
											<th>Returnee</th>
											<th>Quarter</th>
											<th>Cumulative </th>
											<th>Target</th>
											<th>%achievement</th>
									
											
						
									</tr>
									
																<?php 

		
											foreach($sqlregions as $consortium) {
												$sex='Male';
												$totalvalue_indicator1=0;
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
													  if($consortiumId=='Lot_1'){
												$indicator1achiveper=1200;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=1125;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=1200;
												}												
												   if($consortiumId=='Lot_4'){
												$indicator1achiveper=1000;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=2125;
												}
												
												 				/* For Age OverAll */
					$sex='Male';
					
					$fromDate=date("$selectedyear-m-d");
					$toDate = date('Y-m-d', strtotime("+3 months", strtotime($fromDate)));

				//	$toDate=date("$selectedyear-m-31");
					
					//$after3months="and jp.EmploymentDate between '$fromDate' and '$toDate' ";
					
							$after3months=" and (SELECT count(jp1.`beneficiary_id`)  FROM `xls_import_job_placement` as jp1 inner join xls_import_beneficiaries as bene1 on bene1.beneficiary_id=jp1.beneficiary_id where jp1.placement_type='Employment' and jp1.`Region` like '%$regionName%' and jp1.`beneficiary_id`=jp.`beneficiary_id` and Month(jp1.`EmploymentDate`)>=Month(DATE_ADD(jp.`EmploymentDate`, INTERVAL 3 MONTH) )) > 0 ";
							

				$indicatorSex_male="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $whereQuarter $after3months )";
				
			
				$sex='Female';
				$indicatorSex_female="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $after3months $whereQuarter $after3months )";
				
				
				 $indicator1_sex_sql="select ".$indicatorSex_male." as male,".$indicatorSex_female." as female FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%'    group by jp.`Region`";


			// echo $indicator1_sex_sql;
			// die;
					
				$indicator1_sex= $this->Allfunction->runQueryGet($indicator1_sex_sql);
	$maleValue=$indicator1_sex[0]['male'];
		$femaleValue=$indicator1_sex[0]['female'];
		
		if($maleValue==''){
				$maleValue=0;
		}
		
				if($femaleValue==''){
		  		$femaleValue=0;
		   }
 
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(jp.beneficiary_id) as mcount FROM  valuechain_master as vm left join `xls_import_beneficiaries` as bene on bene.`value_chain`=vm.name left join `xls_import_job_placement` as jp on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' $after3months $whereQuarter $after3months  group by vm.name) aS TT  ON TT.name=MVM.NAME order by MVM.name asc";


 //echo $valuechainSql;
// die;
	$indicator1_valuechain= $this->Allfunction->runQueryGet($valuechainSql);
	
			
						
									?>
									<tr>
									

		 			     <th><?php echo $consortiumId.'-'.$regionName; ?></th>
											<td><?php echo $maleValue; ?></td>  
											<td><?php echo $femaleValue; ?></td>  
											
																				<?php
			
			$totalvalue_indicator1=$totalvalue_indicator1+$maleValue+$femaleValue;
		foreach($indicator1_valuechain as $ValuechainData){
			
			$totalvalue_indicator1=$totalvalue_indicator1+$ValuechainData['tcount'];
		?>
			<td><?php echo $ValuechainData['tcount']; ?></td>
		<?php 
		}


												 				/* For Age OverAll */
				$wherecolumn='Youth (Potential Migrant)';
				$indicator1_youth="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn'  $after3months $whereQuarter $after3months )";
				
				
			  $wherecolumn='Refugees';				
		   $indicator1_women="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $after3months $whereQuarter $after3months )";
				
				
				 $wherecolumn='Returnee';				
		   $indicator1_returnee="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn'  $after3months $whereQuarter $after3months )";
				
				 $indicator1_targetgrp_sql="select ".$indicator1_youth." as A,".$indicator1_women." as B,".$indicator1_returnee." as C  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' group by jp.`Region`";

				$indicator1_targetgrp= $this->Allfunction->runQueryGet($indicator1_targetgrp_sql);										
										
				$A=number_format($indicator1_targetgrp[0]['A'],0);
				$B=number_format($indicator1_targetgrp[0]['B'],0);
				$C=number_format($indicator1_targetgrp[0]['C'],0);

				
				if($indicator1_targetgrp[0]['A']=='' && $indicator1_targetgrp[0]['A']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['B']=='' && $indicator1_targetgrp[0]['B']==null){
					$B=0;
				}
				
							if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$B=0;
				}
				
				$totalvalue_indicator1=$totalvalue_indicator1+$A+$B+$C;
									?>
									
									
											
										
											<td><?php echo $A; ?></td>
											<td><?php echo $B; ?></td>
											<td><?php echo $C; ?></td>
											<td><?php echo $totalvalue_indicator1; ?></td>
											<td><?php echo $totalvalue_indicator1; ?></td>
											<td><?php echo $indicator1achiveper; ?></td>
											<td><?php echo findpercent($totalvalue_indicator1,$indicator1achiveper); ?></td>
									
											
						
									</tr>
									
											<?php } ?>
									
									</thead>
									<tbody>
									
									</tbody>
									
									</table>
					
												</div>
												
				
						<!-- end indicator 2 -->
						
						
											
					<div class="clearfix"></div>
				    	<hr class="mt0">			

						   <!--Indicator 3 -->			
			
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>Specific Objective</th>  
											<th colspan="12">Indicator 3: increase of average income among target beneficiaries</th>  
									  <th colspan="2">Until date:</th>  
									</tr>
									
										<tr>
									  <th  rowspan="2">Region</th>  
		         <th colspan="2">Age</th> 
											<th colspan="5">Value Chain</th> 
											<th colspan="3">Target Group</th> 
											<th colspan="4">Year: <?php echo $selectedyear ?> ,  Quarter:<?php echo $selectedquarter ?></th>		
						
									</tr>
									
									
															<tr>
		 
											<th>M</th>  
											<th>F</th>  
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>

											<th>Youth(Potential Migrant)</th>
											<th>Refugees</th>
											<th>Returnee</th>
											<th>Cumulative</th>
											<th>Target</th>
											<th colspan="2">%achievement</th>
									
											
						
									</tr>
									
																<?php 

		
											foreach($sqlregions as $consortium) {
												$sex='Male';
												$totalvalue_indicator1=0;
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
													if($consortiumId=='Lot_1'){
												$indicator1achiveper=48;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=30;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=35;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=35;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=30;
												}
												
												$maincolumn='((AVG(bene.endline_income)-AVG(entry_point_income)) / AVG(entry_point_income))';
												
												 				/* For Age OverAll */
					$sex='Male';
 $whereQuarter='';
				$indicatorSex_male="(SELECT $maincolumn  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				$sex='Female';
				$indicatorSex_female="(SELECT $maincolumn  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				 $indicator1_sex_sql="select ".$indicatorSex_male." as male,".$indicatorSex_female." as female FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%'    group by jp.`Region`";


 //echo $indicator1_sex_sql;
// die;
					
				$indicator1_sex= $this->Allfunction->runQueryGet($indicator1_sex_sql);
	$maleValue=$indicator1_sex[0]['male'];
		$femaleValue=$indicator1_sex[0]['female'];
		
		if($maleValue==''){
				$maleValue=0;
		}
		
				if($femaleValue==''){
		  		$femaleValue=0;
		   }
 
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(jp.beneficiary_id) as mcount FROM  valuechain_master as vm left join `xls_import_beneficiaries` as bene on bene.`value_chain`=vm.name left join `xls_import_job_placement` as jp on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' $whereQuarter group by vm.name) aS TT  ON TT.name=MVM.NAME order by MVM.name asc";


 //echo $valuechainSql;
// die;
	$indicator1_valuechain= $this->Allfunction->runQueryGet($valuechainSql);
	
			
						
									?>
									<tr>
									

		 			     <th><?php echo $consortiumId.'-'.$regionName; ?></th>
											<td><?php echo $maleValue; ?></td>  
											<td><?php echo $femaleValue; ?></td>  
											
																				<?php
			
			$totalvalue_indicator1=$totalvalue_indicator1+$maleValue+$femaleValue;
		foreach($indicator1_valuechain as $ValuechainData){
			
			$totalvalue_indicator1=$totalvalue_indicator1+$ValuechainData['tcount'];
		?>
			<td><?php echo $ValuechainData['tcount']; ?></td>
		<?php 
		}


												 				/* For Age OverAll */
				$wherecolumn='Youth (Potential Migrant)';
				$indicator1_youth="(SELECT $maincolumn  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
			  $wherecolumn='Refugees';				
		   $indicator1_women="(SELECT $maincolumn  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
				 $wherecolumn='Returnee';				
		   $indicator1_returnee="(SELECT $maincolumn  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				 $indicator1_targetgrp_sql="select ".$indicator1_youth." as A,".$indicator1_women." as B,".$indicator1_returnee." as C  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' and jp.`Region` like '%$regionName%' group by jp.`Region`";

				$indicator1_targetgrp= $this->Allfunction->runQueryGet($indicator1_targetgrp_sql);										
										
				$A=number_format($indicator1_targetgrp[0]['A'],0);
				$B=number_format($indicator1_targetgrp[0]['B'],0);
				$C=number_format($indicator1_targetgrp[0]['C'],0);

				
				if($indicator1_targetgrp[0]['A']=='' && $indicator1_targetgrp[0]['A']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['B']=='' && $indicator1_targetgrp[0]['B']==null){
					$B=0;
				}
				
							if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$A=0;
				}
				if($indicator1_targetgrp[0]['C']=='' && $indicator1_targetgrp[0]['C']==null){
					$B=0;
				}
				
				$totalvalue_indicator1=$totalvalue_indicator1+$A+$B+$C;
									?>
									
									
											
										
											<td><?php echo $A; ?></td>
											<td><?php echo $B; ?></td>
											<td><?php echo $C; ?></td>
											<td><?php echo $totalvalue_indicator1; ?></td>
											<td><?php echo $indicator1achiveper; ?>%</td>
											<td><?php echo findpercent($totalvalue_indicator1,$indicator1achiveper); ?></td>
									
											
						
									</tr>
									
											<?php } ?>
									
									</thead>
									<tbody>
									
									</tbody>
									
									</table>
					
												</div>
												
					
					<!-- End  indicator 3 -->
					
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
				
