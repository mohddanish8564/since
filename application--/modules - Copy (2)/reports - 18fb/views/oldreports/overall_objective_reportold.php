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
										<th colspan="13" class="indcatortit">Indicator 1 : % reduction of irregular migration from the target areas </th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="5" style="text-align: center;">Male With Age Group</th>
											<th colspan="5" style="text-align: center;">Female With Age Group</th>
											<th style="text-align: center;">Total</th>
								        </tr>
								        <tr>
								          <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
												
								      <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
					
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
/* agrgroup 15-19 */


$agegrp='15-19';
$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

/* end  */
/* 24-24 */
$agegrp='20-24';
$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

/* end */

/* 24-29 */
$agegrp='24-29';
$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

/* 30-34 */ 
$agegrp='30-34';
$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



/* >35 */ 
$agegrp='>35';
$irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

 $indicator1_male_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
	
	
	// echo '<pre>';
	// echo $indicator1_male_sql.'--------<br>';
			
		
				$indicator1_male= $this->Allfunction->runQueryGet($indicator1_male_sql);
				
				$sum_A_male=0;
				$sum_B_male=0;
				$sum_C_male=0;
				$sum_D_male=0;
				$sum_E_male=0;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=$indicator1_male[0]['A'];
				$B_male=$indicator1_male[0]['B'];
				$C_male=$indicator1_male[0]['C'];
				$D_male=$indicator1_male[0]['D'];
				$E_male=$indicator1_male[0]['E'];
				
				/* sum */
				$sum_A_male=$sum_A_male+$A_male;
				$sum_B_male=$sum_B_male+$B_male;
				$sum_C_male=$sum_C_male+$C_male;
				$sum_D_male=$sum_D_male+$D_male;
				$sum_E_male=$sum_E_male+$E_male;
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
				if($indicator1_male[0]['C']=='' && $indicator1_male[0]['C']==null){
					$C_male=0;
				}
				if($indicator1_male[0]['D']=='' && $indicator1_male[0]['D']==null){
					$D_male=0;
				}
				if($indicator1_male[0]['E']=='' && $indicator1_male[0]['E']==null){
					$E_male=0;
				}
				
				
				
												
?>
												 		<td><?php echo $A_male; ?></td>
								    			<td><?php echo $B_male; ?></td>
								    			<td><?php echo $C_male; ?></td>
								    			<td><?php echo $D_male; ?></td>
								    			<td><?php echo $E_male; ?></td>
												 
				<?php

/* agrgroup 15-19 */
$sex='Female';

$agegrp='15-19';
$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

/* end  */
/* 24-24 */
$agegrp='20-24';
$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

/* end */

/* 24-29 */
$agegrp='24-29';
$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

/* 30-34 */ 
$agegrp='30-34';
$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



  /* >35 */ 
	 	$agegrp='>35';
		 $irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

			$indicator1_female_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
	
			
				$indicator1_Female= $this->Allfunction->runQueryGet($indicator1_female_sql);
				



				// foreach($indicator1_Female as $femaledata) {				
					
				$A_female=$indicator1_Female[0]['A'];
				$B_female=$indicator1_Female[0]['B'];
				$C_female=$indicator1_Female[0]['C'];
				$D_female=$indicator1_Female[0]['D'];
				$E_female=$indicator1_Female[0]['E'];
				
								/* sum */
				$sum_A_female=$sum_A_male+$A_female;
				$sum_B_female=$sum_B_male+$B_female;
				$sum_C_female=$sum_C_male+$C_female;
				$sum_D_female=$sum_D_male+$D_female;
				$sum_E_female=$sum_E_male+$E_female;
				
				if($indicator1_Female[0]['A']=='' && $indicator1_Female[0]['A']==null){
					$A_female=0;
				}
				if($indicator1_Female[0]['B']=='' && $indicator1_Female[0]['B']==null){
					$B_female=0;
				}
				if($indicator1_Female[0]['C']=='' && $indicator1_Female[0]['C']==null){
					$C_female=0;
				}
				if($indicator1_Female[0]['D']=='' && $indicator1_Female[0]['D']==null){
					$D_female=0;
				}
				if($indicator1_Female[0]['E']=='' && $indicator1_Female[0]['E']==null){
					$E_female=0;
				}
				
				
				$totalsum=$A_male+$A_female+$B_male+$B_female+$C_male+$C_female+$D_male+$D_female+$E_male+$E_female;
				
				$totalrowsum=$totalrowsum+$totalsum;
				
				
												
?>
												 		<td><?php echo $A_female; ?></td>
								    			<td><?php echo $B_female; ?></td>
								    			<td><?php echo $C_female; ?></td>
								    			<td><?php echo $D_female; ?></td>
								    			<td><?php echo $E_female; ?></td>
												 		<td><?php echo $totalrowsum; ?></td>
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>
								    	<tr>
								    		<th>Total</th>
														<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											
											 		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											  	<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>

								    		<td><?php echo $totalrowsum; ?></td>
								    	</tr>
								    </tbody>
								</table>

								

   <!-- end Indicator 1 -->			
			
							<div class="clearfix"></div>
				    	<hr class="mt0">								
									
																<!--Indicator2 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Indicator 2:  % reduction of propensity to irregular migration in the target areas </th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="5" style="text-align: center;">Male With Age Group</th>
											<th colspan="5" style="text-align: center;">Female With Age Group</th>
											<th style="text-align: center;">Total</th>
								        </tr>
								        <tr>
								          <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
												
								      <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
					
													<th></th>
								        </tr>
								    </thead>
								    <tbody>
								    	<?php
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;
								
											$Alltotal=0;
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
												
														
											
											
											/* Formula  */

				// :* (Propensity Endline  – Propensity Baseline)/Propensity Baseline

				$sex='Male';
				$endline='Endline';
				$baseline='Baseline';
				$maincolumn='propensity';
				$tableName='xls_import_oo_indicators12';
				/* agrgroup 15-19 */


				$agegrp='15-19';
				$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


				$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

				/* end  */
				/* 24-24 */
				$agegrp='20-24';
				$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

				/* end */

				/* 24-29 */
				$agegrp='24-29';
				$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

				/* 30-34 */ 
				$agegrp='30-34';
				$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



				/* >35 */ 
				$agegrp='>35';
				$irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

					$indicator1_male_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
					
	
	
	//echo $indicator1_male_sql;
			
				$indicator1_male= $this->Allfunction->runQueryGet($indicator1_male_sql);
				
				$sum_A_male=0;
				$sum_B_male=0;
				$sum_C_male=0;
				$sum_D_male=0;
				$sum_E_male=0;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=$indicator1_male[0]['A'];
				$B_male=$indicator1_male[0]['B'];
				$C_male=$indicator1_male[0]['C'];
				$D_male=$indicator1_male[0]['D'];
				$E_male=$indicator1_male[0]['E'];
				
				/* sum */
				$sum_A_male=$sum_A_male+$A_male;
				$sum_B_male=$sum_B_male+$B_male;
				$sum_C_male=$sum_C_male+$C_male;
				$sum_D_male=$sum_D_male+$D_male;
				$sum_E_male=$sum_E_male+$E_male;
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
				if($indicator1_male[0]['C']=='' && $indicator1_male[0]['C']==null){
					$C_male=0;
				}
				if($indicator1_male[0]['D']=='' && $indicator1_male[0]['D']==null){
					$D_male=0;
				}
				if($indicator1_male[0]['E']=='' && $indicator1_male[0]['E']==null){
					$E_male=0;
				}
				
				
				
												
?>
												 		<td><?php echo $A_male; ?></td>
								    			<td><?php echo $B_male; ?></td>
								    			<td><?php echo $C_male; ?></td>
								    			<td><?php echo $D_male; ?></td>
								    			<td><?php echo $E_male; ?></td>
												 
				<?php

				/* agrgroup 15-19 */
				$sex='Female';

				$agegrp='15-19';
				$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


				$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

				/* end  */
				/* 24-24 */
				$agegrp='20-24';
				$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

				$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

				/* end */

				/* 24-29 */
			$agegrp='24-29';
			$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

			/* 30-34 */ 
			$agegrp='30-34';
			$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



  /* >35 */ 
	 	$agegrp='>35';
		 $irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$endline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `data_entry_point` = '$baseline' and `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

			$indicator1_female_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";


			$indicator1_Female= $this->Allfunction->runQueryGet($indicator1_female_sql);
				



				// foreach($indicator1_Female as $femaledata) {
					
					
				$A_female=$indicator1_Female[0]['A'];
				$B_female=$indicator1_Female[0]['B'];
				$C_female=$indicator1_Female[0]['C'];
				$D_female=$indicator1_Female[0]['D'];
				$E_female=$indicator1_Female[0]['E'];
				
								/* sum */
				$sum_A_female=$sum_A_male+$A_female;
				$sum_B_female=$sum_B_male+$B_female;
				$sum_C_female=$sum_C_male+$C_female;
				$sum_D_female=$sum_D_male+$D_female;
				$sum_E_female=$sum_E_male+$E_female;
				
				if($indicator1_Female[0]['A']=='' && $indicator1_Female[0]['A']==null){
					$A_female=0;
				}
				if($indicator1_Female[0]['B']=='' && $indicator1_Female[0]['B']==null){
					$B_female=0;
				}
				if($indicator1_Female[0]['C']=='' && $indicator1_Female[0]['C']==null){
					$C_female=0;
				}
				if($indicator1_Female[0]['D']=='' && $indicator1_Female[0]['D']==null){
					$D_female=0;
				}
				if($indicator1_Female[0]['E']=='' && $indicator1_Female[0]['E']==null){
					$E_female=0;
				}
				
				
				$totalsum=$A_male+$A_female+$B_male+$B_female+$C_male+$C_female+$D_male+$D_female+$E_male+$E_female;
				
				$totalrowsum=$totalrowsum+$totalsum;
				
				
												
?>
												 		<td><?php echo $A_female; ?></td>
								    			<td><?php echo $B_female; ?></td>
								    			<td><?php echo $C_female; ?></td>
								    			<td><?php echo $D_female; ?></td>
								    			<td><?php echo $E_female; ?></td>
												 		<td><?php echo $totalrowsum; ?></td>
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>
								    	<tr>
								    		<th>Total</th>
														<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											
											 		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											  	<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>

								    		<td><?php echo $totalrowsum; ?></td>
								    	</tr>
								    </tbody>
								</table>

									   <!-- end Indicator 2 -->		
												
												
												
												
							<div class="clearfix"></div>
				    	<hr class="mt0">								
									
																<!--Indicator 3 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Indicator 3:  % increase in the average income in the target areas</th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="5" style="text-align: center;">Male With Age Group</th>
											<th colspan="5" style="text-align: center;">Female With Age Group</th>
											<th style="text-align: center;">Total</th>
								        </tr>
								        <tr>
								          <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
												
								      <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
					
													<th></th>
								        </tr>
								    </thead>
								    <tbody>
								    	<?php
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;
							
											$Alltotal=0;
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
												
														
											
																
																/* Formula  */

					// :* (Average Income Endline  – Average Income Baseline )/Average Income Baseline 

					$sex='Male';
					$endline='Endline';
					$baseline='Baseline';
			 	$maincolumn='average_income_end ';
			  $tableName='xls_import_oo_indicators34';
					/* agrgroup 15-19 */


					$agegrp='15-19';
					$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


					$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

					/* end  */
					/* 24-24 */
					$agegrp='20-24';
					$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

					/* end */

					/* 24-29 */
					$agegrp='24-29';
					$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

					/* 30-34 */ 
					$agegrp='30-34';
					$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



					/* >35 */ 
					$agegrp='>35';
					$irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

					$indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

						$indicator1_male_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
						
	
	
	//echo $indicator1_male_sql;
			
				$indicator1_male= $this->Allfunction->runQueryGet($indicator1_male_sql);
				
				$sum_A_male=0;
				$sum_B_male=0;
				$sum_C_male=0;
				$sum_D_male=0;
				$sum_E_male=0;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=$indicator1_male[0]['A'];
				$B_male=$indicator1_male[0]['B'];
				$C_male=$indicator1_male[0]['C'];
				$D_male=$indicator1_male[0]['D'];
				$E_male=$indicator1_male[0]['E'];
				
				/* sum */
				$sum_A_male=$sum_A_male+$A_male;
				$sum_B_male=$sum_B_male+$B_male;
				$sum_C_male=$sum_C_male+$C_male;
				$sum_D_male=$sum_D_male+$D_male;
				$sum_E_male=$sum_E_male+$E_male;
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
				if($indicator1_male[0]['C']=='' && $indicator1_male[0]['C']==null){
					$C_male=0;
				}
				if($indicator1_male[0]['D']=='' && $indicator1_male[0]['D']==null){
					$D_male=0;
				}
				if($indicator1_male[0]['E']=='' && $indicator1_male[0]['E']==null){
					$E_male=0;
				}
				
				
				
												
?>
												 		<td><?php echo $A_male; ?></td>
								    			<td><?php echo $B_male; ?></td>
								    			<td><?php echo $C_male; ?></td>
								    			<td><?php echo $D_male; ?></td>
								    			<td><?php echo $E_male; ?></td>
												 
				<?php

/* agrgroup 15-19 */
$sex='Female';

$agegrp='15-19';
$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

/* end  */
/* 24-24 */
$agegrp='20-24';
$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

/* end */

/* 24-29 */
$agegrp='24-29';
$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

/* 30-34 */ 
$agegrp='30-34';
$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



  /* >35 */ 
	 	$agegrp='>35';
		 $irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

			$indicator1_female_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
	
			
				$indicator1_Female= $this->Allfunction->runQueryGet($indicator1_female_sql);
				



				// foreach($indicator1_Female as $femaledata) {
					
					
				$A_female=$indicator1_Female[0]['A'];
				$B_female=$indicator1_Female[0]['B'];
				$C_female=$indicator1_Female[0]['C'];
				$D_female=$indicator1_Female[0]['D'];
				$E_female=$indicator1_Female[0]['E'];
				
								/* sum */
				$sum_A_female=$sum_A_male+$A_female;
				$sum_B_female=$sum_B_male+$B_female;
				$sum_C_female=$sum_C_male+$C_female;
				$sum_D_female=$sum_D_male+$D_female;
				$sum_E_female=$sum_E_male+$E_female;
				
				if($indicator1_Female[0]['A']=='' && $indicator1_Female[0]['A']==null){
					$A_female=0;
				}
				if($indicator1_Female[0]['B']=='' && $indicator1_Female[0]['B']==null){
					$B_female=0;
				}
				if($indicator1_Female[0]['C']=='' && $indicator1_Female[0]['C']==null){
					$C_female=0;
				}
				if($indicator1_Female[0]['D']=='' && $indicator1_Female[0]['D']==null){
					$D_female=0;
				}
				if($indicator1_Female[0]['E']=='' && $indicator1_Female[0]['E']==null){
					$E_female=0;
				}
				
				
				$totalsum=$A_male+$A_female+$B_male+$B_female+$C_male+$C_female+$D_male+$D_female+$E_male+$E_female;
				
				$totalrowsum=$totalrowsum+$totalsum;
				
				
												
?>
												 		<td><?php echo $A_female; ?></td>
								    			<td><?php echo $B_female; ?></td>
								    			<td><?php echo $C_female; ?></td>
								    			<td><?php echo $D_female; ?></td>
								    			<td><?php echo $E_female; ?></td>
												 		<td><?php echo $totalrowsum; ?></td>
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>
								    	<tr>
								    		<th>Total</th>
														<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											
											 		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											  	<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>

								    		<td><?php echo $totalrowsum; ?></td>
								    	</tr>
								    </tbody>
								</table>

									   <!-- end Indicator 3 -->		
												
												
												
																			<div class="clearfix"></div>
				    	<hr class="mt0">								
									
																<!--Indicator 4 -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Indicator 4:  % reduction of unemployment in the target areas</th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="5" style="text-align: center;">Male With Age Group</th>
											<th colspan="5" style="text-align: center;">Female With Age Group</th>
											<th style="text-align: center;">Total</th>
								        </tr>
								        <tr>
								          <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
												
								      <th>15-19</th>
													<th>20-24</th>
													<th>25-29</th>
													<th>30-34</th>
													<th>	>35</th>
					
													<th></th>
								        </tr>
								    </thead>
								    <tbody>
								    	<?php
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;
								
											
											// SELECT irregular_migration FROM $tableName WHERE `data_entry_point` = "Endline" and  `age_group` ="15-19" and  `sex`="Male" and `Consortium` = "Lot1"
											$Alltotal=0;
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												
									
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
												<?php 
												
														
														
														
														/* Formula  */

			// :*o	Formula :* (Unemployment endline – unemployment baseline)/Unemployment baseline

			$sex='Male';
			$endline='Endline';
			$baseline='Baseline';
	  $maincolumn='unemployment_end';
		 $tableName='xls_import_oo_indicators34';
			/* agrgroup 15-19 */


			$agegrp='15-19';
			$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE  `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


			$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

			/* end  */
			/* 24-24 */
			$agegrp='20-24';
			$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

			/* end */

			/* 24-29 */
			$agegrp='24-29';
			$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

			/* 30-34 */ 
			$agegrp='30-34';
			$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



			/* >35 */ 
			$agegrp='>35';
			$irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

			$indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

				$indicator1_male_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
				
				
	
	//echo $indicator1_male_sql;
			
				$indicator1_male= $this->Allfunction->runQueryGet($indicator1_male_sql);
				
				$sum_A_male=0;
				$sum_B_male=0;
				$sum_C_male=0;
				$sum_D_male=0;
				$sum_E_male=0;
				// foreach($indicator1_male as $maledata) {
					
					
				$A_male=$indicator1_male[0]['A'];
				$B_male=$indicator1_male[0]['B'];
				$C_male=$indicator1_male[0]['C'];
				$D_male=$indicator1_male[0]['D'];
				$E_male=$indicator1_male[0]['E'];
				
				/* sum */
				$sum_A_male=$sum_A_male+$A_male;
				$sum_B_male=$sum_B_male+$B_male;
				$sum_C_male=$sum_C_male+$C_male;
				$sum_D_male=$sum_D_male+$D_male;
				$sum_E_male=$sum_E_male+$E_male;
				
				if($indicator1_male[0]['A']=='' && $indicator1_male[0]['A']==null){
					$A_male=0;
				}
				if($indicator1_male[0]['B']=='' && $indicator1_male[0]['B']==null){
					$B_male=0;
				}
				if($indicator1_male[0]['C']=='' && $indicator1_male[0]['C']==null){
					$C_male=0;
				}
				if($indicator1_male[0]['D']=='' && $indicator1_male[0]['D']==null){
					$D_male=0;
				}
				if($indicator1_male[0]['E']=='' && $indicator1_male[0]['E']==null){
					$E_male=0;
				}
				
				
				
												
?>
												 		<td><?php echo $A_male; ?></td>
								    			<td><?php echo $B_male; ?></td>
								    			<td><?php echo $C_male; ?></td>
								    			<td><?php echo $D_male; ?></td>
								    			<td><?php echo $E_male; ?></td>
												 
				<?php

/* agrgroup 15-19 */
$sex='Female';

$agegrp='15-19';
$irregularmigEndline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_15_19="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";


$indicator1_15_19= '('.$irregularmigEndline_15_19.'-'.$irregularmigBaseline_15_19.'/'.$irregularmigBaseline_15_19.') as A';

/* end  */
/* 24-24 */
$agegrp='20-24';
$irregularmigEndline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_20_24="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_20_24= '('.$irregularmigEndline_20_24.'-'.$irregularmigBaseline_20_24.'/'.$irregularmigBaseline_20_24.') as B';

/* end */

/* 24-29 */
$agegrp='24-29';
$irregularmigEndline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE  `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_24_29="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_24_29= '('.$irregularmigEndline_24_29.'-'.$irregularmigBaseline_24_29.'/'.$irregularmigBaseline_24_29.') as C';

/* 30-34 */ 
$agegrp='30-34';
$irregularmigEndline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$irregularmigBaseline_30_34="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

$indicator1_30_34= '('.$irregularmigEndline_30_34.'-'.$irregularmigBaseline_30_34.'/'.$irregularmigBaseline_30_34.') as D';



  /* >35 */ 
	 	$agegrp='>35';
		 $irregularmigEndline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $irregularmigBaseline_35="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end as firmale FROM $tableName WHERE `age_group` ='$agegrp' and  `sex`='$sex' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";

		 $indicator1_35= '('.$irregularmigEndline_35.'-'.$irregularmigBaseline_35.'/'.$irregularmigBaseline_35.') as E';

			$indicator1_female_sql="select ".$indicator1_15_19.','.$indicator1_20_24.','.$indicator1_24_29.','.$indicator1_30_34.','.$indicator1_35." from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
	
			
				$indicator1_Female= $this->Allfunction->runQueryGet($indicator1_female_sql);
				



				// foreach($indicator1_Female as $femaledata) {
					
					
				$A_female=$indicator1_Female[0]['A'];
				$B_female=$indicator1_Female[0]['B'];
				$C_female=$indicator1_Female[0]['C'];
				$D_female=$indicator1_Female[0]['D'];
				$E_female=$indicator1_Female[0]['E'];
				
								/* sum */
				$sum_A_female=$sum_A_male+$A_female;
				$sum_B_female=$sum_B_male+$B_female;
				$sum_C_female=$sum_C_male+$C_female;
				$sum_D_female=$sum_D_male+$D_female;
				$sum_E_female=$sum_E_male+$E_female;
				
				if($indicator1_Female[0]['A']=='' && $indicator1_Female[0]['A']==null){
					$A_female=0;
				}
				if($indicator1_Female[0]['B']=='' && $indicator1_Female[0]['B']==null){
					$B_female=0;
				}
				if($indicator1_Female[0]['C']=='' && $indicator1_Female[0]['C']==null){
					$C_female=0;
				}
				if($indicator1_Female[0]['D']=='' && $indicator1_Female[0]['D']==null){
					$D_female=0;
				}
				if($indicator1_Female[0]['E']=='' && $indicator1_Female[0]['E']==null){
					$E_female=0;
				}
				
				
				$totalsum=$A_male+$A_female+$B_male+$B_female+$C_male+$C_female+$D_male+$D_female+$E_male+$E_female;
				
				$totalrowsum=$totalrowsum+$totalsum;
				
				
												
?>
												 		<td><?php echo $A_female; ?></td>
								    			<td><?php echo $B_female; ?></td>
								    			<td><?php echo $C_female; ?></td>
								    			<td><?php echo $D_female; ?></td>
								    			<td><?php echo $E_female; ?></td>
												 		<td><?php echo $totalrowsum; ?></td>
				<?php //} ?>
								    		

								    		</tr>
								    	<?php 

											}										?>
								    	<tr>
								    		<th>Total</th>
														<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											
											 		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
											  	<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>
								    		<td><?php echo  $sum_A_male+$sum_A_female; ?></td>

								    		<td><?php echo $totalrowsum; ?></td>
								    	</tr>
								    </tbody>
								</table>

									   <!-- end Indicator 4 -->		
												
												
																	<div class="clearfix"></div>
				    	       <hr class="mt0">		
												
												
																<!-- Overall Objective Indicators 1 and 2 Irregular Migration and Propensity, Baseline and Endline Values -->
								        <table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Overall Objective Indicators 1 and 2 Irregular Migration and Propensity, Baseline and Endline Values</th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="4">Region</th>
								            <th colspan="4" style="text-align: center;">Irregular Migration</th>
											         <th colspan="4" style="text-align: center;">Propensity</th>
								        </tr>
																
																<tr>								        
								            <th  style="text-align: center;" colspan="2">BaseLine</th>
																				<th  style="text-align: center;" colspan="2">Endline</th>
									         	 <th  style="text-align: center;" colspan="2">BaseLine</th>
																				<th  style="text-align: center;" colspan="2">Endline</th>
								        </tr>
																
								        <tr>
																														
								          <th>Male</th>
													     <th>Female</th>
																																
								          <th>Male</th>
													     <th>Female</th>
																																
								          <th>Male</th>
													     <th>Female</th>	 
																		
								          <th>Male</th>
												     	<th>Female</th>


								        </tr>
								    </thead>
								    <tbody>
								    	<?php
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;
								

											$endline='Endline';
											$baseline='Baseline';									
											$sexmale='Male';		
											$sexfemale='Female';				
											$tableName='xls_import_oo_indicators12';											
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
		  	      
											
											
											
           $maincolumn='irregular_migration';
						     $irregularmig_baseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `sex`='$sexmale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$irregularmig_baseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and  `sex`='$sexfemale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
										
											$irregularmig_endline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `sex`='$sexmale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$irregularmig_endline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and  `sex`='$sexfemale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											
											
											
											// propensity 
											$maincolumn='propensity';
										$propen_baseline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and `sex`='$sexmale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$propen_baseline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$baseline' and  `sex`='$sexfemale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
										
											$propen_endline_male="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and `sex`='$sexmale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$propen_endline_female="(SELECT case when sum($maincolumn)>0 then sum($maincolumn) else 0 end FROM $tableName WHERE `data_entry_point` = '$endline' and  `sex`='$sexfemale' and `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											
											
											// complete query  
											
											$sqlqueryidni12="select $irregularmig_baseline_male as A,$irregularmig_baseline_female as B,$irregularmig_baseline_female as C,$irregularmig_endline_female as D,$propen_baseline_male as E,$propen_baseline_female as F,$propen_endline_male as G,$propen_endline_female as H from $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`";
						
											// echo $sqlqueryidni12;
											// die;
					     // $sql_irreg_migbaseline;
										$indicatpor1to3A=0;
										$indicatpor1to3B=0;
										$indicatpor1to3C=0;
										$indicatpor1to3D=0;
										$indicatpor1to3E=0;
										$indicatpor1to3F=0;
										$indicatpor1to3G=0;
										$indicatpor1to3H=0;
											$indicatpor1to3= $this->Allfunction->runQueryGet($sqlqueryidni12);
											if($indicatpor1to3[0]['A']>0){
											$indicatpor1to3A=$indicatpor1to3[0]['A'];
											}
											if($indicatpor1to3[0]['B']>0){
											$indicatpor1to3B=$indicatpor1to3[0]['B'];
											}
											if($indicatpor1to3[0]['C']>0){
											$indicatpor1to3C=$indicatpor1to3[0]['C'];
											}
											if($indicatpor1to3[0]['D']>0){
											$indicatpor1to3D=$indicatpor1to3[0]['D'];
											}
											if($indicatpor1to3[0]['E']>0){
											$indicatpor1to3E=$indicatpor1to3[0]['E'];
											}
											if($indicatpor1to3[0]['F']>0){
											$indicatpor1to3F=$indicatpor1to3[0]['F'];
											}
											if($indicatpor1to3[0]['G']>0){
											$indicatpor1to3G=$indicatpor1to3[0]['G'];
											}
											if($indicatpor1to3[0]['A']>0){
											$indicatpor1to3H=$indicatpor1to3[0]['H'];
											}
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
											
												 		<td><?php echo $indicatpor1to3A; ?></td>
								    			<td><?php echo $indicatpor1to3B; ?></td>															
															<td><?php echo $indicatpor1to3C; ?></td>
								    			<td><?php echo $indicatpor1to3D; ?></td>
						
											
												 		<td><?php echo $indicatpor1to3E; ?></td>
								    			<td><?php echo $indicatpor1to3F; ?></td>															
															<td><?php echo $indicatpor1to3G; ?></td>
								    			<td><?php echo $indicatpor1to3H; ?></td>

		
								    		

								    		</tr>
								    	<?php 

											}										?>

								    </tbody>
								</table>

					 <!-- end Indicator Objective Indicators 1 and 2 Irregular Migration and Propensity -->		
												
												
																	<div class="clearfix"></div>
				    	       <hr class="mt0">		
												
					<!-- Overall Objective Indicators 3 and 4 Income and Unemployment, Baseline and Endline -->
								<table class="table table-bordered" id="indicator1">
									<thead>
									   <tr>
										<th colspan="13" class="indcatortit">Overall Objective Indicators 3 and 4 Income and Unemployment, Baseline and Endline</th>
								        </tr>
									    <tr>
										<th colspan="13" style="text-align: center;">Achievement in %</th>
								        </tr>
																
																
																
								        <tr>
								            <th rowspan="2">Region</th>
								            <th colspan="2" style="text-align: center;">Average Income</th>
											<th colspan="2" style="text-align: center;">Unemployment</th>
								        </tr>
								        <tr>
								          <th>Baseline</th>
													<th>End line</th>
						
												
								      <th>Baseline</th>
													<th>End line</th>


								        </tr>
								    </thead>
								    <tbody>
								    	<?php
													
												$tot_male = 0;$tot_fmale = 0;$tot_t = 0;									
						
											$endline='Endline';
											$baseline='Baseline';									
									  $tableName='xls_import_oo_indicators34';											
											foreach($sqlregions as $consortium)
											{
												
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
		  	      
											
											$maincolumn1='avreage_income_base';
											$maincolumn2='average_income_end';
		

						     $averageBase="(SELECT case when sum($maincolumn1)>0 then sum($maincolumn1) else 0 end FROM $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$averageEnd="(SELECT case when sum($maincolumn2)>0 then sum($maincolumn2) else 0 end FROM $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
													
					      
											
											$maincolumn1='unemployment_base';
											$maincolumn2='unemployment_end';
		

						     $unemployemntBase="(SELECT case when sum($maincolumn1)>0 then sum($maincolumn1) else 0 end FROM $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											$unemployemntEnd="(SELECT case when sum($maincolumn2)>0 then sum($maincolumn2) else 0 end FROM $tableName WHERE `Consortium` like  '%$consortiumId%' GROUP by `Consortium`)";
											
											
											$sql3to4="select $averageBase as A,$averageEnd as B, $unemployemntBase as C,$unemployemntEnd as D from $tableName where `Consortium` like  '%$consortiumId%' GROUP by `Consortium` ";
								//			echo $sql3to4;
								$indicator3to4A=0;
								$indicator3to4B=0;
								$indicator3to4C=0;
								$indicator3to4D=0;
		
												$indicator3to4=$this->Allfunction->runQueryGet($sql3to4);
												// print_R($indicator3to4);
												if($indicator3to4[0]['A']>0){
													$indicator3to4A=$indicator3to4[0]['A'];
												}
												if($indicator3to4[0]['B']>0){
													$indicator3to4B=$indicator3to4[0]['B'];
												}
												if($indicator3to4[0]['C']>0){
													$indicator3to4C=$indicator3to4[0]['C'];
												}
												if($indicator3to4[0]['D']>0){
													$indicator3to4D=$indicator3to4[0]['D'];
												}
												
								// die;
												
								    		?>
								    		<tr>
											
								    			<th><?php echo $consortiumId.'-'.$regionName; ?></th>
											
												 		<td><?php echo $indicator3to4A; ?></td>
								    			<td><?php echo $indicator3to4B; ?></td>
						
			
												 		<td><?php echo $indicator3to4C; ?></td>
								    			<td><?php echo $indicator3to4D; ?></td>

		
								    		

								    		</tr>
								    	<?php 

											}										?>
								 
								    </tbody>
								</table>

					 <!-- end Indicator Objective Indicators 1 and 2 Irregular Migration and Propensity -->		
												
												
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
				
