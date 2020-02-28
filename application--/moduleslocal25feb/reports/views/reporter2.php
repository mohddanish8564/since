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
									  <th>ER2</th>  
											<th colspan="8">Indicator 1: No. of SME's supported by SINCE</th>  
									  <th colspan="2">Until date:</th>  
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
												$indicator1achiveper=200;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=30;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=46;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=30;
												}
												
			       if(	$selectedquarter!='All'){							
													  $whereBetweenQuarter=findquaretrBetweenFormat('sme.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('sme.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(sme.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
										
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(sme.name) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' $whereQuarter group by vm.name) as TT  ON TT.name=MVM.NAME order by MVM.name asc";

 //echo $valuechainSql.'<br>';
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
		
		
		
		$valuechainQuarterSql="SELECT count(sme.name) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' $whereBetweenQuarter ";


 // echo $valuechainQuarterSql.'<br>';
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
									
									
									

   <!--Indicator 2 -->			
			
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>ER2</th>  
											<th colspan="7">Indicator 2: Average improvement in capacity of SME's supported</th>  
									  <th colspan="2">Until date:</th>  
									</tr>
									
										<tr>
									  <th  rowspan="2">Region</th>  
											<th colspan="5">Value Chain</th> 
											<th colspan="3">Year: <?php echo $selectedyear ?></th>		
						
									</tr>
									
									
															<tr>
		 
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>											
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
												$indicator1achiveper=20;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=20;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=25;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=10;
												}
												
			       if(	$selectedquarter!='All'){							
													  $whereBetweenQuarter=findquaretrBetweenFormat('sme.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('sme.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(sme.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
										
									$maincolumn="((AVG(sme.end_line_capacity_level)-AVG(sme.entry_point_capacity_level))/AVG(sme.entry_point_capacity_level))";		
									$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
									from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,$maincolumn as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' group by vm.name) as TT  ON TT.name=MVM.NAME order by MVM.name asc";

 //echo $valuechainSql.'<br>';
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
			<td><?php echo number_format($ValuechainData['tcount'],1); ?></td>
		<?php 
		}
		
		


	?>
									
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
												
					
					<!-- End  indicator2 -->
					
					<div class="clearfix"></div>
				    	<hr class="mt0">			

   <!--Indicator 3 -->			
			
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>ER2</th>  
											<th colspan="8">Indicator 3: No. of agree. with private sector that include obligations for decent work</th>  
									  <th colspan="2">Until date:</th>  
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
												$indicator1achiveper=200;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=30;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=46;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=30;
												}
												
			       if(	$selectedquarter!='All'){							
													  $whereBetweenQuarter=findquaretrBetweenFormat('sme.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('sme.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(sme.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
										
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(sme.agr_decent_work_principle) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' and sme.agr_decent_work_principle=true $whereQuarter group by vm.name) as TT  ON TT.name=MVM.NAME order by MVM.name asc";

 //echo $valuechainSql.'<br>';
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
		
		
		
		$valuechainQuarterSql="SELECT count(sme.agr_decent_work_principle) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' and sme.agr_decent_work_principle=true $whereBetweenQuarter ";


 // echo $valuechainQuarterSql.'<br>';
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
												
					
					<!-- End  indicator 3 -->
					
										<div class="clearfix"></div>
				    	<hr class="mt0">			

 <!--Indicator 4 -->			
			
												<div class="table-responsive table-center">
								<table class="table table-bordered text-center" id="indicator1">
								 	<thead>

									
								 	<tr>
									  <th>ER2</th>  
											<th colspan="8">Indicator 4:  No. of subcontracting arrangements b/n SME's supported and larger enterprises</th>  
									  <th colspan="2">Until date:</th>  
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
												$indicator1achiveper=200;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=30;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=46;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=30;
												}
												
			       if(	$selectedquarter!='All'){							
													  $whereBetweenQuarter=findquaretrBetweenFormat('sme.entry_point_date',$selectedyear,$selectedquarter);  // Between Quarter
															$whereQuarter=findquaretrFormat('sme.entry_point_date',$selectedyear,$selectedquarter);
										}
										
										else{
											
											$whereQuarter="and Year(sme.entry_point_date)<='$selectedyear'";
											$whereBetweenQuarter=$whereQuarter;
										}
										
										
		
$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,count(sme.agr_decent_work_principle) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name inner join xls_import_sme_support as smesupp on smesupp.sme_name=sme.enterprise_id  where sme.`region` like '%$regionName%' and smesupp.support_type='Subcontracting arrangement' $whereQuarter group by vm.name) as TT  ON TT.name=MVM.NAME order by MVM.name asc";

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
		
		
		
		$valuechainQuarterSql="SELECT vm.name,count(sme.agr_decent_work_principle) as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name inner join xls_import_sme_support as smesupp on smesupp.sme_name=sme.enterprise_id  where sme.`region` like '%$regionName%' and smesupp.support_type='Subcontracting arrangement' $whereBetweenQuarter ";


 // echo $valuechainQuarterSql.'<br>';
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
												
					
					<!-- End  indicator 4 -->
					
					
										
					<div class="clearfix"></div>
				   <hr class="mt0">			
									
									
									

									<!--Indicator 5 -->			
			
							 <div class="table-responsive table-center">
					  			<table class="table table-bordered text-center" id="indicator1">
								 	<thead>									
								 	<tr>
									  <th>ER2</th>  
											<th colspan="7">Indicator 5:  % increase in employment in SME's reinforced by SINCE</th>  
									  <th colspan="2">Until date:</th>  
									</tr>									
										<tr>
									  <th  rowspan="2">Region</th>  
											<th colspan="5">Value Chain</th> 
											<th colspan="3">Year: <?php echo $selectedyear ?></th>								
									</tr>									
										
										<tr>		 
											<th>Agribusiness</th>
											<th>Constructon</th>
											<th>Leather</th>
											<th>Metal</th>
											<th>Textile</th>											
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
												$indicator1achiveper=20;
												}
															if($consortiumId=='Lot_2'){
												$indicator1achiveper=20;
												}
															if($consortiumId=='Lot_3'){
												$indicator1achiveper=25;
												}
															if($consortiumId=='Lot_4'){
												$indicator1achiveper=16;
												}
															if($consortiumId=='Lot_5'){
												$indicator1achiveper=10;
												}
						
										
										
									$maincolumn="((AVG(sme.emp_no_end_line)-AVG(sme.emp_no_entry_point))/AVG(sme.emp_no_end_line))";		
									$valuechainSql="select MVM.name, CASE WHEN mcount is null THEN 0 ELSE mcount END as tcount
									from valuechain_master AS MVM LEFT JOIN (SELECT vm.name,$maincolumn as mcount FROM  valuechain_master as vm left join `xls_import_smecompanies` as sme on sme.`value_chain`=vm.name  where sme.`region` like '%$regionName%' group by vm.name) as TT  ON TT.name=MVM.NAME order by MVM.name asc";

 //echo $valuechainSql.'<br>';
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
			<td><?php echo number_format($ValuechainData['tcount'],1); ?></td>
		<?php 
		}
		
		


	?>
									
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
												
					
					<!-- End -->
				
		
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
				
