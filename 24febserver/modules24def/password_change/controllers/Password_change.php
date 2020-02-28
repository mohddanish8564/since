<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Password_change extends CI_Controller {

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
	function index()
	{
		if($this->session->userdata('username')!=null)
		  {	
		      $data['title']='Password Change';
			$template='password_change';
			 
			 
			 $field_arry1=array('id'=>$this->session->userdata('user_id'),'dstatus'=>0);
			 $data['upass']=$this->Allfunction->getArray('*','user_login',$field_arry1);
			$this->commonview->header_and_footer_dash($template,$data);
			//print_r($data['empData']);die;
			}else{
			redirect(base_url().'admin');
		  }
		
	}
	function change_password_update()
	{
		if($this->session->userdata('username')!=null)
		  {	
		     $up_data= array(
			'pass' =>md5($this->input->post('chnge_pasword',true)),			
			 );
			
			 $field_arry=array('id'=>$this->session->userdata('user_id'));
		      $password_update= $this->Allfunction->tblUpdationByArray($field_arry,$up_data,'user_login');
			  if ($password_update)
			  {
				$this->session->set_flashdata('sucess', 'Password Updated Successfully');
				redirect(base_url().'change-password');
				}
			  else{
				  $this->session->set_flashdata('error', 'Some Error Occurred');
				redirect(base_url().'change-password');
				}
			//print_r($data['empData']);die;
			}else{
			redirect(base_url().'admin');
		  }
		
	}
function change_logo()
	{
		if($this->session->userdata('username')!=null)
		  {	
		      $data['title']='Logo Change';
			$template='logo_change';
			 $data['text1']='Add';
			 
			 $field_arry1=array('id'=>$this->session->userdata('user_id'));
			 $data['logoData']=$this->Allfunction->getArray('*','user_login',$field_arry1);
			$this->commonview->header_and_footer_dash($template,$data);
			//print_r($data['empData']);die;
			}else{
			redirect(base_url().'custom-dashboard');
		  }
		
	}
	function change_logo_update()
	{
		if($this->session->userdata('username')!=null)
		  {	
	  $nm1="logo"; $newfilename=""; $imgerror=''; 
			if(isset($_FILES[$nm1]) && $_FILES[$nm1]['name']!='')
	       {          $arChk= array('image/png','image/jpg', 'image/jpeg' );
		     if(   in_array(   strtolower($_FILES[$nm1]['type']) , $arChk  )   ) 
				  {    $imgerror='';   
					  if($_FILES[$nm1]['size']<1500000  ) 
				      {  $temp = explode(".", $_FILES[$nm1]["name"]);
				            $attach=  $newfilename = 'logoimg'.round(microtime(true)) . '.' . end($temp);
					      move_uploaded_file($_FILES[$nm1]['tmp_name'], './assets/web/images/'.$newfilename); 
					  }else{   $imgerror='<br> Also Image not upload due to ...image size Incorrect should be less than 1 MB';  } 
				  }else{ $imgerror='<br>Also Image not upload due to ...Image format Incorrect should be(png / jpg /jpeg )'; }
		    }else{ } 
	  
	  
		     $up_data= array(
			'img' =>'assets/web/images/'.$newfilename,			
			 );
			
			 $field_arry=array('id'=>$this->session->userdata('user_id'));
		      $password_update= $this->Allfunction->tblUpdationByArray($field_arry,$up_data,'emailvars');
			  if ($password_update)
			  {
				$this->session->set_flashdata('sucess', 'Logo Changed Successfully');
				redirect(base_url().'change-logo');
				}
			  else{
				  $this->session->set_flashdata('error', 'Some Error Occurred');
				redirect(base_url().'change-logo');
				}
			//print_r($data['empData']);die;
			}else{
			redirect(base_url().'custom-dashboard');
		  }
		
	}
}
