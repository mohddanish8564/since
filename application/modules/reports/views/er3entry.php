<style>
@page  
{ 
    size: auto;   /* auto is the initial value */ 

    /* this affects the margin in the printer settings */ 
    margin: 7mm 7mm 7mm 7mm;  
} 

@media print{
	th{
		text-align:left;
	}
	.indcatortit{
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
	table,tr, th, td {
    border:0.5px solid !important;
				 border-collapse: collapse;
    padding: 9px !important;
}

	
}

input.cinput {
    border: 0;
    width: 100%;
}

td,th{
	padding:5px !important;
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
		
<script>
$(function() {
	
	setTimeout(function(){ 	$(".autoclick").trigger("click"); }, 500);

});
</script>

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
					<style>
					  .disabled{
								background:#ebebe4;
							}
					</style>

	<table class="table table-bordered" id="indicator1">
									<thead>
									
								<tr>
										<th colspan="11" class="indcatortit">SINCE ILO - Expected Result 3</th>
								</tr>
									  
																
																
																
								        <tr>
								            <th rowspan="2" >Objectively Verifiable Indicators</th>
																				<th rowspan="2" >Total Value</th>
																				<th rowspan="2" >Total Achieved</th>
																				<th rowspan="2" >% of achievement</th>
																				<th rowspan="2" >Total Period Value</th>
								            <th colspan="2" style="text-align: center;">Sex</th>
											<th colspan="2" style="text-align: center;">Age Group</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Value chain</th>
											<th rowspan="2" style="text-align: center;vertical-align: middle;">Target Group</th>

								        </tr>
								        <tr>
								   							
																			
																			<th>Male</th>
													<th>Female</th>
										
												
								      <th>18-35</th>
													<th>35 Above</th>

				

								        </tr>
								    </thead>
								    <tbody>
								    									    	

														<tr>										
								    			<th>N. of Pilot youth employment services (YES) centre established</th>
															<td class="input"><input type="text" value="" name="row1column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row1column2" class="cinput"></th>
															<th class="disabled"><input type="hidden" value="" name="row1column3" class="cinput"></th>
															<td class="input"><input type="text" value="" name="row1column4" class="cinput"></td>
															<td class="disabled"><input type="hidden" value="" name="row1column5" class="cinput"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row1column6" class="cinput"></td>																			
												 		<td class="disabled"><input type="hidden" value="" name="row1column7" class="cinput"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row1column8" class="cinput"></td>			 
															<td class="disabled"><input type="hidden" value="" name="row1column9" class="cinput"></td>
													  <td class="disabled"><input type="hidden" value="" name="row1column10" class="cinput"></td>				
						    		</tr>
												
												<tr>										
								    			<th>N. of new services,and products, focusing on labour market information sharing, career counselling guidance, jobs registration offered by YES to youth</th>
															<td class="input"><input type="text" value="" name="row2column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row2column2" class="cinput number"> </th>
															<th class="disabled"><input type="hidden" value="" name="row2column3" class="cinput number"> </th>
															<td class="input"><input type="text" value="" name="row2column4" class="cinput number"></td>
															<td class="disabled"><input type="hidden" value="" name="row2column5" class="cinput number"> </td>
								    			<td class="disabled"><input type="hidden" value="" name="row2column6" class="cinput number"></td>										 		<td class="disabled"><input type="hidden" value="" name="row2column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row2column8" class="cinput number"></td>			 
															<td  class="disabled">
																<input type="hidden" value="" name="row2column9" class="cinput number">																			
															</td>
													  <td class="input">
															<select name="row2column10" class="cinput number" value="">
															<option >Select Target Group</option>
															<?php foreach ($targetgrp as $tdata){
																echo '<option value="'.$tdata['id'].'">'.$tdata['name'].'</option>';
															} ?>
															</select>
															</td>				
						    		</tr>
												
												
												<tr>										
								    			<th>N. of government officials and experts trained on basic career guidance and counselling</th>
															<td><input type="text" value="" name="row3column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row3column2" class="cinput number"></th>
															<th class="disabled"><input type="hidden" value="" name="row3column3" class="cinput number"></th>
															<td><input type="text" value="" name="row3column4" class="cinput number"></td>
															<td><input type="text" value="" name="row3column5" class="cinput number"></td>
								    			<td><input type="text" value="" name="row3column6" class="cinput number"></td>																			
												 		<td class="disabled"><input type="hidden" value="" name="row3column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row3column8" class="cinput number"></td>			 
															<td class="disabled"><input type="hidden" value="" name="row3column9" class="cinput number"></td>
													  <td class="disabled"><input type="hidden" value="" name="row3column10" class="cinput number"></td>				
						    		</tr>
												
													<tr>										
								    			<th>N of youth availing labour market information, including access to vacancies and employment referral services.</th>
															<th><input type="text" value="" name="row4column1" class="cinput number"> </th>
															<td class="disabled"><input type="hidden" value="" name="row4column2" class="cinput number"></td>
															<td class="disabled"><input type="hidden" value="" name="row4column3" class="cinput number"></td>
															<td><input type="text" value="" name="row4column4" class="cinput number"></td>
															<td ><input type="text" value="" name="row4column5" class="cinput number"></td>
								    			<td><input type="text" value="" name="row4column6" class="cinput number"></td>																			
												 		<td><input type="text" value="" name="row4column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row4column8" class="cinput number"></td>			 
															  <td class="input">
															<select name="row4column9" class="cinput number" value="">
															<option >Select Value Chain</option>
															<?php foreach ($valuechain_master as $vdata){
																echo '<option value="'.$vdata['id'].'">'.$vdata['name'].'</option>';
															} ?>
															</select>
															</td>				
													  	  <td class="input">
															<select name="row4column10" class="cinput number" value="">
															<option >Select Target Group</option>
															<?php foreach ($targetgrp as $tdata){
																echo '<option value="'.$tdata['id'].'">'.$tdata['name'].'</option>';
															} ?>
															</select>
															</td>				
						    		</tr>
												
														<tr>										
								    			<th>N.of men and women graduates and unemployed youth supported through career guidance services</th>
															<td><input type="text" value="" name="row5column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row5column2" class="cinput number"></th>
															<th class="disabled"><input type="hidden" value="" name="row4column3" class="cinput number"></th>
															<td><input type="text" value="" name="row5column4" class="cinput number"></td>
															<td><input type="text" value="" name="row5column5" class="cinput number"></td>
								    			<td><input type="text" value="" name="row5column6" class="cinput number"></td>																			
												 		<td><input type="text" value="" name="row5column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row5column8" class="cinput number"></td>			 
															<td class="disabled">
														 <input type="hidden" name="row5column9" class="cinput number">												
															</td>				
													  	  <td class="input">
															<select name="row5column10" class="cinput number" value="">
															<option >Select Target Group</option>
															<?php foreach ($targetgrp as $tdata){
																echo '<option value="'.$tdata['id'].'">'.$tdata['name'].'</option>';
															} ?>
															</select>
															</td>				
						    		</tr>
												
												
												
												
														<tr>										
								    			<th>N. of fresh graduates and unemployed Youth placed in decent jobs</th>
															<td><input type="text" value="" name="row6column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row6column2" class="cinput number"></th>
															<th class="disabled"><input type="hidden" value="" name="row6column3" class="cinput number"></th>
															<td><input type="text" value="" name="row6column4" class="cinput number"></td>
															<td ><input type="text" value="" name="row6column5" class="cinput number"></td>
								    			<td><input type="text" value="" name="row6column6" class="cinput number"></td>																			
												 		<td><input type="text" value="" name="row6column7" class="cinput number"></td>
								    			<td><input type="text" value="" name="row6column8" class="cinput number"></td>			 
															<td>
																		<select name="row6column9" class="cinput number" value="">
															<option >Select Value Chain</option>
													<?php foreach ($valuechain_master as $vdata){
																echo '<option value="'.$vdata['id'].'">'.$vdata['name'].'</option>';
															} ?>
															</select>
																				
															</td>				
													  <td class="input">
															<select name="row6column10" class="cinput number" value="">
															<option >Select Target Group</option>
															<?php foreach ($targetgrp as $tdata){
																echo '<option value="'.$tdata['id'].'">'.$tdata['name'].'</option>';
															} ?>
															</select>
															</td>				
						    		</tr>
												
												
												
												<tr>										
								    			<th>N. of vacancies registered</th>
															<td><input type="text" value="" name="row7column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row7column2" class="cinput number"></th>
															<th class="disabled"><input type="hidden" value="" name="row7column3" class="cinput number"></th>
															<td><input type="text" value="" name="row7column4" class="cinput number"></td>
															<td class="disabled"><input type="hidden" value="" name="row7column5" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row7column6" class="cinput number"></td>																			
												 		<td class="disabled"><input type="hidden" value="" name="row7column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row7column8" class="cinput number"></td>			 
															<td>
																		<select name="row7column9" class="cinput number" value="">
															<option >Select Value Chain</option>
														<?php foreach ($valuechain_master as $vdata){
																echo '<option value="'.$vdata['id'].'">'.$vdata['name'].'</option>';
															} ?>
															</select>
																				
															</td>				
													  <td class="input">
															<select name="row7column10" class="cinput number" value="">
															<option >Select Target Group</option>
															<?php foreach ($targetgrp as $tdata){
																echo '<option value="'.$tdata['id'].'">'.$tdata['name'].'</option>';
															} ?>
															</select>
															</td>				
						    		</tr>
												
												  <tr>										
								    			<th>N. of YES centre partnerships with employers and other service providers </th>
															<td><input type="text" value="" name="row8column1" class="cinput number"> </td>
															<th class="disabled"><input type="hidden" value="" name="row8column2" class="cinput number"></th>
															<th class="disabled"><input type="hidden" value="" name="row8column3" class="cinput number"></th>
															<td><input type="text" value="" name="row8column4" class="cinput number"></td>
															<td class="disabled"><input type="hidden" value="" name="row8column5" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row8column6" class="cinput number"></td>																			
											   	<td class="disabled"><input type="hidden" value="" name="row8column7" class="cinput number"></td>
								    			<td class="disabled"><input type="hidden" value="" name="row8column8" class="cinput number"></td>			 
															<td>
													 	<select name="row8column9" class="cinput number" value="">
															<option >Select Value Chain</option>
													<?php foreach ($valuechain_master as $vdata){
																echo '<option value="'.$vdata['id'].'">'.$vdata['name'].'</option>';
															} ?>
															</select>
																				
															</td>				
													  <td class="disabled">
															<input type="hidden" value="" name="row8column10" class="cinput number">
															</td>				
						    		</tr>
												
								   </tbody>
								</table>
									
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
				
