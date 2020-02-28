
</div>
<!-- END MAIN PANEL -->

<!-- ==========================CONTENT ENDS HERE ========================== -->

<!-- PAGE FOOTER -->
<!-- PAGE FOOTER -->
<div class="page-footer">
	<div class="row">
	
		<div class="col-xs-12 col-sm-12 text-center">
			<span class="txt-color-white">Dataman<span class="hidden-xs"> - Central Database Management</span> © 2019-2020</span>
		</div>

	</div>
</div>
<!-- END PAGE FOOTER -->
<!-- END PAGE FOOTER -->



		<!-- IMPORTANT: APP CONFIG -->
		<script src="<?php echo ASSETS_URL; ?>/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="<?php echo ASSETS_URL; ?>/js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="<?php echo ASSETS_URL; ?>/js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="<?php echo ASSETS_URL; ?>/js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="<?php echo ASSETS_URL; ?>/js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->

		<!-- Demo purpose only -->
		<script src="<?php echo ASSETS_URL; ?>/js/demo.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="<?php echo ASSETS_URL; ?>/js/app.min.js"></script>		

		<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
		<!-- Voice command : plugin -->
		<script src="<?php echo ASSETS_URL; ?>/js/speech/voicecommand.min.js"></script>	

		<!-- SmartChat UI : plugin -->
		<script src="<?php echo ASSETS_URL; ?>/js/smart-chat-ui/smart.chat.ui.min.js"></script>
		<script src="<?php echo ASSETS_URL; ?>/js/smart-chat-ui/smart.chat.manager.min.js"></script>
			<script src="<?php echo ASSETS_URL; ?>/js/customdanjs.js"></script>	
		<script src="https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js"></script>

<!-- Include a polyfill for ES6 Promises (optional) for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill9/dist/polyfill.js"></script>

		<script type="text/javascript">
			// DO NOT REMOVE : GLOBAL FUNCTIONS!
			$(document).ready(function() {
				pageSetUp();
			})
		</script>


<script type="text/javascript" src="<?php echo ASSETS_URL; ?>/js/exporttable/xls.core.min.js"></script>
<script type="text/javascript" src="<?php echo ASSETS_URL; ?>/js/exporttable/Blob.min.js"></script>
<script type="text/javascript" src="<?php echo ASSETS_URL; ?>/js/exporttable/FileSaver.min.js"></script>
<script type="text/javascript" src="<?php echo ASSETS_URL; ?>/js/exporttable/tableexport.js"></script>

<script>
$("table").tableExport({formats: ["xls"],    });
//$("table").tableExport({formats: ["xlsx","xls", "csv", "txt"],    });
</script>


<script>

    var DefaultTable = document.getElementById('default-table');
    new TableExport(DefaultTable, {
        headers: true,                              // (Boolean), display table headers (th or td elements) in the <thead>, (default: true)
        footers: true,                              // (Boolean), display table footers (th or td elements) in the <tfoot>, (default: false)
        formats: ['xlsx', 'csv', 'txt'],            // (String[]), filetype(s) for the export, (default: ['xlsx', 'csv', 'txt'])
        filename: 'id',                             // (id, String), filename for the downloaded file, (default: 'id')
        bootstrap: false,                           // (Boolean), style buttons using bootstrap, (default: false)
        position: 'bottom',                         // (top, bottom), position of the caption element relative to table, (default: 'bottom')
        ignoreRows: null,                           // (Number, Number[]), row indices to exclude from the exported file(s) (default: null)
        ignoreCols: null,                           // (Number, Number[]), column indices to exclude from the exported file(s) (default: null)
        ignoreCSS: '.tableexport-ignore',           // (selector, selector[]), selector(s) to exclude cells from the exported file(s) (default: '.tableexport-ignore')
        emptyCSS: '.tableexport-empty',             // (selector, selector[]), selector(s) to replace cells with an empty string in the exported file(s) (default: '.tableexport-empty')
        trimWhitespace: true,                       // (Boolean), remove all leading/trailing newlines, spaces, and tabs from cell text in the exported file(s) (default: true)
        RTL: false,                                 // (Boolean), set direction of the worksheet to right-to-left (default: false)
        sheetname: 'id'                             // (id, String), sheet name for the exported spreadsheet, (default: 'id')
    });
    // **** jQuery **************************
    //    $(DefaultTable).tableExport({
    //        headers: true,
    //        footers: true,
    //        formats: ['xlsx', 'csv', 'txt'],
    //        filename: 'id',
    //        bootstrap: true,
    //        position: 'bottom',
    //        ignoreRows: null,
    //        ignoreCols: null,
    //        ignoreCSS: '.tableexport-ignore',
    //        emptyCSS: '.tableexport-empty',
    //        trimWhitespace: false,
    //        RTL: false,
    //        sheetname: 'id'
    //    });
    // **************************************

</script>

<?php 

//$this->load->view('mycustomjs');
?>



</body>
</html>
