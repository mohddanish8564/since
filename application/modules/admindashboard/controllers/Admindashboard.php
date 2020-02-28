<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admindashboard extends CI_Controller {

	 public function __construct()
    {
        parent::__construct();
	 
			$this->load->dbforge();
			$this->load->database();
			$this->load->helper('form');
			$this->load->library('session');
			$this->load->helper('url');
			$this->load->helper('funcus_helper');			
			$this->load->library('upload');
			$this->load->library('commonview');		
			$this->load->model('function/Allfunction');
	
    }
	
	
		
	function userProfile()
	{
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
			$data['title']='user-profile';		 
		    $template='userprofile';		
			
			  $pr= get_user_details($this->session->userdata('user_id'));
			   
			 $oder_arr= array( 'id' => "DESC" );
			 
		     $field_arry = array('dstatus' =>0,'status'=>1,'id'=>$pr['class']); 

			 
		     $data['allclass']= $this->Allfunction->getArrayOrderBy($field_get="*","tclass",$field_arry,$oder_arr);
			
			
	     	$this->commonview->header_and_footer_dash($template,$data);
			 
              
			 
		  }
		  
		  
		  
	}
	 
	 
 	 public function updateprofile()
	 {
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
			
			//echo	'<pre>';print_r($this->input->post());
				
					$fname=$this->input->post('fname');
					$lname=$this->input->post('lname');
				    $gender=$this->input->post('gender');
        			$dob=$this->input->post('dob');
					$address=$this->input->post('address');
					$email=$this->input->post('email');
	                $altemail=$this->input->post('altemail');
					$website=$this->input->post('website');	
	                $mobileNo=$this->input->post('mobileNo');
                    $whatsappNo=$this->input->post('whatsappNo');					
            						
				
					$ins=array(
					'firstname'=>$fname,
	
			        'lastname'=>$lname,
			        'gender'=>$gender,		
					'dob'=>$dob,
					'mobile_no'=>$mobileNo,
					'whatsapp_no'=>$whatsappNo,
					'email'=>$email,
					'altrnatemail'=>$altemail,
					'address'=>$address,
					'website'=>$website,				
					'post_date'=>date("y-m-d h:i:s")
					);
					

					
				//	print_r($ins);
				//	die;
				
				//		die;
	 $allsites= $this->Allfunction->tblUpdationByArray(array('id'=>$this->session->userdata('user_id')),$ins,'user_login');
			 $this->session->set_flashdata("sucess","Updated successfully");  

		 redirect(base_url().'user-profile');
									  			 
		  }
		    
    	}
	 
	 	 
	 
	 
	 
	 
	
	function dashboard()
	{
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
						
			$field_arry1 ='';
			$date=date("Y-m-d");
					      
											if(isset($_POST['monthfil']))
											{
											
											// print_r($_POST);
											// $month
											
										$todaymonth= date("Y-m-d",strtotime($_POST['monthfil']));


							//		print_r($todaymonth);
									
									
											}
											
											else{
												$todaymonth= date("Y-m-d");
											}
			
  $data['title']='User Dashboard';			
		 
		    $template='custom-dashboard';
						
						// $sql="SELECT sme.`value_chain`,
						// (SELECT count(bene1.sex) FROM `import_smecompanies` as sme1 inner join import_job_placement as job1 on job1.sme_or_cpmpany_id=sme1.enterprise_id inner join import_beneficiaries as bene1 on bene1.beneficiary_id=job1.beneficiary_id where bene1.sex='Male' and MONTH(bene1.entry_date_to_since)=MONTH('".$todaymonth."') and sme1.`value_chain`=sme.`value_chain` group by sme1.`value_chain`) as male,
					// (SELECT count(bene2.sex) FROM `import_smecompanies` as sme2 inner join import_job_placement as job2 on job2.sme_or_cpmpany_id=sme2.enterprise_id inner join import_beneficiaries as bene2 on bene2.beneficiary_id=job2.beneficiary_id where bene2.sex='Female' and MONTH(bene2.entry_date_to_since)=MONTH('".$todaymonth."') and sme2.`value_chain`=sme.`value_chain` group by sme2.`value_chain`) as Female,
// count(bene.sex) as total FROM `import_smecompanies` as sme inner join import_job_placement as job on job.sme_or_cpmpany_id=sme.enterprise_id inner join import_beneficiaries as bene on bene.beneficiary_id=job.beneficiary_id and MONTH(bene.entry_date_to_since)=MONTH('".$todaymonth."') group by sme.`value_chain`";
						//SME_Support_date
						
						$sql ="";
						
						// echo $sql;
						$data['chainwisegraph']= $this->Allfunction->runQueryGet($sql);
					
		
	     	$this->commonview->header_and_footer_dash($template,$data);
			 
			 }
			  else{
					 $data['title']='Admin Login';
					redirect(base_url().'admin');
			  }
		
	}
	
    
	
	
	
}


