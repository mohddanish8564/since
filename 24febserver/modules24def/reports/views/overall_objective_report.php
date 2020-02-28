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
			<?php
			echo $title; ?>

		</h1>
	</div>
	
</div>

<!-- Calender -->
<div class="row">
			<form action="" method="post">
		  
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
	
	setTimeout(function(){ 	$(".autoclick").trigger("click"); }, 500);
  $('input[name="monthfil"]').daterangepicker({
	  locale:{
format:'DD/MM/YYYY'
}
  });
});
</script>
				<div class="col-md-3">
						<label style="visibility:hidden"> Entry To Since Date  </label>
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
										<th colspan="13" class="indcatortit">OO Indicator 1 % reduction of irregular migration from the target areas</th>
								        </tr>
									  
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="2" style="text-align: center;">Sex</th>
											<th colspan="2" style="text-align: center;">Age Group</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Overall</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Target</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Achieved %</th>
								        </tr>
								        <tr>
								          <th>Male</th>
													<th>Female</th>
										
												
								      <th>18-34</th>
													<th>34 Above</th>

				

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
												
												if($consortiumId=='Lot_1'){
												$indicator1achiveper=10;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=10;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=6;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=10;
												}
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
																									
											
											
											/* Formula  */

// irregular_migration :* (Irregular Migration End line – Irregular Migration Baseline)/Irregular Migration Baseline

$sex='Male';
$endline='Endline';
$baseline='Baseline';
$maincolumn='irregular_migration';

$tableName='xls_import_oo_indicators12';
/* For Male */

$irregularmigEndline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

$irregularmigBaseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


// $indicator1_male= '(('.$irregularmigEndline_male.'-'.$irregularmigBaseline_male.')/'.$irregularmigBaseline_male.') as A';
$indicator1_male= '(('.$irregularmigBaseline_male.'-'.$irregularmigEndline_male.')/'.$irregularmigBaseline_male.') as A';
/* end  */



	/* For FeMale */
	$sex='Female';

	$irregularmigEndline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

	$irregularmigBaseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


	// $indicator1_female= '(('.$irregularmigEndline_female.'-'.$irregularmigBaseline_female.')/'.$irregularmigBaseline_female.') as B';
		$indicator1_female= '(('.$irregularmigBaseline_female.'-'.$irregularmigEndline_female.')/'.$irregularmigBaseline_female.') as B';

 /* end FeMale */
 $indicator1_sex_sql="select ".$indicator1_male.",".$indicator1_female." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	
	//echo  $indicator1_sex_sql;
	$indicator1_male= $this->Allfunction->runQueryGet($indicator1_sex_sql);
		
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_male[0]['A'],1);
				$B_male=number_format($indicator1_male[0]['B'],1);
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
			
				
				
												
?>
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
								    	
								    			
															
															<?php
																														
															/* For Age Group 18-34 */
															
				$age_group='18-34';
				$irregularmigEndline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

				$irregularmigBaseline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


				// $indicator1_18_34= '(('.$irregularmigEndline_18_34.'-'.$irregularmigBaseline_18_34.')/'.$irregularmigBaseline_18_34.') as A';
				$indicator1_18_34= '(('.$irregularmigBaseline_18_34.'-'.$irregularmigEndline_18_34.')/'.$irregularmigBaseline_18_34.') as A';

				/* end FeMale */


		/* For Age Group 35 & above */
																		
			$age_group='35 & above';
			$irregularmigEndline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

			$irregularmigBaseline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


			// $indicator1_35above= '(('.$irregularmigEndline_35above.'-'.$irregularmigBaseline_35above.' )/'.$irregularmigBaseline_35above.') as B';
			$indicator1_35above= '(('.$irregularmigBaseline_35above.'-'.$irregularmigEndline_35above.' )/'.$irregularmigBaseline_35above.') as B';

			/* end  */



 $indicator1_agrGrp_sql="select ".$indicator1_18_34.",".$indicator1_35above." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	

// echo $indicator1_agrGrp_sql;
// exit;

	$indicator1_agrGrp= $this->Allfunction->runQueryGet($indicator1_agrGrp_sql);
		
		// echo '<pre>';
		// print_r($indicator1_agrGrp);
		// die;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_agrGrp[0]['A'],1);
				$B_male=number_format($indicator1_agrGrp[0]['B'],1);
				
				if($indicator1_agrGrp[0]['A']=='' && $indicator1_agrGrp[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_agrGrp[0]['B']=='' && $indicator1_agrGrp[0]['B']==null){
					$B_male=0;
				}
			
			
			
															?>
			
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
												 
													
													<?php 

 				/* For Age OverAll */
					
				$overall=0;
				$irregularmigEndline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";

				$irregularmigBaseline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


				//$indicator1_overall= '(('.$irregularmigEndline_overall.'-'.$irregularmigBaseline_overall.')/'.$irregularmigBaseline_overall.') as A';
					$indicator1_overall= '(('.$irregularmigBaseline_overall.'-'.$irregularmigEndline_overall.')/'.$irregularmigBaseline_overall.') as A';

				
				
				 $indicator1_overall_sql="select ".$indicator1_overall." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
					
						$indicator1_overall= $this->Allfunction->runQueryGet($indicator1_overall_sql);
						
					//	print_R($indicator1_overall);
						
						$overall=number_format($indicator1_overall[0]['A'],1);
				
				if($indicator1_overall[0]['A']=='' && $indicator1_overall[0]['A']==null){
					$overall=0;
				}
				
				/* end OverAll */
													?>
													<td><?php echo convert_perc($overall); ?></td>
													<td><?php echo number_format($indicator1achiveper,2); ?>%</td>
																<td><?php echo convert_perc(($overall/$indicator1achiveper)*100); ?></td>
													
													
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

								

   <!-- end Indicator 1 -->			
			
							<div class="clearfix"></div>
				    	<hr class="mt0">		




					<!--Indicator2 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">OO Indicator 2 % reduction of propensity to irregular migration in the target areas</th>
								        </tr>
									  
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="2" style="text-align: center;">Sex</th>
											<th colspan="2" style="text-align: center;">Age Group</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Overall</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Target</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Achieved %</th>
								        </tr>
								        <tr>
								          <th>Male</th>
													<th>Female</th>
						
												
								      <th>18-34</th>
													<th>34 Above</th>
						
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
												
												if($consortiumId=='Lot_1'){
												$indicator1achiveper=13;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=11;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=15;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=10;
												}
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
																									
											
											
											/* Formula  */

// irregular_migration :* (Irregular Migration End line – Irregular Migration Baseline)/Irregular Migration Baseline

$sex='Male';
$endline='Endline';
$baseline='Baseline';
$maincolumn='propensity';

$tableName='xls_import_oo_indicators12';
/* For Male */

$irregularmigEndline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

$irregularmigBaseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


// $indicator1_male= '(('.$irregularmigEndline_male.'-'.$irregularmigBaseline_male.')/'.$irregularmigBaseline_male.') as A';
$indicator1_male= '(('.$irregularmigBaseline_male.'-'.$irregularmigEndline_male.')/'.$irregularmigBaseline_male.') as A';


/* end  */



	/* For FeMale */
	$sex='Female';

	$irregularmigEndline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

	$irregularmigBaseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


	// $indicator1_female= '(('.$irregularmigEndline_female.'-'.$irregularmigBaseline_female.')/'.$irregularmigBaseline_female.') as B';
	$indicator1_female= '(('.$irregularmigBaseline_female.'-'.$irregularmigEndline_female.')/'.$irregularmigBaseline_female.') as B';


 /* end FeMale */
 $indicator1_sex_sql="select ".$indicator1_male.",".$indicator1_female." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	
	//echo  $indicator1_sex_sql;
	$indicator1_male= $this->Allfunction->runQueryGet($indicator1_sex_sql);
		
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_male[0]['A'],1);
				$B_male=number_format($indicator1_male[0]['B'],1);
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
			
				
				
												
?>
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
								 
								    			
															
															<?php
																														
															/* For Age Group 18-34 */
															
				$age_group='18-34';
				$irregularmigEndline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

				$irregularmigBaseline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


				// $indicator1_18_34= '(('.$irregularmigEndline_18_34.'-'.$irregularmigBaseline_18_34.')/'.$irregularmigBaseline_18_34.') as A';
			   	$indicator1_18_34= '(('.$irregularmigBaseline_18_34.'-'.$irregularmigEndline_18_34.')/'.$irregularmigBaseline_18_34.') as A';

				/* end FeMale */


		/* For Age Group 35 & above */
																		
			$age_group='35 & above';
			$irregularmigEndline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

			$irregularmigBaseline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


			// $indicator1_35above= '(('.$irregularmigEndline_35above.'-'.$irregularmigBaseline_35above.' )/'.$irregularmigBaseline_35above.') as B';

			$indicator1_35above= '(('.$irregularmigBaseline_35above.'-'.$irregularmigEndline_35above.' )/'.$irregularmigBaseline_35above.') as B';

			/* end  */



 $indicator1_agrGrp_sql="select ".$indicator1_18_34.",".$indicator1_35above." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	

// echo $indicator1_agrGrp_sql;
// exit;

	$indicator1_agrGrp= $this->Allfunction->runQueryGet($indicator1_agrGrp_sql);
		
		// echo '<pre>';
		// print_r($indicator1_agrGrp);
		// die;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_agrGrp[0]['A'],1);
				$B_male=number_format($indicator1_agrGrp[0]['B'],1);
				
				if($indicator1_agrGrp[0]['A']=='' && $indicator1_agrGrp[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_agrGrp[0]['B']=='' && $indicator1_agrGrp[0]['B']==null){
					$B_male=0;
				}
			
			
			
															?>
			
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>

												 
													
													<?php 

 				/* For Age OverAll */
					
				$overall=0;
				$irregularmigEndline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";

				$irregularmigBaseline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


				// $indicator1_overall= '(('.$irregularmigEndline_overall.'-'.$irregularmigBaseline_overall.')/'.$irregularmigBaseline_overall.') as A';

				$indicator1_overall= '(('.$irregularmigBaseline_overall.'-'.$irregularmigEndline_overall.')/'.$irregularmigBaseline_overall.') as A';

				
				 $indicator1_overall_sql="select ".$indicator1_overall." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
					
						$indicator1_overall= $this->Allfunction->runQueryGet($indicator1_overall_sql);
						
					//	print_R($indicator1_overall);
						
						$overall=number_format($indicator1_overall[0]['A'],1);
				
				if($indicator1_overall[0]['A']=='' && $indicator1_overall[0]['A']==null){
					$overall=0;
				}
				
				/* end OverAll */
													?>
													<td><?php echo convert_perc($overall); ?></td>
													<td><?php echo number_format($indicator1achiveper,2); ?>%</td>
																<td><?php echo convert_perc(($overall/$indicator1achiveper)*100); ?></td>
													
													
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

								

   <!-- end Indicator 2 -->			
			
							<div class="clearfix"></div>
				    	<hr class="mt0">								
									
									
									
					<!--Indicator3 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">OO Indicator 3 % increase in income in the target areas </th>
								        </tr>
									  
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="2" style="text-align: center;">Sex</th>
											<th colspan="2" style="text-align: center;">Age Group</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Overall</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Target</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Achieved %</th>
								        </tr>
								        <tr>
								          <th>Male</th>
													<th>Female</th>
							
												
								      <th>18-34</th>
													<th>34 Above</th>

				

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
												
												if($consortiumId=='Lot_1'){
												$indicator1achiveper=7;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=25;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=10;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=15;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=13;
												}
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
																									
											
											
											/* Formula  */

// irregular_migration :* (Irregular Migration End line – Irregular Migration Baseline)/Irregular Migration Baseline

$sex='Male';
$maincolumn='Income_Endline';
$tableName='xls_import_oo_indicators34';

/* For Male */

$irregularmigEndline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

$maincolumn='Income_baseline';


$irregularmigBaseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


// $indicator1_male= '(('.$irregularmigEndline_male.'-'.$irregularmigBaseline_male.')/'.$irregularmigBaseline_male.') as A';

$indicator1_male= '(('.$irregularmigBaseline_male.'-'.$irregularmigEndline_male.')/'.$irregularmigBaseline_male.') as A';


/* end  */



	/* For FeMale */
	$sex='Female';
 $maincolumn='Income_Endline';
	$irregularmigEndline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

  $maincolumn='Income_baseline';
	$irregularmigBaseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE   `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


	// $indicator1_female= '(('.$irregularmigEndline_female.'-'.$irregularmigBaseline_female.')/'.$irregularmigBaseline_female.') as B';
		$indicator1_female= '(('.$irregularmigBaseline_female.'-'.$irregularmigEndline_female.')/'.$irregularmigBaseline_female.') as B';


 /* end FeMale */
 $indicator1_sex_sql="select ".$indicator1_male.",".$indicator1_female." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	
	//echo  $indicator1_sex_sql;
	$indicator1_male= $this->Allfunction->runQueryGet($indicator1_sex_sql);
		
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_male[0]['A'],1);
				$B_male=number_format($indicator1_male[0]['B'],1);
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
			
				
				
												
?>
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
					
								    			
															
															<?php
																														
															/* For Age Group 18-34 */
															
				$age_group='18-34';
				$maincolumn='Income_Endline';
				$irregularmigEndline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

    $maincolumn='Income_baseline';
				$irregularmigBaseline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


				// $indicator1_18_34= '(('.$irregularmigEndline_18_34.'-'.$irregularmigBaseline_18_34.')/'.$irregularmigBaseline_18_34.') as A';

				$indicator1_18_34= '(('.$irregularmigBaseline_18_34.'-'.$irregularmigEndline_18_34.')/'.$irregularmigBaseline_18_34.') as A';
				/* end FeMale */


		/* For Age Group 35 & above */
																		
			$age_group='35 & above';
			$maincolumn='Income_Endline';
			$irregularmigEndline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

			$maincolumn='Income_baseline';
			$irregularmigBaseline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


			// $indicator1_35above= '(('.$irregularmigEndline_35above.'-'.$irregularmigBaseline_35above.' )/'.$irregularmigBaseline_35above.') as B';

						$indicator1_35above= '(('.$irregularmigBaseline_35above.'-'.$irregularmigEndline_35above.' )/'.$irregularmigBaseline_35above.') as B';
/* end  */


 $indicator1_agrGrp_sql="select ".$indicator1_18_34.",".$indicator1_35above." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	

// echo $indicator1_agrGrp_sql;
// exit;

	$indicator1_agrGrp= $this->Allfunction->runQueryGet($indicator1_agrGrp_sql);
		
		// echo '<pre>';
		// print_r($indicator1_agrGrp);
		// die;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_agrGrp[0]['A'],1);
				$B_male=number_format($indicator1_agrGrp[0]['B'],1);
				
				if($indicator1_agrGrp[0]['A']=='' && $indicator1_agrGrp[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_agrGrp[0]['B']=='' && $indicator1_agrGrp[0]['B']==null){
					$B_male=0;
				}
			
			
			
															?>
			
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>

												 
													
													<?php 

 				/* For Age OverAll */
					
				$overall=0;
				$maincolumn='Income_Endline';
				$irregularmigEndline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


	   	$maincolumn='Income_baseline';
				$irregularmigBaseline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


				// $indicator1_overall= '(('.$irregularmigEndline_overall.'-'.$irregularmigBaseline_overall.')/'.$irregularmigBaseline_overall.') as A';
								$indicator1_overall= '(('.$irregularmigBaseline_overall.'-'.$irregularmigEndline_overall.')/'.$irregularmigBaseline_overall.') as A';

				 $indicator1_overall_sql="select ".$indicator1_overall." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
					
						$indicator1_overall= $this->Allfunction->runQueryGet($indicator1_overall_sql);
						
					//	print_R($indicator1_overall);
						
						$overall=number_format($indicator1_overall[0]['A'],1);
				
				if($indicator1_overall[0]['A']=='' && $indicator1_overall[0]['A']==null){
					$overall=0;
				}
				
				/* end OverAll */
													?>
													<td><?php echo convert_perc($overall); ?></td>
													<td><?php echo number_format($indicator1achiveper,2); ?>%</td>
																<td><?php echo convert_perc(($overall/$indicator1achiveper)*100); ?></td>
													
													
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

								

   <!-- end Indicator 3 -->			
			
							<div class="clearfix"></div>
				    	<hr class="mt0">								
									
									
													<!--Indicator4 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">% reduction of unemployment in the target areas </th>
								        </tr>
									  
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="2" style="text-align: center;">Sex</th>
											<th colspan="2" style="text-align: center;">Age Group</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Overall</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Target</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Achieved %</th>
								        </tr>
								        <tr>
								          <th>Male</th>
													<th>Female</th>
				
												
								      <th>18-34</th>
													<th>34 Above</th>
	
				

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
												
												if($consortiumId=='Lot_1'){
												$indicator1achiveper=4;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=1;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=5;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=10;
												}
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
																									
											
											
											/* Formula  */

// irregular_migration :* (Irregular Migration End line – Irregular Migration Baseline)/Irregular Migration Baseline

$sex='Male';
$maincolumn='Unemployment_End';
$tableName='xls_import_oo_indicators34';

/* For Male */

$irregularmigEndline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

$maincolumn='Unemployment_Base';


$irregularmigBaseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


// $indicator1_male= '(('.$irregularmigEndline_male.'-'.$irregularmigBaseline_male.')/'.$irregularmigBaseline_male.') as A';
$indicator1_male= '(('.$irregularmigBaseline_male.'-'.$irregularmigEndline_male.')/'.$irregularmigBaseline_male.') as A';


/* end  */



	/* For FeMale */
	$sex='Female';
 $maincolumn='Unemployment_End';
	$irregularmigEndline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";

  $maincolumn='Unemployment_Base';
	$irregularmigBaseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE   `By_sex` =1 and  `sex`='$sex' and `region` like  '%$regionName%' GROUP by `region`)";


	// $indicator1_female= '(('.$irregularmigEndline_female.'-'.$irregularmigBaseline_female.')/'.$irregularmigBaseline_female.') as B';

 	$indicator1_female= '(('.$irregularmigBaseline_female.'-'.$irregularmigEndline_female.')/'.$irregularmigBaseline_female.') as B';
/* end FeMale */
 $indicator1_sex_sql="select ".$indicator1_male.",".$indicator1_female." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	
	//echo  $indicator1_sex_sql;
	$indicator1_male= $this->Allfunction->runQueryGet($indicator1_sex_sql);
		
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_male[0]['A'],1);
				$B_male=number_format($indicator1_male[0]['B'],1);
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
			
				
				
												
?>
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
					    			
															
															<?php
																														
															/* For Age Group 18-34 */
															
				$age_group='18-34';
				$maincolumn='Unemployment_End';
				$irregularmigEndline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

    $maincolumn='Unemployment_Base';
				$irregularmigBaseline_18_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


				// $indicator1_18_34= '(('.$irregularmigEndline_18_34.'-'.$irregularmigBaseline_18_34.')/'.$irregularmigBaseline_18_34.') as A';
								$indicator1_18_34= '(('.$irregularmigBaseline_18_34.'-'.$irregularmigEndline_18_34.')/'.$irregularmigBaseline_18_34.') as A';
/* end FeMale */


		/* For Age Group 35 & above */
																		
			$age_group='35 & above';
			$maincolumn='Unemployment_End';
			$irregularmigEndline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";

			$maincolumn='Unemployment_Base';
			$irregularmigBaseline_35above="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `By_age` =1 and `age_group`='$age_group' and `region` like  '%$regionName%' GROUP by `region`)";


			// $indicator1_35above= '(('.$irregularmigEndline_35above.'-'.$irregularmigBaseline_35above.' )/'.$irregularmigBaseline_35above.') as B';

			$indicator1_35above= '(('.$irregularmigBaseline_35above.'-'.$irregularmigEndline_35above.' )/'.$irregularmigBaseline_35above.') as B';

			/* end  */


 $indicator1_agrGrp_sql="select ".$indicator1_18_34.",".$indicator1_35above." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
	

// echo $indicator1_agrGrp_sql;
// exit;

	$indicator1_agrGrp= $this->Allfunction->runQueryGet($indicator1_agrGrp_sql);
		
		// echo '<pre>';
		// print_r($indicator1_agrGrp);
		// die;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=number_format($indicator1_agrGrp[0]['A'],1);
				$B_male=number_format($indicator1_agrGrp[0]['B'],1);
				
				if($indicator1_agrGrp[0]['A']=='' && $indicator1_agrGrp[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_agrGrp[0]['B']=='' && $indicator1_agrGrp[0]['B']==null){
					$B_male=0;
				}
			
			
			
															?>
			
												 		<td><?php echo convert_perc($A_male); ?></td>
								    			<td><?php echo convert_perc($B_male); ?></td>
											 
													
													<?php 

 				/* For Age OverAll */
					
				$overall=0;
				$maincolumn='Unemployment_End';
				$irregularmigEndline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


	   	$maincolumn='Unemployment_Base';
				$irregularmigBaseline_overall="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `Is_overall` =1 and `region` like '%$regionName%' GROUP by `region`)";


				// $indicator1_overall= '(('.$irregularmigEndline_overall.'-'.$irregularmigBaseline_overall.')/'.$irregularmigBaseline_overall.') as A';
								$indicator1_overall= '(('.$irregularmigBaseline_overall.'-'.$irregularmigEndline_overall.')/'.$irregularmigBaseline_overall.') as A';

				 $indicator1_overall_sql="select ".$indicator1_overall." from $tableName WHERE `region` like  '%$regionName%' GROUP by `region`";
					
						$indicator1_overall= $this->Allfunction->runQueryGet($indicator1_overall_sql);
						
					//	print_R($indicator1_overall);
						
						$overall=number_format($indicator1_overall[0]['A'],1);
				
				if($indicator1_overall[0]['A']=='' && $indicator1_overall[0]['A']==null){
					$overall=0;
				}
				
				/* end OverAll */
													?>
													<td><?php echo convert_perc($overall); ?></td>
													<td><?php echo number_format($indicator1achiveper,2); ?>%</td>
																<td><?php echo convert_perc(($overall/$indicator1achiveper)*100); ?></td>
													
													
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

								

   <!-- end Indicator 3 -->			
			
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
				
