<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Importdb extends CI_Controller {
var $table_beneficiary_trainings='xls_import_beneficiary_trainings';
var $table_beneficiary_trainings_bkp='xls_import_beneficiary_trainings_bkp';

var $table_beneficiaries='xls_import_beneficiaries';
var $table_beneficiaries_bkp='xls_import_beneficiaries_bkp';

var $table_job_placement='xls_import_job_placement';
var $table_job_placement_bkp='xls_import_job_placement_bkp';

var $table_oo_indicators12='xls_import_oo_indicators12';
var $table_oo_indicators12_bkp='xls_import_oo_indicators12_bkp';

var $table_oo_indicators34='xls_import_oo_indicators34';
var $table_oo_indicators34_bkp='xls_import_oo_indicators34_bkp';


var $table_pp='xls_import_pp';
var $table_pp_bkp='xls_import_pp_bkp';


var $table_smecompanies='xls_import_smecompanies';
var $table_smecompanies_bkp='xls_import_smecompanies_bkp';

var $table_sme_support='xls_import_sme_support';
var $table_sme_support_bkp='xls_import_sme_support_bkp';

var $table_tvet='xls_import_tvet';
var $table_tvet_bkp='xls_import_tvet_bkp';

var $table_tvet_training='xls_import_tvet_training';
var $table_tvet_training_bkp='xls_import_tvet_training_bkp';


var $table_xls_import_extra_indicators='xls_import_extra_indicators';
var $table_xls_import_extra_indicators_bkp='xls_import_extra_indicators_bkp';


var $table_valuechain_master='valuechain_master';



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
			$this->load->library('excel');
			require_once APPPATH.'third_party/PHPExcel.php';
        $this->excel = new PHPExcel(); 
    }
	function index()
	{
		if($this->session->userdata('username')!=null)
		  {				
		      $data['title']='Import Database';
			     $template='importdb';		 
				
		  	$this->commonview->header_and_footer_dash($template,$data);
			
			}else{
			redirect(base_url().'admin');
		  }
		
	}
	
		
	/******************Single XLS Upload ******************/
	
	function upload_single_xls()	{
	//	echo '<pre>';
									if(isset($_POST["csvsubmit"])){
										
				$file=$_FILES["uploadcsv"]["tmp_name"];
				$objPHPExcel = PHPExcel_IOFactory::load($file);
				$num=$objPHPExcel->getSheetCount() ;
				$sheetnames=$objPHPExcel->getSheetNames() ;
				$objWorksheet = $objPHPExcel->getActiveSheet();
				$highestRow = $objWorksheet->getHighestRow();
				$file_name = $_FILES["uploadcsv"]["name"];

		
			// echo '<pre>';
			// print_r($_FILES);
		
		 $mimes = array('xls','xlsx');			
   $checkext=explode('.',$file_name);
			
			if(in_array($checkext[1],$mimes)){
								   
											
											
					 $field_arry1=array('file_name'=>$file_name);
			   $checkfileexist=$this->Allfunction->getArray('count(*) as count','xls_import_beneficiaries',$field_arry1);
						$expchklot=explode('_',$file_name);
				//		print_r($expchklot);
									// $result = substr($file_name, 0, 4);
					 	$result=$expchklot[0];
									//die;
						$field_arry2=array('lots_name'=>$result,'status'=>1);
			   $checklot=$this->Allfunction->getArray('count(*) as count','lots_master',$field_arry2);

						// print_r($checklot);
					// print_r(	$checkfileexist);
						// die;
													if($checklot[0]['count']==0){
							 $msg="<div class='alert alert-danger fade in'>Lots Data Not Found .Please select another file  </div>";	
					    $this->session->set_flashdata('notify',$msg);			
						  	redirect(base_url().'import-database');
							
						}
						
						if($checkfileexist[0]['count']>0){
							  $msg="<div class='alert alert-danger fade in'>File Already Imported. Please select another  file </div>";	
					    $this->session->set_flashdata('notify',$msg);			
						  	redirect(base_url().'import-database');
							
						}
						

												
								
							}
							
							else{
					   $msg="<div class='alert alert-danger fade in'>Invalid File</div>";	
					   $this->session->set_flashdata('notify',$msg);			
								redirect(base_url().'import-database');
							}
		
		
					 // $field_arry1=array('id'=>$this->session->userdata('user_id'),'dstatus'=>0);
			 // $data['upass']=$this->Allfunction->getArray('*','user_login',$field_arry1);
	
         $_SESSION['summary']=array();
											for($ik=0; $ik<$num; $ik++){
												
														$sheet[$ik] = $objPHPExcel->getSheet($ik);											
														$sheetData= $sheet[$ik]->toArray(null, true, true, true);
																	if($ik==0){
																		$this->xls_import_beneficiary_trainings($sheetData,$file_name);
																	}
																		if($ik==1){
													
																		$this->xls_import_beneficiaries($sheetData,$file_name);
																	}		
																	
																	if($ik==2){
													
																		$this->xls_import_JobPlacement($sheetData,$file_name);
																	}	
																	
																	if($ik==3){
													
																		$this->xls_import_oo_indicators12($sheetData,$file_name);
																	}	
															

																if($ik==4){
													
																		$this->xls_import_oo_indicators34($sheetData,$file_name);
																	}	
																	
																if($ik==5){													
																		$this->xls_import_ppp($sheetData,$file_name);										
																	}

																if($ik==6){													
																			$this->xls_import_sme_support($sheetData,$file_name);															
																}						

																if($ik==7){													
																		$this->xls_import_tvet($sheetData,$file_name);															
																}					

																if($ik==8){													
																		$this->xls_import_smecompanies($sheetData,$file_name);															
																}				

																if($ik==9){													
																		$this->xls_import_tvet_training($sheetData,$file_name);															
																}																				
																
																	if($ik==10){													
																		$this->xls_import_extra_indicators($sheetData,$file_name);															
																}					
																
																	if($ik==11){													
																		$this->table_valuechain_master($sheetData,$file_name);															
																}					
																	
																	
																	
																	
															
												}
												// print_r($_SESSION['summary']);
												// die;
												
															 $this->session->set_flashdata('summary12',$_SESSION['summary']);			
																
														//		unset($_SESSION['summary']);

										echo '<script>location.href="'.base_url().'import-database'.'";</script>';
												
													//	redirect(base_url().'import-database');
												}
								
								else{
										redirect(base_url().'import-database');
								}


	}	
	
	
	
	/************* xls import functions *****************/
			
	/* import_beneficiary_trainings  */
		
		 function xls_import_beneficiary_trainings($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
					$bkptable=$this->table_beneficiary_trainings_bkp;
					$table=$this->table_beneficiary_trainings;
					$table_truncate=$this->table_beneficiary_trainings;
					if(count($getDataArray[1])==8){							
				
		   $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {
						 // echo $this->getNameFromNumber($row)	

		   	 // use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{						
		try {
			
							$rtData=array(
				   'beneficiary_id'=>strip_tags($getData[0]),			
					  'tvet_id'=>strip_tags($getData[1]),
       'training_module'=>strip_tags($getData[2]),
       'start_date'=>strip_tags(date("Y-m-d",strtotime($getData[3]))),	
							'end_date'=>strip_tags(date("Y-m-d",strtotime($getData[4]))),	
							'Certificate'=>strip_tags($getData[5]),	
							'Is_Training_completed'=>strip_tags($getData[6]),	
							'Region'=>strip_tags($getData[7]),	
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );	
							
				 $response=$this->Allfunction->insertDatas('1', $rtData,$table);


// print_r( $response);
// die;
				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
					}
					 catch (Exception $e) {
											
}
				
    }

$row++;																			
												
           }											
						
							
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							
							$_SESSION['summary'][]=$rtData1;
							
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
				$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
			
   $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
  $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');
												
															}
															
													else{
														
															$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 5</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												   // 	redirect(base_url().'import-database');
														
													}
													
					
		}

	
	
			
	/* import_beneficiaries  */
	
	 function xls_import_beneficiaries($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
								
					$bkptable=$this->table_beneficiaries_bkp;
					$table=$this->table_beneficiaries;
					$table_truncate=$this->table_beneficiaries;
					if(count($getDataArray[1])==12){							
			
		   $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {
					
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{						
		try {
			
							$rtData=array(
				   'beneficiary_id'=>strip_tags($getData[0]),			
					  'sex'=>strip_tags($getData[1]),
       'region'=>strip_tags($getData[2]),
       'entry_date_to_since'=>strip_tags(date("Y-m-d",strtotime($getData[3]))),	
							'target_group'=>strip_tags($getData[4]),	
							'value_chain'=>strip_tags($getData[5]),	
							'entry_point_income'=>strip_tags($getData[6]),	
							'endline_income'=>strip_tags($getData[7]),	
							'type_of_income'=>strip_tags($getData[8]),	
							'disabled'=>strip_tags($getData[9]),	
							'Employed'=>strip_tags($getData[10]),	
							'consortium'=>strip_tags($getData[11]),	
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );	
							
				$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
					}
					 catch (Exception $e) {
											
}
				
    }

$row++;																			
												
           }											
						
							
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							$_SESSION['summary'][]=$rtData1;
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
				$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
			
   $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
  $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 12</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}




/*** Job Placement ***/ 	
	 function xls_import_JobPlacement($getDataArray, $file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
					$bkptable=$this->table_job_placement_bkp;
					$table=$this->table_job_placement;
					$table_truncate=$this->table_job_placement;
					if(count($getDataArray[1])==9){							
				
		   $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {
					
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{						
		try {
			
								$rtData=array(
				   'beneficiary_id'=>strip_tags($getData[0]),			
					  'placement_type'=>strip_tags($getData[1]),
       'sme_or_cpmpany_id'=>strip_tags($getData[2]),	
							'wage'=>strip_tags($getData[3]),	
							'consortium'=>strip_tags($getData[4]),	
      	'EmploymentDate'=>date("Y-m-d",strtotime($getData[5])),
							'End_Date'=>date("Y-m-d",strtotime($getData[6])),							
							'Region'=>$getData[7],
							'cust_status	'=>$getData[8],		
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );								
		 
				$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
					}
					 catch (Exception $e) {
											
}
				
    }

$row++;																			
												
           }											
						
							
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
				$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
   $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
  $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 7</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
	
	
/*** xls_import_oo_indicators12***/ 

	
	 function xls_import_oo_indicators12($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_oo_indicators12_bkp;
				 	$table=$this->table_oo_indicators12;
			 	 $table_truncate=$this->table_oo_indicators12;
					if(count($getDataArray[1])==11){							
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {
					
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{						
		try {
			
								$rtData=array(
				   'region'=>strip_tags($getData[0]),			
					  'expr1001'=>strip_tags($getData[1]),
       'age_group'=>strip_tags($getData[2]),	
							'sex'=>strip_tags($getData[3]),	
							'irregular_migration'=>strip_tags($getData[4]),	
      	'propensity'=>strip_tags($getData[5]),
							'data_entry_point'=>strip_tags($getData[6]),	
							'Consortium'=>strip_tags($getData[7]),			
							'Is_overall'=>strip_tags($getData[8]),			
							'By_age'=>strip_tags($getData[9]),			
							'By_sex'=>strip_tags($getData[10]),										
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );								

				$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
					}
					 catch (Exception $e) {
											
}
				
    }

$row++;																			
												
           }											
						
							
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 10</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
	
	
	
	/*** xls_import_oo_indicators34 ***/ 

	
	 function xls_import_oo_indicators34($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_oo_indicators34_bkp;
				 	$table=$this->table_oo_indicators34;
			 	 $table_truncate=$this->table_oo_indicators34;
					if(count($getDataArray[1])==11){							
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {
					
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {		
							
							$rtData=array(
				   'region'=>strip_tags($getData[0]),			
					  'consortium'=>strip_tags($getData[1]),
      	'age_group'=>strip_tags($getData[2]),
							'sex'=>strip_tags($getData[3]),					
					  'Income_baseline'=>strip_tags($getData[4]),
      	'Income_Endline'=>strip_tags($getData[5]),
							'Unemployment_Base'=>strip_tags($getData[6]),					
					  'Unemployment_End'=>strip_tags($getData[7]),
      	'Is_overall'=>strip_tags($getData[8]),
							'By_age'=>strip_tags($getData[9]),			
							'By_sex'=>strip_tags($getData[10]),				
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
					}
					 catch (Exception $e) {
											
}
				
    }

$row++;																			
												
           }											
						
							
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 10</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
		
		
		
		/*** xls_import_ppp ***/ 
	
	 function xls_import_ppp($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_pp_bkp;
				 	$table=$this->table_pp;
			 	 $table_truncate=$this->table_pp;
						
					if(count($getDataArray[1])==5){							
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'value_Chain'=>strip_tags($getData[0]),			
					  'consortium'=>strip_tags($getData[1]),
       'agr_date'=>date("Y-m-d",strtotime($getData[2])),	
							'decent_work_principles'=>strip_tags($getData[3]),	
							'Region'=>strip_tags($getData[4]),										
							
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 4</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
		
		/*** xls_import_sme_support ***/ 
			
	 function xls_import_sme_support($getDataArray,$file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_sme_support_bkp;
				 	$table=$this->table_sme_support;
			 	 $table_truncate=$this->table_sme_support;
						
					if(count($getDataArray[1])==6){							
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'sme_name'=>strip_tags($getData[0]),			
					  'support_type'=>strip_tags($getData[1]),
       'dataentry_date'=>date("Y-m-d",strtotime($getData[2])),	
							'quarter'=>strip_tags($getData[3]),
							'Region'=>strip_tags($getData[4]),
							'consortium'=>strip_tags($getData[5]),			
					  'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>$table Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>CSV should have Columns 4</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
	
	
	
			
		/*** xls_import_tvet ***/ 
			
	 function xls_import_tvet($getDataArray, $file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_tvet_bkp;
				 	$table=$this->table_tvet;
			 	 $table_truncate=$this->table_tvet;
						
					if(count($getDataArray[1])==4){						
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'tvet_id'=>strip_tags($getData[0]),			
					  'tvet_name'=>strip_tags($getData[1]),
       'region'=>strip_tags($getData[2]),	
							'tvet_type'=>strip_tags($getData[3]),
						 'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>$table Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>CSV should have Columns 4</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
	
			/*** xls_import_smecompanies ***/ 
			
	 function xls_import_smecompanies($getDataArray, $file_name){
						// echo '<pre>';
						// print_R($getDataArray);
							
				 	$bkptable=$this->table_smecompanies_bkp;
				 	$table=$this->table_smecompanies;
			 	 $table_truncate=$this->table_smecompanies;
					if(count($getDataArray[1])==13){						
				
		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'enterprise_id'=>strip_tags($getData[0]),			
					  'name'=>strip_tags($getData[1]),
       'is_sme'=>strip_tags($getData[2]),	
							'region'=>strip_tags($getData[3]),
							'consortium'=>strip_tags($getData[4]),
							'since_supported'=>strip_tags($getData[5]),
							'value_chain'=>strip_tags($getData[6]),
							'end_line_capacity_level'=>strip_tags($getData[7]),
							'entry_point_capacity_level'=>strip_tags($getData[8]),
							'agr_decent_work_principle'=>strip_tags($getData[9]),
							'emp_no_entry_point'=>strip_tags($getData[10]),
							'emp_no_end_line'=>strip_tags($getData[11]),
							'entry_point_date'=>date("Y-m-d",strtotime($getData[12])),
							'status'=>1,
					  'postdate'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

// print_r($response);
// die;
				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 4</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}
													
					
		}
		
		
		
		/*** xls_import_tvet_training ***/ 
			
	 function xls_import_tvet_training($getDataArray, $file_name){
						 // echo '<pre>';
						// print_r($getDataArray);
					
							// echo $getDataArray[1];
							
				
				 	$bkptable=$this->table_tvet_training_bkp;
				 	$table=$this->table_tvet_training;
			 	 $table_truncate=$this->table_tvet_training;
						
					if(count($getDataArray[1])==9){						

		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'woreda'=>strip_tags($getData[0]),			
					  'region'=>strip_tags($getData[1]),
       'entry_point_date'=>date("Y-m-d",strtotime($getData[2])),	
							'training_name'=>strip_tags($getData[3]),
							'training_type'=>strip_tags($getData[4]),
							'start_date'=>date("Y-m-d",strtotime($getData[5])),
							'end_date'=>date("Y-m-d",strtotime($getData[6])),
							'tvet_name'=>strip_tags($getData[7]),
							'valuechain'=>strip_tags($getData[8]),
							'status'=>1,
					  'post_date'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
											// print_r($Errmessage);
											// die;
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 9</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}												
					
								}
		
		
		
	
	
	/************ Extra Indicators ***********/
	
		/*** xls_import_tvet_training ***/ 
			
	 function xls_import_extra_indicators($getDataArray, $file_name){
			
	 	$bkptable=$this->table_xls_import_extra_indicators_bkp;
				 	$table=$this->table_xls_import_extra_indicators;
			 	 $table_truncate=$this->table_xls_import_extra_indicators;
						
					if(count($getDataArray[1])==6){						

		    $this->backuptable($bkptable,$table,$table_truncate);
						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'Years'=>strip_tags($getData[0]),			
					  'Quarter'=>strip_tags($getData[1]),
       'No_trainees'=>date("Y-m-d",strtotime($getData[2])),	
							'Sex'=>strip_tags($getData[3]),
							'No_multi_stackeholder'=>strip_tags($getData[4]),
							'Region'=>strip_tags($getData[5]),

							'status'=>1,
					  'post_date'=>date("Y-m-d"),
							'file_name'=>$file_name
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
											// print_r($Errmessage);
											// die;
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 6</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}												
					
								}
		
		
		
	
	
	/***********  Table Value chain Mater ********/
				
	 function table_valuechain_master($getDataArray, $file_name){

			 	$table=$this->table_valuechain_master;
					// print_r($getDataArray);
						// echo count($getDataArray[1]);
						// die;
					if(count($getDataArray[1])==2 || count($getDataArray[1])==4){						

						$row=1;
						$uploaded_rec=0;
						$notinsert=0;
						$totalRec=0;

        foreach($getDataArray as  $getData)
           {				
											
  					// use to re index the array 											
									$getData=	array_values($getData);	
			   	//			print_r($getData);
										if(	$row==1){
											
										}			
										
					else{
						
	   	try 
					  {	
							
							$rtData=array(
				   'name'=>strip_tags($getData[0]),			
					  'region'=>strip_tags($getData[1]),
							'status'=>1
					  );		
							
							$response=$this->Allfunction->insertDatas('1', $rtData,$table);

				if($response['success']!==0){		
						$uploaded_rec++;			
						}			
						
							else{				
							$Errmessage[]=$response['msg'];				
									$notinsert++;				
						}			
				
								}
									catch (Exception $e) {
														
			}
							
							}

			$row++;					
           }			
											
											// print_r($Errmessage);
											// die;
											
					$rtData1=array(
				   'table_name'=>$table,			
					  'uploaded_rec'=>$uploaded_rec,'file_name'=>$file_name,
       'total_records'=>strip_tags($row-1),
					  'date'=>date("Y-m-d")
					  );								
							if(count($Errmessage)>0){
								$this->session->set_flashdata('errUpload', implode(' ,',$Errmessage));			
							}
							
			  	$response=$this->Allfunction->insertDatas('1', $rtData1,'log');			
					$_SESSION['summary'][]=$rtData1;
      $msg="<div class='alert alert-success fade in'>Import Successfully</div>";	
			 $this->session->set_flashdata('notify', $msg);			
     $this->session->set_flashdata('updoadedinfo',$rtData1);		
			//redirect(base_url().'import-database');												
															}
															
													else{
														
																	$msg="<div class='alert alert-danger fade in'>$table CSV should have Columns 2</div>";														
															  $this->session->set_flashdata('notify', $msg);											
												  //  	redirect(base_url().'import-database');														
													}												
					
								}
		
		
		
	
	
	
	/********* Backup Table *********/
		
	function backuptable($bkptable,$table,$table_truncate){
	
			$sqlbkp="INSERT $bkptable SELECT *,CURRENT_TIMESTAMP() FROM $table";
					$response=$this->Allfunction->customQuery($sqlbkp);
					//truncate table 
					if($response==1){
					$sqltruncate="TRUNCATE TABLE $table_truncate";
					$restrunc=$this->Allfunction->customQuery($sqltruncate);
					}
	}

}
