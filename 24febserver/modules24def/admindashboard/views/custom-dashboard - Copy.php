	<!-- MAIN CONTENT -->

	<div id="content">



		<div class="row">

			<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">

				<h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i> Dashboard <span>> My Dashboard</span></h1>

			</div>

			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">

				<ul id="sparks" class="">

					<li class="sparks-info">

						<div class="sparkline txt-color-blue hidden-mobile hidden-md hidden-sm">

							1300, 1877, 2500, 2577, 2000, 2100, 3000, 2700, 3631, 2471, 2700, 3631, 2471

						</div>

					</li>

					<li class="sparks-info">

	
     <div class="sparkline txt-color-purple hidden-mobile hidden-md hidden-sm">

							110,150,300,130,400,240,220,310,220,300, 270, 210

						</div>

					</li>

					<li class="sparks-info">

						<div class="sparkline txt-color-greenDark hidden-mobile hidden-md hidden-sm">

							110,150,300,130,400,240,220,310,220,300, 270, 210

						</div>

					</li>

				</ul>

			</div>

		</div>
		<div class="row">
		<form action="" method="post">
		   <div class="col-md-3">
					<label> Entry To Since Date  </label>
					       <div class="form-group">
												<?php 
												if(isset($_POST['monthfil'])){
												$todayMonth=	date("M Y",strtotime($_POST['monthfil']));
												}
												else{
													$todayMonth=date("M Y");
												}
												?>
                <div class="input-group date" id="datetimepicker2">
                  <input type="text" placeholder="Select Month" name="monthfil" value="<?php echo $todayMonth; ?>" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                </div>
            </div>
					</div>
	   
				<div class="col-md-3">
						<label style="visibility:hidden"> Entry To Since Date  </label>
          <div class="form-group">
										 <input type="submit" class="form-control" name="submit"> 
										</div>	  
			</div>			</form>
		
		</div>

		<div class="row">


<div class="col-md-6 col-xs-12 col-sm-6">



<script src="https://code.highcharts.com/highcharts.js"></script>

<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script src="https://code.highcharts.com/modules/accessibility.js"></script>



<figure class="highcharts-figure">

    <div id="container"></div>

				

				

				<style>

				.highcharts-figure, .highcharts-data-table table {

    min-width: 310px; 

    max-width: 800px;

    margin: 1em auto;

}



#container {

    height: 400px;

}



.highcharts-data-table table {

	font-family: Verdana, sans-serif;

	border-collapse: collapse;

	border: 1px solid #EBEBEB;

	margin: 10px auto;

	text-align: center;

	width: 100%;

	max-width: 500px;

}

.highcharts-data-table caption {

    padding: 1em 0;

    font-size: 1.2em;

    color: #555;

}

.highcharts-data-table th {

	font-weight: 600;

    padding: 0.5em;

}

.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {

    padding: 0.5em;

}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {

    background: #f8f8f8;

}

.highcharts-data-table tr:hover {

    background: #f1f7ff;

}


				</style>
<?php

// echo '<pre>';
$fem=$male=$ch=$tot='';
// print_r($chainwisegraph);
foreach ($chainwisegraph as $key) {
	$fem .= $key['Female'].",";
	if($key['male']){$male .= $key['male'].",";}else{$male .= "0,";}
	$ch .= "'".$key['value_chain']."',";
	$tot .= $key['total'].",";
}
$fem = rtrim($fem, ',');
$male = rtrim($male, ',');
$tot = rtrim($tot, ',');
$ch = rtrim($ch, ',');
// echo $male."</br>".$fem."</br>".$tot."</br>".$ch;
?>

				<script>

				Highcharts.chart('container', {

    chart: {

        type: 'column'

    },

    title: {

        text: 'Monthly Average '

    },

    subtitle: {

        text: ''

    },

    xAxis: {

        categories: [

            <?php echo $ch; ?>,

            'Total'

												],

        crosshair: true

    },

    yAxis: {

        min: 0,

        title: {

            text: 'Total'

        }

    },

    tooltip: {

        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',

        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +

            '<td style="padding:0"><b>{point.y:1f}</b></td></tr>',

        footerFormat: '</table>',

        shared: true,

        useHTML: true

    },

    plotOptions: {

        column: {

            pointPadding: 0.2,

            borderWidth: 0

        }

    },

    series: [{

        name: 'Male',

        data: [<?php echo $male; ?>]



    }, {

        name: 'Female',

        data: [<?php echo $fem; ?>]



    }, {

        name: 'Total',

        data: [<?php echo $tot; ?>]



    }]

});

				</script>

				

</div>



</div>


<!--   -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.es.min.js"></script>
<script >

$('#datetimepicker2').datepicker({
    autoclose: true,
				    changeMonth: true,
        changeYear: true,
    format: 'MM yyyy'
});

	 // $('#datetimepicker2').datepicker({
			// autoclose: true,
			// format : 'MM yyyy',
			// changeMonth: true,
   // changeYear: true,
			// showButtonPanel: true,
			// prevText : '<i class="fa fa-chevron-left"></i>',
			// nextText : '<i class="fa fa-chevron-right"></i>',
			// onSelect : function(selectedDate) {
				// $('#startdate').datepicker('option', 'maxDate', selectedDate);
			// }
		// });


</script>

