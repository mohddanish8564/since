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
			<form action="" method="post" class="hidden">
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
					
			
									<!-- indicator 4  -->		
								<table class="table table-bordered">
									<thead>
									<tr>
									   	<th colspan="2" class="indcatortit">Logs Of Uploaded Excel</th>
								     </tr>
								   <tr>
											
								  <th>File of Region / Lot</th>
										
										<th>Uploaded Date</th>
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
														
											// foreach($sqlregions as $consortium)
											// {
														
												// $consortiumId=$consortium['lots_id'];
												// $regionName=$consortium['region'];	
									 
										
												if($startdateDB!=''){
												$datewhere="and entry_date_to_since between '$startdateDB' and '$todateDB'";
												}
				

				
												// $sqlindicator1="SELECT distinct count(bene.beneficiary_id) as A,bene.value_chain as valuechain FROM `xls_import_job_placement` as jp  inner join xls_import_beneficiaries as bene on bene.beneficiary_id=jp.beneficiary_id where bene.region like '%$regionName%' and placement_type='Apprenticeship' $datewhere";		
												
												
												$sqlindicator1="SELECT `file_name` as A,`date` as B  FROM `log` where file_name!=''  group by `file_name`,`date`";			
         
									//		echo $sqlindicator1;
												$new=0;
						
								 			$resultindi=$this->Allfunction->runQueryGet($sqlindicator1);
									
												$ik=0;	
												$resA=$resB='';
										 	// foreach($resultindi1 as $resdata1){
																	
												// $regionconsort=$consortiumId.'-'.$regionName;
														
											//	print_r($resultindi1);
												foreach($resultindi as $resultindi1){
													if($resultindi1['A']!=''){
													$resA=$resultindi1['A'];
													}			
													
				      if($resultindi1['B']!=''){
													$resB=$resultindi1['B'];
													}																
																										
									$LOtName=explode('_',$resA);					
									 		
												?>												
              	<tr>											
								    			<td><?php echo $LOtName[0]; ?></td>
															<td><?php echo date("d-m-Y h:i:s",strtotime($resB)); ?></td>
															</tr>
													<?php 
											$ik++;
												}
											//	}
	
										//	}
												?>
								    
								    </tbody>

								</table>
       <!-- End Indicator 3 -->
						
						
					</div>
					<!-- end widget content -->
					
						
					
				</div>
				
