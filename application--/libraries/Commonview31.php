<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Commonview  {

	 var $CI;
    public function __construct($params = array())
    {
        $this->CI =& get_instance();

        $this->CI->load->helper('url');
        $this->CI->config->item('base_url');
        $this->CI->load->database();
       
    }

   function header_and_footer_login($template,$data)
    {
		//$this->CI->load->view('admintemplate/head',$data);
		//$this->CI->load->view('admintemplate/header',$data);
		 //$this->CI->load->view('admintemplate/sidebars',$data);
		// $this->CI->load->view('admintemplate/topnav',$data);
		$this->CI->load->view($template,$data);
		$this->CI->load->view('admintemplate/footer',$data);
		//$this->CI->load->view('admintemplate/foot',$data);
		

    }
	function header_and_footer_register($template,$data)
    
    
    {
		$this->CI->load->view('admintemplate/head',$data);
		//$this->load->view('admintemplate/topnav',$data);
		//$this->load->view('admintemplate/header',$data);
		//$this->load->view('admintemplate/sidebars',$data);
		
		$this->CI->load->view($template,$data);
		//$this->load->view('admintemplate/foot',$data);
		//$this->load->view('admintemplate/rightsidebar',$data);
		$this->CI->load->view('admintemplate/footer',$data);
		
    }
	
  function header_and_footer_dash($template,$data)
    {
		$this->CI->load->view('admintemplate/head',$data);
		//$this->CI->load->view('admintemplate/header',$data);
		 $this->CI->load->view('admintemplate/topnav',$data);
		 $this->CI->load->view('admintemplate/sidebars',$data);
		
		$this->CI->load->view($template,$data);
		$this->CI->load->view('admintemplate/footer',$data);
		//$this->CI->load->view('admintemplate/foot',$data);
		

    }
    
    
    // frontend theme
	
	function front_header_and_footer_dash($template,$data)
    {
		$this->CI->load->view('webtemplates/head',$data);
		//$this->CI->load->view('admintemplate/header',$data);
		 $this->CI->load->view('webtemplates/topnav');
		
		$this->CI->load->view($template,$data);
		$this->CI->load->view('webtemplates/footer',$data);
		

    }
    
}
