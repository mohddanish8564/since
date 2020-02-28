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
					<!--Indicator2 -->
					<div class="widget-body mb20">
						
						
				<table class="table table-bordered">				
				 <thead>
					
					<tr>
					<td colspan="5">SINCE PROGRAMME AGGREGATE DATA - March 31st 2019</td>
										<td colspan="13">Total Achieved (From start to March 31st 2019)</td>
					</tr>
			 	 <tr>
						<th>Level of LF</th>
						<th>Invervention Logic</th>
						<th>Objectively Verifiable Indicators</th>
						<th>Baseline Value</th>
						<th>Target Value</th>
						<th>Total Value ach.</th>
						<th>% of Achievement</th>						
						<th>quarter value</th>				
					</tr>
								
				</thead>
					<tbody>
					  
										<!--  row1-->
							<tr>
							<?php 		
							
							$A=0;
							$B=0;

							$BeforeQuarter_speficInd1="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' $whereQuarter)";
			
						$BtwQuarter_speficInd1="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment' $whereBetweenQuarter)";
						
						$specificobhejctiveSqlnd1="select $BeforeQuarter_speficInd1 as A ,$BtwQuarter_speficInd1 as B from xls_import_job_placement as jp1 where jp1.placement_type='Employment' group by jp1.placement_type";
						
						$BeforeQuarter_SpecObjInd1= $this->Allfunction->runQueryGet($specificobhejctiveSqlnd1);
						
						if($BeforeQuarter_SpecObjInd1[0]['A']>0 || $BeforeQuarter_SpecObjInd1[0]['A']!=''){
							$A=$BeforeQuarter_SpecObjInd1[0]['A'];
						}
						
								if($BeforeQuarter_SpecObjInd1[0]['B']>0 || $BeforeQuarter_SpecObjInd1[0]['B']!=''){
							$B=$BeforeQuarter_SpecObjInd1[0]['B'];
						}
			
			
			?>
							 <td rowspan="2">Specific Objective</td>
								<td rowspan="2">To establish inclusive economic programs that create employment opportunities for potential migrants, returnees and refugees, especially women and youths, in the most migration prone regions of Ethiopia (Addis Ababa, Amhara, Oromia, SNNPR and Tigray) by strengthening the capacities of local vocational training providers (TVET) and promoting public private partnerships (PPPs) in strategic economic clusters.</td>
								<td>No. of unemployed and/or inactive target beneficiaries  who are employed through job opportunities created by SINCE (disaggregated by region, value chain, target group, ER, sex & age)</td>
								<td>0</td>
								<td>8200</td>
								<td><?php echo $A ?></td>
								<td><?php echo findpercent($A,8200); ?></td>
								<td><?php echo $B ?></td>
							</tr>
							
							<tr>
							
							<?php 
							
								$after3months=" and (SELECT count(jp1.`beneficiary_id`)  FROM `xls_import_job_placement` as jp1 inner join xls_import_beneficiaries as bene1 on bene1.beneficiary_id=jp1.beneficiary_id where jp1.cust_status=true  and jp1.`Region` like '%$regionName%' and jp1.`beneficiary_id`=jp.`beneficiary_id` and Month(jp1.`EmploymentDate`)>=Month(DATE_ADD(jp.`EmploymentDate`, INTERVAL 3 MONTH) )) > 0 ";
			
								$BeforeQuarter_speficInd2="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment'  $whereQuarter $after3months )";
			
					  	$BtwQuarter_speficInd2="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Employment'  $whereBetweenQuarter $after3months )";
						
						$specificobhejctiveSqlnd2="select $BeforeQuarter_speficInd2 as A ,$BtwQuarter_speficInd2 as B from xls_import_job_placement as jp1 where jp1.placement_type='Employment' group by jp1.placement_type";
						
						$BeforeQuarter_SpecObjInd2= $this->Allfunction->runQueryGet($specificobhejctiveSqlnd2);
						
					//	print_r($BeforeQuarter_SpecObjInd2);
									$A=0;
							$B=0;
						
						if($BeforeQuarter_SpecObjInd2[0]['A']>0 || $BeforeQuarter_SpecObjInd2[0]['A']!=''){
							$A=$BeforeQuarter_SpecObjInd2[0]['A'];
						}
						
								if($BeforeQuarter_SpecObjInd2[0]['B']>0 || $BeforeQuarter_SpecObjInd2[0]['B']!=''){
							$B=$BeforeQuarter_SpecObjInd2[0]['B'];
						}
			
			
							?>
							
							

		
							<td>No. of target beneficiaries who are still employed 3 months after employment contract signed (disaggregated by region, value chain, target group, ER, sex and age)</td>
							<td>0</td>
							<td>6650</td>
								<td><?php echo $A ?></td>
								<td><?php echo findpercent($A,6650); ?></td>
								<td><?php echo $B ?></td>

							</tr>
							<!--  end row1-->
							
									<!--  row2-->
							
														<tr>

							 <td rowspan="4">ER1</td>
								<?php
								
        if(	$selectedquarter!='All'){							
															$whereBetweenQuarter=findquaretrBetweenFormat('tvettrain.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('tvettrain.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{											
											$whereQuarter="and Year(tvettrain.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
											
			
								$BeforeQuarter_Er1Ind1="(SELECT count(tvettrain.training_name) as mcount FROM  valuechain_master as vm left join `xls_import_tvet_training` as tvettrain on tvettrain.`valuechain`=vm.name where (tvettrain.training_type='Improved' or tvettrain.training_type='New')  $whereQuarter) ";
			
					  	$BtwQuarter_Er1Ind1="(SELECT count(tvettrain.training_name) as mcount FROM  valuechain_master as vm left join `xls_import_tvet_training` as tvettrain on tvettrain.`valuechain`=vm.name where (tvettrain.training_type='Improved' or tvettrain.training_type='New') $whereBetweenQuarter)";
						
					  	$Er1Sqlnd1="select $BeforeQuarter_Er1Ind1 as A ,$BtwQuarter_Er1Ind1 as B from xls_import_tvet_training as trng  where (trng.training_type='Improved' or trng.training_type='New') group by trng.`region`";
						
       // echo $Er1Sqlnd1;
						
						$Er1_Er1Ind1= $this->Allfunction->runQueryGet($Er1Sqlnd1);
									$A=0;
							$B=0;
					//	print_r($BeforeQuarter_SpecObjInd2);
						
						
						if($Er1_Er1Ind1[0]['A']>0 || $Er1_Er1Ind1[0]['A']!=''){
							$A=$Er1_Er1Ind1[0]['A'];
						}
						
								if($Er1_Er1Ind1[0]['B']>0 || $Er1_Er1Ind1[0]['B']!=''){
							$B=$Er1_Er1Ind1[0]['B'];
						}





								?>
								<td rowspan="4">Improved capacity of selected industrial clusters to create additional job opportunities with a special focus on the promotion of decent work.</td>
								<td>No. of new or improved TVETs trainings based on market demand (disaggregated by region and value chain)</td>
											<td>0</td>
								<td>33</td>
							 <td><?php echo $A ?></td>
								<td><?php echo findpercent($A,33); ?></td>
								<td><?php echo $B ?></td>
							</tr>
							<tr>
							<?php
/* Indicator 2 */

		if(	$selectedquarter!='All'){
			
			  $whereBetweenQuarter=findquaretrBetweenFormat('benetrain.end_date',$selectedyear,$selectedquarter);  // Between Quarter
					$whereQuarter=findquaretrFormat('benetrain.end_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(benetrain.end_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}

					$maincolumn='(count(distinct benetrain.beneficiary_id))';



		     $BeforeQuarter_Er1Ind2="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and benetrain.Certificate='COC Certified' $whereQuarter)";
							
				//			echo $BeforeQuarter_Er1Ind2;
			
					  	$BtwQuarter_Er1Ind2="(SELECT $maincolumn  FROM `xls_import_beneficiary_trainings` as benetrain inner join xls_import_beneficiaries as bene on bene.beneficiary_id=benetrain.beneficiary_id where benetrain.Is_Training_completed=true and benetrain.Certificate='COC Certified' $whereBetweenQuarter)";
						
					  	$Er1Sqlnd2="select $BeforeQuarter_Er1Ind2 as A ,$BtwQuarter_Er1Ind2 as B from xls_import_beneficiary_trainings as benet where benet.Is_Training_completed=true and benet.Certificate='COC Certified' group by benet.`Region`";
						
      // echo $Er1Sqlnd2;
						
						$Er1_Er1Ind2= $this->Allfunction->runQueryGet($Er1Sqlnd2);
									$A=0;
							$B=0;
					//	print_r($BeforeQuarter_SpecObjInd2);
						
						
						if($Er1_Er1Ind2[0]['A']>0 || $Er1_Er1Ind2[0]['A']!=''){
							$A=$Er1_Er1Ind2[0]['A'];
						}
						
						if($Er1_Er1Ind2[0]['B']>0 || $Er1_Er1Ind2[0]['B']!=''){
							$B=$Er1_Er1Ind2[0]['B'];
						}
							?>
							<td>No. of trainees who complete the SINCE supported TVETs trainings and who receive a certificate (disaggregated by region, value chain, target group, sex and age)</td>
							<td>0</td>
							<td>7200</td>
					 <td><?php echo $A ?></td>
								<td><?php echo findpercent($A,7200); ?></td>
								<td><?php echo $B ?></td>

							</tr>
													<tr>
													
													<?php 
													
													
													/* Indicator 3  */ 
																									if(	$selectedquarter!='All'){
																	
																											$whereBetweenQuarter=findquaretrBetweenFormat('agr_date',$selectedyear,$selectedquarter);  // Between Quarter
														            	$whereQuarter=findquaretrFormat('agr_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(agr_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
												

				
												
												$maincolumn='count(agr_date)';
												
												 				/* For Age OverAll */
						
				  $BeforeQuarter_Er1Ind3="(select $maincolumn as A from xls_import_pp where 1=1  $whereQuarter )";
      $BtwQuarter_Er1Ind3="(select $maincolumn as A from xls_import_pp where 1=1  $whereBetweenQuarter)";
					
					//echo $BeforeQuarter_Er1Ind3;
					  	$Er1Sqlnd3="select $BeforeQuarter_Er1Ind3 as A ,$BtwQuarter_Er1Ind3 as B from xls_import_pp ";
								
					
			//		echo 	$Er1Sqlnd3;
				$Er1_Er1Ind3= $this->Allfunction->runQueryGet($Er1Sqlnd3);
							$A=0;
							$B=0;
						
						if($Er1_Er1Ind3[0]['A']>0 || $Er1_Er1Ind3[0]['A']!=''){
							$A=$Er1_Er1Ind3[0]['A'];
						}
						
						if($Er1_Er1Ind3[0]['B']>0 || $Er1_Er1Ind3[0]['B']!=''){
							$B=$Er1_Er1Ind3[0]['B'];
						}
					/* end  Indicator 3  */ 
				
													?>
													
							<td>No. of job creation oriented PPPs supported and created by SINCE actions (disaggregated by region and value chain)</td>
							<td>0</td>
							<td>112</td>
					 <td><?php echo $A ?></td>
								<td><?php echo findpercent($A,112); ?></td>
								<td><?php echo $B ?></td>


							</tr>
													<tr>
													
													<?php 
														if(	$selectedquarter!='All'){							
																$whereBetweenQuarter=findquaretrBetweenFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('jp.EmploymentDate',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(jp.EmploymentDate)<='$selectedyear'";
											$whereBetweenQuarter=	$whereQuarter;
										}
										

				$BeforeQuarter_Er1Ind4="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Apprenticeship'  $whereQuarter)";
				
				
				$BtwQuarter_Er1Ind4="(SELECT count(jp.`beneficiary_id`)  FROM `xls_import_job_placement` as jp inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where jp.placement_type='Apprenticeship'  $whereBetweenQuarter)";

				$Er1Sqlnd4="select $BeforeQuarter_Er1Ind4 as A ,$BtwQuarter_Er1Ind4 as B from xls_import_job_placement as jpm where jpm.placement_type='Apprenticeship' group by  jpm.`Region`";
								
					 // echo $Er1Sqlnd4;
					
				$Er1_Er1Sqlnd4= $this->Allfunction->runQueryGet($Er1Sqlnd4);
							$A=0;
							$B=0;
					if($Er1_Er1Sqlnd4[0]['A']>0 || $Er1_Er1Sqlnd4[0]['A']!=''){
							$A=$Er1_Er1Sqlnd4[0]['A'];
						}
						
						if($Er1_Er1Sqlnd4[0]['B']>0 || $Er1_Er1Sqlnd4[0]['B']!=''){
							$B=$Er1_Er1Sqlnd4[0]['B'];
						}
													?>
							<td>No. of job placements facilitated through SINCE (disaggregated by region, value chain, target group, sex and age)</td>
							<td>0</td>
							<td>7800</td>
							<td><?php echo $A ?></td>
							<td><?php echo findpercent($A,7800); ?></td>
							<td><?php echo $B ?></td>


							</tr>
										<!--  end row2-->
										
										
										
												<!--  row3-->
							
														<tr>

							 <td rowspan="3">ER2</td>
								
								<?php
if(	$selectedquarter!='All'){
			
			  $whereBetweenQuarter=findquaretrBetweenFormat('entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
					$whereQuarter=findquaretrFormat('entry_point_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}

								$maincolumn='(count(distinct name))';

		     $BeforeQuarter_Er2Ind1="(SELECT $maincolumn  FROM `xls_import_smecompanies` where 1=1 $whereQuarter)";
					     $BtwQuarter_Er2Ind1="(SELECT $maincolumn  FROM `xls_import_smecompanies` where 1=1 $whereBetweenQuarter)";
					  
					  	$Er2Sqlnd1="select $BeforeQuarter_Er2Ind1 as A ,$BtwQuarter_Er2Ind1 as B from xls_import_smecompanies as smecomp  group by smecomp.`region`";
						
        //echo $Er2Sqlnd1;
						
						$Er2_Er2Ind1= $this->Allfunction->runQueryGet($Er2Sqlnd1);
						

													$A=0;
							$B=0;
					if($Er2_Er2Ind1[0]['A']>0 || $Er2_Er2Ind1[0]['A']!=''){
							$A=$Er2_Er2Ind1[0]['A'];
						}
						
						if($Er2_Er2Ind1[0]['B']>0 || $Er2_Er2Ind1[0]['B']!=''){
							$B=$Er2_Er2Ind1[0]['B'];
						}
						

								?>
								
								<td rowspan="3">Improved capacity of selected industrial clusters to create additional job opportunities with a special focus on the promotion of decent work.</td>
																
								<td>No. of SMEs supported by SINCE (disaggregated by region, value chain and type of support)</td>
										<td>0</td>
								<td>322</td>						
							<td><?php echo $A ?></td>
							<td><?php echo findpercent($A,322); ?></td>
							<td><?php echo $B ?></td>

							</tr>
							<tr>
								<?php
if(	$selectedquarter!='All'){
			
			  $whereBetweenQuarter=findquaretrBetweenFormat('entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
					$whereQuarter=findquaretrFormat('entry_point_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}

								$maincolumn='(count(distinct name))';

		     $BeforeQuarter_Er2Ind2="(SELECT $maincolumn  FROM `xls_import_smecompanies` where agr_decent_work_principle=true $whereQuarter)";
					     $BtwQuarter_Er2Ind2="(SELECT $maincolumn  FROM `xls_import_smecompanies` where agr_decent_work_principle=true $whereBetweenQuarter)";
					  
					  	$Er2Sqlnd2="select $BeforeQuarter_Er2Ind2 as A ,$BtwQuarter_Er2Ind2 as B from xls_import_smecompanies as smecomp  group by smecomp.`region`";
									$A=0;
							$B=0;

					  	$Er2_Er2Ind2= $this->Allfunction->runQueryGet($Er2Sqlnd2);
				 						
					  if($Er2_Er2Ind2[0]['A']>0 || $Er2_Er2Ind2[0]['A']!=''){
							$A=$Er2_Er2Ind2[0]['A'];
					 	}
						
				 		if($Er2_Er2Ind2[0]['B']>0 || $Er2_Er2Ind2[0]['B']!=''){
							$B=$Er2_Er2Ind2[0]['B'];
						}
						

								?>
							<td>No. of agreements with private sector that include obligations to adhere to decent work principles (disaggregated by region and value chain)</td>
							<td>0</td>
							<td>131</td>
							<td><?php echo $A ?></td>
							<td><?php echo findpercent($A,131); ?></td>
							<td><?php echo $B ?></td>

							</tr>
													<tr>
													<?php 
													/* Indicator 3 */

		if(	$selectedquarter!='All'){
			
			  $whereBetweenQuarter=findquaretrBetweenFormat('dataentry_date',$selectedyear,$selectedquarter);  // Between Quarter
					$whereQuarter=findquaretrFormat('dataentry_date',$selectedyear,$selectedquarter);
										}										
										else{											
											$whereQuarter="and Year(dataentry_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}

					  $maincolumn='(count(distinct support_type))';



		
		     $BeforeQuarter_Er2Ind3="(SELECT $maincolumn  FROM `xls_import_sme_support` where support_type='Subcontracting arrangement' $whereQuarter)";
					  $BtwQuarter_Er2Ind3="(SELECT $maincolumn  FROM `xls_import_sme_support` where support_type='Subcontracting arrangement' $whereBetweenQuarter)";
					  
					  	$Er2Sqlnd3="select $BeforeQuarter_Er2Ind3 as A ,$BtwQuarter_Er2Ind3 as B from xls_import_sme_support as smecomp  group by smecomp.`region`";
						
      //  echo $Er2Sqlnd3;						
					  	
								$Er2Sqlnd3= $this->Allfunction->runQueryGet($Er2Sqlnd3);
				 									$A=0;
							$B=0;
					  if($Er2Sqlnd3[0]['A']>0 || $Er2Sqlnd3[0]['A']!=''){
							$A=$Er2Sqlnd3[0]['A'];
					 	}						
				 		if($Er2Sqlnd3[0]['B']>0 || $Er2Sqlnd3[0]['B']!=''){
							$B=$Er2Sqlnd3[0]['B'];
						}
						
							?>						
							
							<td>No. of subcontracting arrangements between SMEs supported and larger enterprises (disaggregated by region, SME and value chain)</td>
							<td>0</td>
							<td>122</td>
							<td><?php echo $A ?></td>
							<td><?php echo findpercent($A,122); ?></td>
							<td><?php echo $B ?></td>

							</tr>

										<!--  end row3-->
										
										
										
											<!--  row4 -->
							
														<tr>

							 <td rowspan="2">Common Consortia OP</td>
								<td rowspan="2">EXTRA INDICATORS USED BY ALL CONSORTIA AT OUTPUT LEVEL</td>
								<td>No. of trainees of the SINCE supported TVETs trainings (disaggregated by region, value chain, target group, sex and age)</td>
												<td>0</td>
																<td>11,000</td>
									<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
							<tr>
							<td>Number of multi-stakeholder platforms established by the project to facilitate  dialogue between the public and private sector on the issue of job placement</td>
							<td>0</td>
							<td>15</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
									

										<!--  end row4-->




			<!--  row5 -->
							
														<tr>

							 <td rowspan="8">ER 3</td>
								<td rowspan="8">Enhance smooth school to work transition for university and TVET women and men graduates.</td>
								<td>N. of Pilot youth employment services (YES) centre established</td>
								<td>0</td>
								<td>1</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
							
							
						<tr>
							 <td>"N. of new services,and products, focusing on labour market information sharing, career counselling guidance, jobs registration offered by YES to youth"</td>
							<td>0</td>
							<td>3</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
						
						<tr>
							 <td>N. of government officials and experts trained on basic career guidance and counselling</td>
							<td>0</td>
							<td>100</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
													<tr>
							 <td>N of youth availing labour market information, including access to vacancies and employment referral services.</td>
							<td>0</td>
							<td>1000</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
							
													<tr>
							 <td>N.of men and women graduates and unemployed youth supported through career guidance services</td>
							<td>0</td>
							<td>1000</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
							
													<tr>
							 <td>N. of fresh graduates and unemployed Youth placed in decent jobs</td>
							<td>0</td>
							<td>200</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
							
													<tr>
							 <td>N. of YES vacancies registered</td>
							<td>0</td>
							<td>250</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
							
							
														<tr>
							 <td>N. of YES centre partnerships with employers and other service providers</td>
							<td>0</td>
							<td>10</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>

							</tr>
									

										<!--  end row5-->
										
										
										
										
					</tbody>
				</table>
					
		
						
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
				
