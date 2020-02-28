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
									  <th>ER1</th>  
											<th colspan="7">Indicator 1 No. of new or improved TVET trainings based on market demand</th>  
									  <th colspan="3">Until date:</th>  
									</tr>
									
										<tr>
									  <th  rowspan="2">Region</th>  
											<th colspan="5">Value Chain</th> 
											<th colspan="4">Year: <?php echo $selectedyear ?> ,  Quarter:<?php echo $selectedquarter ?></th>		
						
									</tr>
									
									
															<tr>
		 
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>

											
            <th>Quarter</th>
											<th>Comulative</th>
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
												$indicator1achiveper=9;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=7;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=6;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=5;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=6;
												}
												
			       if(	$selectedquarter!='All'){							
													  $whereBetweenQuarter=findquaretrBetweenFormat('tvettrain.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('tvettrain.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(tvettrain.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
										
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(distinct tvettrain.training_name) as mcount FROM  valuechain_master as vm left join `xls_import_tvet_training` as tvettrain on tvettrain.`valuechain`=vm.name  where (tvettrain.training_type='Improved' or tvettrain.training_type='New') and tvettrain.`region` like '%$regionName%' $whereQuarter group by vm.name) as TT  ON TT.name=MVM.NAME  where MVM.name in ('Agri-Business','Construction','Leather','Metal Works','Textile') order by MVM.name asc";


 //echo $valuechainSql;
// die;
	$indicator1_valuechain= $this->Allfunction->runQueryGet($valuechainSql);
	
			
						
									?>
									<tr>
									

		 			     <th><?php echo $consortiumId.'-'.$regionName; ?></th>
											
																				<?php
			
			//$totalvalue_indicator1=$totalvalue_indicator1;
		foreach($indicator1_valuechain as $ValuechainData){			
			$totalvalue_indicator1=$totalvalue_indicator1+$ValuechainData['tcount'];
		?>
			<td><?php echo $ValuechainData['tcount']; ?></td>
		<?php 
		}
		
		
		
		$valuechainQuarterSql="SELECT count(distinct tvettrain.training_name) as mcount FROM  valuechain_master as vm left join `xls_import_tvet_training` as tvettrain on tvettrain.`valuechain`=vm.name  where (tvettrain.training_type='Improved' or tvettrain.training_type='New') and tvettrain.`region` like '%$regionName%' $whereBetweenQuarter";


 //echo $valuechainQuarterSql;
// die;
	$indicator1Qyuarter_valuechain= $this->Allfunction->runQueryGet($valuechainQuarterSql);

	?>
									
	           <td><?php echo $indicator1Qyuarter_valuechain[0]['mcount']; ?></td>
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
												
					
					<!-- End  indicator1 -->
					
					<div class="clearfix"></div>
				    	<hr class="mt0">			


<!-- Indicator2 -->

												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th  colspan="2">ER1</th>  
											<th colspan="12">Indicator 2  No. of trainees who complete the SINCE supported TVETs trainings and who receive a certificate </th>  
									  <th>Until date:</th>  
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
											<th>Comulative</th>
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
												$indicator1achiveper=1500;
												}
												
															if(	$selectedquarter!='All'){
															$whereQuarter=findquaretrFormat('benetrain.end_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(benetrain.end_date)<='$selectedyear'";
										}
												
					$maincolumn='(count(distinct benetrain.beneficiary_id))';
												
												 				/* For Age OverAll */
				$sex='Male';   
				$indicatorSex_male="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				

				
				
				$sex='Female';
				$indicatorSex_female="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				 $indicator1_sex_sql="select ".$indicatorSex_male." as male,".$indicatorSex_female." as female FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' group by benetrain.`Region`";

				
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
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,$maincolumn as mcount FROM  valuechain_master as vm left join `xls_import_beneficiaries` as bene on bene.`value_chain`=vm.name left join `xls_import_beneficiary_trainings` as benetrain on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' $whereQuarter group by vm.name) as TT  ON TT.name=MVM.NAME  where MVM.name in ('Agri-Business','Construction','Leather','Metal Works','Textile') order by MVM.name asc";


 // echo $valuechainSql;
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
				$indicator1_youth="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
			  $wherecolumn='Refugees';		
					
				$indicator1_women="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
				 $wherecolumn='Returnee';				
				$indicator1_returnee="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				 $indicator1_targetgrp_sql="select ".$indicator1_youth." as A,".$indicator1_women." as B,".$indicator1_returnee." as C  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' group by benetrain.`Region`";
					
			//		echo $indicator1_targetgrp_sql;

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
				
				
							
		if(	$selectedquarter!='All'){
			 $whereBetweenQuarter=findquaretrBetweenFormat('benetrain.end_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('benetrain.end_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(benetrain.end_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
												
					$maincolumn='(count(distinct benetrain.beneficiary_id))';
												
												 				/* For Quarter OverAll */

				$indicator2Er1QuarterSql="SELECT $maincolumn as mcount  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and (benetrain.Certificate='COC Certified' or benetrain.Certificate='Certificate of Completion') and benetrain.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%'  $whereBetweenQuarter";
				
				
				// echo $indicator2Er1QuarterSql;

					$indicator2_Quarter= $this->Allfunction->runQueryGet($indicator2Er1QuarterSql);		
									?>
									
									
											
										
											<td><?php echo $A; ?></td>
											<td><?php echo $B; ?></td>
											<td><?php echo $C; ?></td>
												<td><?php echo $indicator2_Quarter[0]['mcount']; ?></td>
											<td><?php echo $maleValue+$femaleValue; ?></td>
											<td><?php echo $indicator1achiveper; ?></td>
											<td><?php echo findpercent($maleValue+$femaleValue,$indicator1achiveper); ?></td>
									
											
						
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
									  <th colspan="2">ER1</th>  
											<th>Indicator 3:  No. of job creation oriented PPPs supported and created by SINCE actions</th>  
									  <th>Until date:</th>  
									</tr>
									
										<tr>
									  <th rowspan="2">Region</th>  
											<th style="text-align:right" colspan="3">Year: <?php echo $selectedyear ?> ,  Quarter:<?php echo $selectedquarter ?></th>		
						
									</tr>
									
									
															<tr>
		 		      <th>Quarter</th>
  										<th>Comulative</th>
											<th>Target</th>
								
											
						
									</tr>
									
																<?php 

		
											foreach($sqlregions as $consortium) {
												$sex='Male';
												$totalvalue_indicator1=0;
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
													if($consortiumId=='Lot_1'){
												$indicator1achiveper=20;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=30;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=40;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=6;
												}
												
																if(	$selectedquarter!='All'){
																$whereBetweenQuarter=findquaretrBetweenFormat('Agr_Date',$selectedyear,$selectedquarter);  // Between Quarter

															$whereQuarter=findquaretrFormat('Agr_Date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(Agr_Date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
												

				
												
												$maincolumn='count(distinct Agr_Date)';
												
												 				/* For Age OverAll */
						
				 $indicator3_Sql="select $maincolumn as A from xls_import_pp where `Region` like '%$regionName%'  $whereQuarter  group by `Region`";

					
				$indicator3_Data= $this->Allfunction->runQueryGet($indicator3_Sql);
	$totalVal=$indicator3_Data[0]['A'];
	if($indicator3_Data[0]['A']=='' || $indicator3_Data[0]['A']==null){
		$totalVal=0;
	}
 //echo $valuechainSql;
// die;
	// $indicator1_valuechain= $this->Allfunction->runQueryGet($valuechainSql);
			
			
			
			
									
				 $indicator3Quarter_Sql="select $maincolumn as A from xls_import_pp where `Region` like '%$regionName%'  $whereBetweenQuarter";

					
				$indicator3Quarter_Data= $this->Allfunction->runQueryGet($indicator3Quarter_Sql);
	$totalQuarterVal=$indicator3Quarter_Data[0]['A'];
	if($indicator3Quarter_Data[0]['A']=='' || $indicator3Quarter_Data[0]['A']==null){
		$totalQuarterVal=0;
	}

						
									?>
									<tr>
									

		 			     <th><?php echo $consortiumId.'-'.$regionName; ?></th>							

										<td><?php echo $totalQuarterVal; ?></td>
											<td><?php echo $totalVal; ?></td>
											<td><?php echo $indicator1achiveper; ?></td>
	
											
						
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
									
			<!--   indicator 4 -->
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th colspan="2" >Specific Objective</th>  
											<th colspan="12">Indicator 4  No. of job placements facilitated through SINCE </th>  
									  <th >Until date:</th>  
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
											<th>Comulative</th>
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
												$indicator1achiveper=2100;
												}
																		if(	$selectedquarter!='All'){							
																$whereBetweenQuarter=findquaretrBetweenFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);
															
										}
										
										else{
											
											$whereQuarter="and Year(jp.EmploymentDate)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
							
										
										
													if($regionName=='Oromia'){
														
														$wherecolumnCust='cooperative training';
													}
													
													else{
														$wherecolumnCust='Apprenticeship';
													}
												 				/* For Age OverAll */
					$sex='Male';

				$indicatorSex_male="(SELECT count(distinct jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				$sex='Female';
				$indicatorSex_female="(SELECT count(distinct jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.sex='$sex' $whereQuarter)";
				
				
				 $indicator1_sex_sql="select ".$indicatorSex_male." as male,".$indicatorSex_female." as female FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%'    group by jp.`Region`";


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
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(jp.beneficiary_id) as mcount FROM  valuechain_master as vm left join `xls_import_beneficiaries` as bene on bene.`value_chain`=vm.name left join `xls_import_job_placement` as jp on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' $whereQuarter group by vm.name) aS TT  ON TT.name=MVM.NAME  where MVM.name in ('Agri-Business','Construction','Leather','Metal Works','Textile') order by MVM.name asc";


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
				$indicator1_youth="(SELECT count(distinct jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
			  $wherecolumn='Refugees';				
		   $indicator1_women="(SELECT count(distinct jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				
				 $wherecolumn='Returnee';				
		   $indicator1_returnee="(SELECT count(distinct jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' and bene.`target_group`='$wherecolumn' $whereQuarter)";
				
				 $indicator1_targetgrp_sql="select ".$indicator1_youth." as A,".$indicator1_women." as B,".$indicator1_returnee." as C  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' group by jp.`Region`";

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
				
			//	$totalvalue_indicator1=$totalvalue_indicator1+$A+$B+$C;
				
				

				$indicatorSQuarter_maleSql="SELECT count(distinct jp.`beneficiary_id`) as mcount  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='$wherecolumnCust' and jp.`Region` like '%$regionName%' and  bene.`region` like '%$regionName%' $whereBetweenQuarter";
				
				
					$indicatorSDataQuartere= $this->Allfunction->runQueryGet($indicatorSQuarter_maleSql);
				
									?>
									
									
											
										
											<td><?php echo $A; ?></td>
											<td><?php echo $B; ?></td>
											<td><?php echo $C; ?></td>
											<td><?php echo $indicatorSDataQuartere[0]['mcount']; ?></td>
											<td><?php echo ($maleValue+$femaleValue); ?></td>
											<td><?php echo $indicator1achiveper; ?></td>
											<td><?php echo findpercent($maleValue+$femaleValue,$indicator1achiveper); ?></td>
									
											
						
									</tr>
									
											<?php } ?>
									
									</thead>
									<tbody>
									
									</tbody>
									
									</table>
					
												</div>
												
					<!--  End indicator 4 -->
									
									
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
				
