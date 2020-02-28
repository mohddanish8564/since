<style>
@media print{
	.indcatortit{
   	text-align: center;
    background: #eff7f7;
}
	body
{ 
font-size:80%;
 -webkit-print-color-adjust: exact; 
  margin: 0.5mm 0.5mm 0.5mm 0.5mm;
}
	#header,#left-panel,.page-footer,.hidePrint,#shortcut,button,.demo{
		display:none !important;
	}

	table{
		    width: 100% !important;
    padding: 0px !important;
	}
	tr, th, td {
    border: 1px solid !important;
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
			<form action="" method="post" class="hidePrint">
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
																					$startdate = strtr($startdate, '/', '-');
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
				<div role="content">
					
							
					<button  class="btn-sm btn-primary print-btn" onclick="window.print();">Print</button>
					<div class="clearfix"></div>
					<!-- widget content -->
					<div class="widget-body no-padding">
					
					<!-- indicator 1  -->		
								<table class="table table-bordered">
									<thead>
									   <tr>
									   	<th colspan="4" class="indcatortit">Indicator 1 :    No. of SMEs supported by SINCE</th>
								     </tr>
								   <tr>
											
								  <th>Region / Lot</th>
										
										<th style="text-align: center;">Support Type</th>
										<th style="text-align: center;">Number of Support</th>
								        </tr>
								    </thead>
								    <tbody>
												<?php		
												
												$tot_new = 0;
												$tot_improved = 0;		
												$datewhere='';								
												 
											foreach($sqlregions as $consortium)
											{
														
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];
												

												
												$table_name='xls_import_tvet_training' ;
												$maincolumn='training_name';
												if($startdateDB!=''){
												$datewhere="and dataentry_date between '$startdateDB' and '$todateDB'";
												}
												$sqlindicator1="select count(sme_name) as A,support_type as B from xls_import_sme_support where consortium like '%$consortiumId%' $datewhere group by support_type";			            
												// echo $sqlindicator1;
												$new=0;
												$improved=0;		
								 			$resultindi1=$this->Allfunction->runQueryGet($sqlindicator1);
									
												$ik=0;	
										 	foreach($resultindi1 as $resdata1){
																						
															$regionconsort=$consortiumId.'-'.$regionName;
														
												//	print_r($resdata1);
												
													if($resdata1['A']>0){
													$new=$resdata1['A'];
														$tot_new=$tot_new+$new;
													}
														
													
																	
									 		
												?>												
              	<tr>											
								    			<th><?php echo $regionconsort; ?></th>
															<th  style="text-align: center;"><?php echo $resdata1['B']; ?></th>
															<th  style="text-align: center;"><?php echo $new; ?></th>
															</tr>
													<?php 
											$ik++;
												}
	
											}
												?>
								    
								    </tbody>
												<tfoot>
													   <tr>											
								  <th>Total </th>
												<th style="text-align: center;"></th>
												<th style="text-align: center;"><?php echo $tot_new;?></th>
								 </tr>
												</tfoot>
								</table>
       <!-- End Indicator 1 -->
							
							
							<div class="clearfix"></div>
				    	<hr class="mt0">								
							
									<!-- indicator 2  -->		
								<table class="table table-bordered">
									<thead>
									   <tr>
									   	<th colspan="4" class="indcatortit">Indicator 2 :   Average No. of SMEs supported by SINCE</th>
								     </tr>
								   <tr>
											
								  <th>Region / Lot</th>
										
								  <th style="text-align: center;">Support Type</th>
										<th style="text-align: center;">Number of Support</th>
								        </tr>
								    </thead>
								    <tbody>
												<?php		
               $tot_new=0;
															$datewhere='';								
												  //$next=array();
														// $startdate=$datexp[0];
											   // $fromdate=$datexp[1];
											  	// $startdateDB='';
											  	// $todateDB='';
														
											foreach($sqlregions as $consortium)
											{
														
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];	
									 
 												$table_name='xls_import_smecompanies' ;
											//	$maincolumn='beneficiary_id';
												if($startdateDB!=''){
												$datewhere="and supp.dataentry_date between '$startdateDB' and '$todateDB'";
												}
			
			
												$sqlindicator1="SELECT  (   (AVG(`end_line_capacity_level`)-AVG(`entry_point_capacity_level`))/AVG(`entry_point_capacity_level`)) as A, supp.support_type as B from xls_import_smecompanies as smcomp inner join xls_import_sme_support as supp on supp.sme_name=smcomp.enterprise_id  where smcomp.consortium like '%$consortiumId%' $datewhere group by supp.support_type";			
            
										 //	echo $sqlindicator1;
												$new=0;
						
								 			$resultindi1=$this->Allfunction->runQueryGet($sqlindicator1);
									
												$ik=0;	
										 	foreach($resultindi1 as $resdata1){
																	
												$regionconsort=$consortiumId.'-'.$regionName;
														
												//	print_r($resdata1);
												
													if($resdata1['A']!=''){
													//$new=$resdata1['A'];
													$new=number_format((float)$resdata1['A'], 2, '.', '');
														$tot_new=$tot_new+$new;
													}
												
																										
																	
									 		
												?>												
              	<tr>											
								    			<th><?php echo $regionconsort; ?></th>
															<th><?php echo $resdata1['B']; ?></th>
															<th  style="text-align: center;"><?php echo $new; ?></th>
															</tr>
													<?php 
											$ik++;
												}
	
											}
												?>
								    
								    </tbody>
												<tfoot>
													   <tr>											
								  <th>Total </th>
												<th style="text-align: center;"></th>
												<th style="text-align: center;"><?php echo number_format((float)$tot_new, 2, '.', ''); ;?></th>
								 </tr>
												</tfoot>
								</table>
       <!-- End Indicator 2 -->
							
							
								<div class="clearfix"></div>
				    	<hr class="mt0">								
							
									<!-- indicator 3  -->		
								<table class="table table-bordered">
									<thead>
									   <tr>
									   	<th colspan="4" class="indcatortit">Indicator 3 :     No. of agreements with private sector that include obligations to adhere to decent work principles</th>
								     </tr>
								   <tr>
											
								  <th>Region / Lot</th>
										
								  <th style="text-align: center;">Value Chain</th>
										<th style="text-align: center;">Number PPP Agreements</th>
								        </tr>
								    </thead>
								    <tbody>
												<?php		
               $tot_new=0;
															$datewhere='';								
												  //$next=array();
														// $startdate=$datexp[0];
											   // $fromdate=$datexp[1];
											  	// $startdateDB='';
											  	// $todateDB='';
														
											foreach($sqlregions as $consortium)
											{
														
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];	
									 
 										//		$table_name='xls_import_tvet_training' ;
											//	$maincolumn='beneficiary_id';
												if($startdateDB!=''){
												$datewhere="and dataentry_date between '$startdateDB' and '$todateDB'";
												}
											
											$sqlindicator1="SELECT distinct count(smcomp.agr_decent_work_principle) as A,supp.support_type as B from xls_import_smecompanies as smcomp inner join xls_import_sme_support as supp on supp.sme_name=smcomp.enterprise_id  where smcomp.consortium like '%$consortiumId%' $datewhere group by supp.support_type ";		
																	
																	
										//	echo $sqlindicator1;
												$new=0;
						
								 			$resultindi1=$this->Allfunction->runQueryGet($sqlindicator1);
									
												$ik=0;	
										 	foreach($resultindi1 as $resdata1){
																	
												$regionconsort=$consortiumId.'-'.$regionName;
														
												//	print_r($resdata1);
												
													if($resdata1['A']>0){
													$new=$resdata1['A'];
														$tot_new=$tot_new+$new;
													}
												
																										
																	
									 		
												?>												
              	<tr>											
								    			<th><?php echo $regionconsort; ?></th>
															<th><?php echo $resdata1['B']; ?></th>
															<th  style="text-align: center;"><?php echo $new; ?></th>
															</tr>
													<?php 
											$ik++;
												}
	
											}
												?>
								    
								    </tbody>
												<tfoot>
													   <tr>											
								  <th>Total </th>
												<th style="text-align: center;"></th>
												<th style="text-align: center;"><?php echo $tot_new;?></th>
								 </tr>
												</tfoot>
								</table>
       <!-- End Indicator 3 -->
							
							
							
													<div class="clearfix"></div>
				    	<hr class="mt0">								
							
									<!-- indicator 4  -->		
										<table class="table table-bordered">
									<thead>
									   <tr>
									   	<th colspan="4" class="indcatortit">[Indicator 4]: % increase in employment in SMEs reinforced by SINCE</th>
								     </tr>
								   <tr>
											
								  <th>Region / Lot</th>
										<th style="text-align: center;">Value</th>
								        </tr>
								    </thead>
								    <tbody>
												<?php		
               $tot_new=0;
															$datewhere='';								
												  //$next=array();
														// $startdate=$datexp[0];
											   // $fromdate=$datexp[1];
											  	// $startdateDB='';
											  	// $todateDB='';
														
											foreach($sqlregions as $consortium)
											{
														
												$consortiumId=$consortium['lots_id'];
												$regionName=$consortium['region'];	
									 
 												$table_name='xls_import_smecompanies' ;
											//	$maincolumn='beneficiary_id';
												if($startdateDB!=''){
												$datewhere="and supp.dataentry_date between '$startdateDB' and '$todateDB'";
												}
			
			
												$sqlindicator1="SELECT  (   (AVG(smcomp.`emp_no_end_line`)-AVG(smcomp.`emp_no_entry_point`))/AVG(smcomp.`emp_no_end_line`)) as A from xls_import_smecompanies as smcomp inner join xls_import_sme_support as supp on supp.sme_name=smcomp.enterprise_id  where smcomp.consortium like '%$consortiumId%' $datewhere ";			
            											
										//	 echo $sqlindicator1;
												
												$new=0;
						
								 			$resultindi1=$this->Allfunction->runQueryGet($sqlindicator1);
									
												$ik=0;	
										 	foreach($resultindi1 as $resdata1){
																	
												$regionconsort=$consortiumId.'-'.$regionName;
														
												//	print_r($resdata1);
												
													if($resdata1['A']!=''){
													//$new=$resdata1['A'];
													$new=number_format((float)$resdata1['A'], 2, '.', '');
														$tot_new=$tot_new+$new;
													}
												
																										
																	
									 		
												?>												
              	<tr>											
								    			<th><?php echo $regionconsort; ?></th>
															<th  style="text-align: center;"><?php echo $new; ?></th>
															</tr>
													<?php 
											$ik++;
												}
	
											}
												?>
								    
								    </tbody>
												<tfoot>
													   <tr>											
								  <th>Total </th>
												<th style="text-align: center;"><?php echo number_format((float)$tot_new, 2, '.', ''); ;?></th>
								 </tr>
												</tfoot>
								</table>
       <!-- End Indicator 4 -->
						
						
					</div>
					<!-- end widget content -->
					
						
					
				</div>
				
