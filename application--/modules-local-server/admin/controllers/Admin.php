<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	 public function __construct()
    {
        parent::__construct();
	 
			$this->load->dbforge();
			$this->load->database();
			$this->load->helper('form');
			$this->load->library('session');
			$this->load->helper('url');
			$this->load->library('upload');
			$this->load->library('commonview');
			$this->load->model('Adminmodel');
			$this->load->model('function/Allfunction');
			//$this->load->helper('funcus');
    }
	public function index()
	{
		  if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
			 redirect(base_url().'custom-dashboard');
	  
		  }
			else
			{
				$data['title']='Admin Login';
				$template='admin-login';
				$this->load->view('admintemplate/login-reghead');
				$this->load->view($template);
					$this->load->view('admintemplate/footer');

				// $this->commonview->header_and_footer_login($template,$data);
		   // $this->commonview->header_and_footer_dash($template,$data);   
								}
	
	}
		function chklogin()
	{
		$msg='Try Latter';
	   if(count($this->input->post())>0){ 
	       $msg = $this->Adminmodel->logincheck(); 
	   	   print_r(  $msg );
              if((int)$msg>0){ 
                  redirect(base_url().'userbuy/'.getid($msg) );
			   }
			 }
		
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {		
		      
		      redirect(base_url().'custom-dashboard');
		      
		  }
			
			  else{
				 $this->session->set_flashdata('error', $msg);
				// die;
				redirect(base_url().'admin');
			  }
		      
	//}		
			
	}
	
	
	
	
	
	function dashboard()
	{
		if($this->session->userdata('username')!="" || $this->session->userdata('username')!=null)
		  {
		 
			$data['title']='Dashboard';
			 $template='dashboard';
			$this->commonview->header_and_footer_dash($template,$data);
		  }
		  else{
			     $data['title']='Admin Login';
				redirect(base_url().'admin');
		  }
		
	}
	
	
	
	public function logout()
	     {
	     try{
			$this->session->sess_destroy();
			redirect(base_url().'admin');
           }
          catch (Exception $e) {
                 redirect(base_url().'admin');
           }
      }
	  
	

} 