<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usermaster extends CI_Controller {

	 public function __construct()
    {
        parent::__construct();
	 
			$this->load->dbforge();
			$this->load->database();
			$this->load->helper('form');
			$this->load->library('session');
			$this->load->helper('url');
			$this->load->helper('funcus');
			$this->load->library('upload');
			$this->load->library('email');
			$this->load->library('commonview'); 
			$this->load->model('function/Allfunction');
			is_user_loggedin();
    }
	function index()
	{		
 
		   	$data['title']='Create User';								
			   $template='createuser';		 
			   $data['roles']=$this->Allfunction->getArray('*','tuser_type',array());
				
			   $this->commonview->header_and_footer_dash($template,$data);
		
	}
		
		
		function insert_user()	{

			$rtData=array(
				   'firstname'=>strip_tags($this->input->post('firstname')),			
					  'lastname'=>strip_tags($this->input->post('lastname')),
       'gender'=>strip_tags($this->input->post('gender')),
       'email'=>strip_tags($this->input->post('email')),	
							'mobile_no'=>strip_tags($this->input->post('mobileNo')),		
							'role'=>strip_tags($this->input->post('role')),	
							'pass'=>md5(strip_tags($this->input->post('password'))),	
					  'status'=>1,
					  'post_date'=>date("Y-m-d")
					  );	
							
				$response=$this->Allfunction->insertDatas('1', $rtData,'user_login');
						if($response['success']!==0){		
						$msg="<div class='alert alert-success fade in'>User Created Successfully</div>";	
			   $this->session->set_flashdata('msg', $msg);				

						}
						
						else{
								$msg="<div class='alert alert-danger fade in'>".$response['msg']."</div>";	
			   $this->session->set_flashdata('msg', $msg);				
						
						}
								redirect(base_url().'create-user');
			
			
		}
		
		function userlist()	{
						$data['title']='User List';								
			   $template='userlist';		 
			   $data['roles']=$this->Allfunction->runQueryGet('SELECT *, CASE WHEN role = 1 THEN "Admin" ELSE "User" END as userrole from user_login');

			   $this->commonview->header_and_footer_dash($template,$data);
		}
		
		function changepassword()	{
												
							$changepass=md5(strip_tags($this->input->post('changepass')));
							$uid=$this->input->post('uid');
							$field_arry=array(
							'id'=>$uid
							);
							$up_data=array('pass'=>$changepass);
							$table='user_login';
							 $response=$this->Allfunction->tblUpdationByArray($field_arry,$up_data,$table);
								
							echo $response;
				}		
		
			function getuserdetails()	{
	
      	$uid=$this->input->post('uid');
						$response=get_user_details($uid);
						echo json_encode($response);
				}		
		
		
		
		function changestatus()	{		
							$uid=$this->input->post('uid');
							$field_arry=array(
							'id'=>$uid
							);
							$changepass=$this->input->post('sid');
							$up_data=array('status'=>$changepass);

							$table='user_login';
							 $response=$this->Allfunction->tblUpdationByArray($field_arry,$up_data,$table);
								
							echo $response;
				}		
				
				
				function changeprofilestatus()	{
					
					
							$uid=$this->input->post('hid');
							$field_arry=array(
							'id'=>$uid
							);
							$firstName=$this->input->post('firstName');
							$lastName=$this->input->post('lastName');
							$phoneno=$this->input->post('phoneno');
							$up_data=array(
							'firstname'=>$firstName,
							'lastname'=>$lastName,
							'mobile_no'=>$phoneno						
							);

							$table='user_login';
							 $response=$this->Allfunction->tblUpdationByArray($field_arry,$up_data,$table);
								
							 echo $response;
				}	
				
		
}
