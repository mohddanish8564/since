<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reports extends CI_Controller {

	 public function __construct()
    {
        parent::__construct();
	 
			$this->load->dbforge();
			$this->load->database();
			$this->load->helper('form');
			$this->load->library('session');
			$this->load->helper('url');
			$this->load->library('upload');
			$this->load->model('admin/Adminmodel');
			$this->load->library('email');
			$this->load->library('commonview'); 
			$this->load->helper('funcus');
			$this->load->model('function/Allfunction');
    }	

	function overall_objective_report()
	{
		//error_reporting(0);
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='overall_objective_report';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "and lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			   
						$data['title']='Overall Objective Report';

					// $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	
	
		/****************** Overall_Objective_Reportold End  **************/
	
			function overall_objective_reportold()
			{
			//error_reporting(0);
			if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
					{
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='overall_objective_reportold';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Overall Objective Report';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						$sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	
	/****************** end  **************/
	
	/* Expected  Outcomes  Reports ******/
	
	function expected_outcome1_report()
	{
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
					
								$field_arry1 ='';
								$date=date("Y-m-d");
								$template='expected_outcome1_report';
								$data['title']='Expected Outcomes Report 1';
									if(isset($_POST['monthfil']))
														{
							
      							$datexp=explode('-',$_POST['monthfil']);												
													$strt= str_replace('/', '-', $datexp[0]);
													$end= str_replace('/', '-', $datexp[1]);											
												 $startdate= date('Y-m-d', strtotime($strt));
											  $fromdate=date('Y-m-d', strtotime($end));											 
								
											}
											
											else{
												$startdate=date("Y-m-1");
												$lastday = date('t',strtotime($startdate));
											 $fromdate=date("Y-m-$lastday");											
											}

												if(isset($_POST['consortium'])){
												$cons = substr($_POST['consortium'],0, 5);
												
												if($_POST['consortium']!='all'){
													
													$where1 = "where lots_id='$cons'";	
											
												}
												else {
													$where1='';
												}
											}
											else{
												$where1='';
											}
			
       // $todaymonth='2018-09-08';			
					
        $sql2="SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						//exit;
						 $data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql3 = "SELECT lots_name,lots_id,region FROM `lots_master` GROUP BY `lots_id` ";
						 $data['consortiums']= $this->Allfunction->runQueryGet($sql3);

						
						
   

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	
	
	
	
		function expected_outcome2_report()
	{
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
					
								$field_arry1 ='';
								$date=date("Y-m-d");
								$template='expected_outcome2_report';
								$data['title']='Expected Outcomes 2 Report';
									if(isset($_POST['monthfil']))
														{
							
      							$datexp=explode('-',$_POST['monthfil']);												
													$strt= str_replace('/', '-', $datexp[0]);
													$end= str_replace('/', '-', $datexp[1]);											
												 $startdate= date('Y-m-d', strtotime($strt));
											  $fromdate=date('Y-m-d', strtotime($end));											 
								
											}
											
											else{
												$startdate=date("Y-m-1");
												$lastday = date('t',strtotime($startdate));
											 $fromdate=date("Y-m-$lastday");											
											}

												if(isset($_POST['consortium'])){
												$cons = substr($_POST['consortium'],0, 5);
												
												if($_POST['consortium']!='all'){
													
													$where1 = "where lots_id='$cons'";	
											
												}
												else {
													$where1='';
												}
											}
											else{
												$where1='';
											}
			
       // $todaymonth='2018-09-08';			
					
        $sql2="SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						//exit;
						 $data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql3 = "SELECT lots_name,lots_id,region FROM `lots_master` GROUP BY `lots_id` ";
						 $data['consortiums']= $this->Allfunction->runQueryGet($sql3);

						
						
   

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	



	function specific_objective_report()
	{
		//error_reporting(0);
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='specific_objective_report';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Specific Objective  Report';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						
						$sql3= "SELECT id,name FROM `quarter_master` where status=1 ";
						$data['quarters']= $this->Allfunction->runQueryGet($sql3);
						
						$sql4= "SELECT id,name FROM `year_master` where status=1 order by name";
						$data['years']= $this->Allfunction->runQueryGet($sql4);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
}
	
	
	
	
	/********* Report Er1 ************/
	
	function report_er1()
	{
		//error_reporting(0);
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='reporter1';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Report ER1';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						
						$sql3= "SELECT id,name FROM `quarter_master` where status=1 ";
						$data['quarters']= $this->Allfunction->runQueryGet($sql3);
						
						$sql4= "SELECT id,name FROM `year_master` where status=1 order by name";
						$data['years']= $this->Allfunction->runQueryGet($sql4);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
}

/********** End ER1 ********/


	
	/********* Report Er2 ************/
	
	function report_er2()
	{
	
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='reporter2';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Report ER1';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						
						$sql3= "SELECT id,name FROM `quarter_master` where status=1 ";
						$data['quarters']= $this->Allfunction->runQueryGet($sql3);
						
						$sql4= "SELECT id,name FROM `year_master` where status=1 order by name";
						$data['years']= $this->Allfunction->runQueryGet($sql4);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
}

/********** End ER2 ********/


/********* Report Summary Report ************/
	
	function report_summary_Report()
	{
		//error_reporting(0);
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='report_summary_report';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Summary Report';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						
						$sql3= "SELECT id,name FROM `quarter_master` where status=1 ";
						$data['quarters']= $this->Allfunction->runQueryGet($sql3);
						
						$sql4= "SELECT id,name FROM `year_master` where status=1 order by name";
						$data['years']= $this->Allfunction->runQueryGet($sql4);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
}



/****** duplicate summary report *****/


/********* Disaggregriate Report Summary Report ************/
	
	function disaggregriate_summary_Report()
	{
		//error_reporting(0);
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='dissagegriate_summary_report';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='Summary Report';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						
						$sql3= "SELECT id,name FROM `quarter_master` where status=1 ";
						$data['quarters']= $this->Allfunction->runQueryGet($sql3);
						
						$sql4= "SELECT id,name FROM `year_master` where status=1 order by name";
						$data['years']= $this->Allfunction->runQueryGet($sql4);

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
}




/********* Log Report ************/
	
	function log_report()
	{
	if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
					
								$field_arry1 ='';
								$date=date("Y-m-d");
								$template='log_report';
								$data['title']='Logs';
									if(isset($_POST['monthfil']))
														{
							
      							$datexp=explode('-',$_POST['monthfil']);												
													$strt= str_replace('/', '-', $datexp[0]);
													$end= str_replace('/', '-', $datexp[1]);											
												 $startdate= date('Y-m-d', strtotime($strt));
											  $fromdate=date('Y-m-d', strtotime($end));											 
								
											}
											
											else{
												$startdate=date("Y-m-1");
												$lastday = date('t',strtotime($startdate));
											 $fromdate=date("Y-m-$lastday");											
											}

												if(isset($_POST['consortium'])){
												$cons = substr($_POST['consortium'],0, 5);
												
												if($_POST['consortium']!='all'){
													
													$where1 = "where lots_id='$cons'";	
											
												}
												else {
													$where1='';
												}
											}
											else{
												$where1='';
											}
			
       // $todaymonth='2018-09-08';			
					
        $sql2="SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						//exit;
						 $data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						 $sql3 = "SELECT lots_name,lots_id,region FROM `lots_master` GROUP BY `lots_id` ";
						 $data['consortiums']= $this->Allfunction->runQueryGet($sql3);

						
						
   

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
		
}



	/****************** ER3 Entry Form  **************/
	
			function er3entryform()
			{
			//error_reporting(0);
			if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
					{
						
			$field_arry1 ='';
			$date=date("Y-m-d");
			$template='er3entry';
										

											if(isset($_POST['consortium'])){
												// $cons = substr($_POST['consortium'],0, 5);
															$cons =$_POST['consortium'];
												if($_POST['consortium']!='all'){
											   	$where1 = "where lots_id='$cons'";	
												// $where4 = "AND sme2.consortium='$cons'";	
												}
												else {
											    $where1='';
												}
											}
											else{
											$where1='';
											}

			
  $data['title']='ER 3 Entry Form';

  // $todaymonth='2018-09-08';			
		 

      $sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` $where1 GROUP BY `lots_id` ";
						$data['sqlregions']= $this->Allfunction->runQueryGet($sql2);
						
						
						$sql2 = "SELECT lots_name,lots_id,region FROM `lots_master` where status=1 GROUP BY `lots_id` ";
						$data['consortiums']= $this->Allfunction->runQueryGet($sql2);
						
						
						$sqltrgt = "SELECT name,id FROM `target_group` where status=1 ";
						$data['targetgrp']= $this->Allfunction->runQueryGet($sqltrgt);
						
						
						$sqlvaluechain = "SELECT name,id FROM `valuechain_master` where status=1 ";
						$data['valuechain_master']= $this->Allfunction->runQueryGet($sqlvaluechain);
						

	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	
	/****************** end  **************/


	
	
}
