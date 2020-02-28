<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       // $CI =& get_instance();
       
       // //load databse library
       // $CI->load->database();



if ( ! function_exists('advnos'))

{

function advnos($INSid)

    {

		if($INSid!=''){  

			$newnos =100+ (int)$INSid;

		$dd= "DDH/". $newnos."A";

		}else{ $dd="None"; }

		return $dd;

    }



}






/*
if ( ! function_exists('bookamt')) 
{	function bookamt($id)
    {$oneDimy =  $ddt=array();   $sql1 = "SELECT id,lastpay as tot FROM `customerpayment` WHERE order_id='".$id."' ORDER BY id ASC LIMIT 0,1";
	//SELECT lastpay as tot  FROM `customerpayment` WHERE order_id='".$id."'; "; 
	  $CI =& get_instance();  $CI->load->model('function/Allfunction'); 
	  $ddt=  $CI->Allfunction->runQueryGet($sql1);  
	  if(isset($ddt) && count($ddt)>0){  $totId=$ddt[0]['tot'];  }else{  $totId=0;} 
			 return  $totId; 
	}   
}
*/



if ( ! function_exists('getid'))
{ function getid($oaid)
   { if($oaid>0){}else{ $oaid=1;}
	 return str_replace("==","", base64_encode($oaid.'|'.date('Y-m-d')));
								   
   }
}

if ( ! function_exists('setid'))
{ function setid($oaid)
   { if($oaid!=''){}else{ $oaid=1;}
   
      $idA= explode('|', base64_decode($oaid."==") );   
	  return  $id= $idA[0];
								   
   }
}



// danish
if ( ! function_exists('get_user_details')){
   function get_user_details($user_id){
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
       $query = $ci->db->get_where('user_login',array('id'=>$user_id
	   ));
       
       if($query->num_rows() > 0){
           $result = $query->row_array();
           return $result;
       }else{
           return false;
       }
   }
}




if ( ! function_exists('get_status')){
   function get_status($sid){
     if($sid==1){
		 return '<span class="text-blue">Active</span>';
	 }
	 else if($sid==0){
		 return '<span class="text-danger">Cancelled</span>';
	 }
	
	 else{
		 return 'Cancelled';
	 }
   }
}


////////////////////////////////



if ( ! function_exists('front_page_mem_save')){		
   function front_page_mem_save($ins ,$insId)
   {
 
					  
 if($insId!=''){    
                  	

  $data['Merchant_Id'] = "M_rks17500_17500" ;
  $data['Redirect_Url'] = base_url()."response" ;
  $data['Order_Id']=$insId;
  $data['WorkingKey'] = "xfe406bnldmag83adb"  ;
  $data['Amount']=$ins['amt'];  
  $data['name']=$ins['name'];
  $data['city']=$ins['city'];
  $data['postal']=209081;
  $data['country']=$ins['country'];
  $data['state']=$ins['state'];
  $data['Checksum'] =getCheckSum($data['Merchant_Id'],$data['Amount'],$data['Order_Id'] ,$data['Redirect_Url'],$data['WorkingKey']);
      
			  $CI = &get_instance();		
   // $CI->session->set_flashdata('sucess', 'Record Saved Successfully');
    $CI->load->view('adminorder/ccavenue_form',$data);
    
    
   }
   
   else{
	   
	   echo 'something went wrong';
   }
 
  
   }
}   
   
if ( ! function_exists('ccavenueresponse')){		

   function ccavenueresponse($table,$red)
   {
   try
        {
		
		  //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
     
			
 $WorkingKey = "xfe406bnldmag83adb" ; 
 $Merchant_Id= @$_REQUEST['Merchant_Id'];
 $Amount= @$_REQUEST['Amount'];
      $Order_Id= @$_REQUEST['Order_Id'];
 $Merchant_Param= @$_REQUEST['Merchant_Param'];
 $Checksum= @$_REQUEST['Checksum'];
  $AuthDesc=@$_REQUEST['AuthDesc'];
 $Checksum =verifyChecksum($Merchant_Id, $Order_Id , $Amount,$AuthDesc,$Checksum,$WorkingKey);
 $order_status=@$_REQUEST['order_status'];
 
  
 // echo $order_status;
 // print_r($_REQUEST);
 // die;
 
 if($Checksum=="true" && $AuthDesc=="Y")
         {    
    $status=1;
    $paystatus='success';
   }
   else if($Checksum=="true" && $AuthDesc=="B")
         {
    $status=2;
	$paystatus='canaceled';
   }
   else if($Checksum=="true" && $AuthDesc=="N")
         {
    $status=0;
    $paystatus='pending';
   }
   else
        {
			
      echo "<br>Security Error. Illegal access detected";	  
	  
      redirect('thank-you');
   
        }		
    $upData=array(
      'status'=>$status,
	  'postdate'=>date("y-m-d h:i:s"),
      );
		
	               $ordid=advnos($Order_Id);
	                 $transData=array(
					  'oid'=>$Order_Id,
					  'amt'=>$Amount,
					  'status'=>$paystatus,
					  'postdate'=>date("y-m-d h:i:s")
					  );
                    $trans = $ci->Allfunction->insertDatas('1', $transData,'transactions');
	
       $ci->session->set_flashdata("sucess","New Order Created with order id -#$ordid and your payment status is $paystatus  ");	    
	   redirect(base_url().'order-list'); 	  
  }
   catch (Exception $e)
     {
                    echo 'Caught exception: ',  $ci->$e->getMessage(), "\n";
           }
   }
}

   
   ///////////ccavenue function ////////////////////////
if ( ! function_exists('getchecksum')){		

function getchecksum($MerchantId,$Amount,$OrderId ,$URL,$WorkingKey)
{
 $str ="$MerchantId|$OrderId|$Amount|$URL|$WorkingKey";
 $adler = 1;
 $adler = adler32($adler,$str);
 return $adler;
}
}


if ( ! function_exists('verifychecksum')){		
function verifychecksum($MerchantId,$OrderId,$Amount,$AuthDesc,$CheckSum,$WorkingKey)
{
 $str = "$MerchantId|$OrderId|$Amount|$AuthDesc|$WorkingKey";
 $adler = 1;
 $adler = adler32($adler,$str);
 
 if($adler == $CheckSum)
  return "true" ;
 else
  return "false" ;
}
}


if ( ! function_exists('adler32')){		
function adler32($adler , $str)
{
 $BASE =  65521 ;

 $s1 = $adler & 0xffff ;
 $s2 = ($adler >> 16) & 0xffff;
 for($i = 0 ; $i < strlen($str) ; $i++)
 {
  $s1 = ($s1 + Ord($str[$i])) % $BASE ;
  $s2 = ($s2 + $s1) % $BASE ;
   //echo "s1 : $s1 <BR> s2 : $s2 <BR>";

 }
 return leftshift($s2 , 16) + $s1;
}
}


if ( ! function_exists('leftshift')){		
function leftshift($str , $num)
{

 $str = DecBin($str);

 for( $i = 0 ; $i < (64 - strlen($str)) ; $i++)
  $str = "0".$str ;

 for($i = 0 ; $i < $num ; $i++) 
 {
  $str = $str."0";
  $str = substr($str , 1 ) ;
  //echo "str : $str <BR>";
 }
 return cdec($str) ;
}
}


if ( ! function_exists('cdec')){		

function cdec($num)
{
 $dec=0;
 for ($n = 0 ; $n < strlen($num) ; $n++)
 {
    $temp = $num[$n] ;
    $dec =  $dec + $temp*pow(2 , strlen($num) - $n - 1);
 }

 return $dec;
}

}


if ( ! function_exists('updatetrans')) 
{	function updatetrans($table, $id, $aid)
    {            $oneDimy =  $ddt=array(); 
	  $CI =& get_instance();  $CI->load->model('function/Allfunction'); 
	    $CI->Allfunction->tblUpdationByArray(array($aid=>$id),$ins['pays']=1,$table);  
	 
			 return  1; 
	}   
}


 ?>