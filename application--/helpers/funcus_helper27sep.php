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

		$dd= "ORD0". $newnos."ED";

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
		 return '<span class="text-blue">Acivated</span>';
	 }
	 else if($sid==0){
		 return '<span class="text-info">Deactivated</span>';
	 }
	
	 else{
		 return 'Cancelled';
	 }
   }
}


////////////////////////////////



if ( ! function_exists('front_page_mem_save')){		
   function front_page_mem_save($ins ,$insId,$url)
   {
 $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
			
			
 if($insId!=''){    
       $tarr = array('dstatus'=>0);
		  $getPayGateway= $ci->Allfunction->getArray('*','tpay_gateway', $tarr);           	
$MrchntId = $getPayGateway[0]['merchant'];
$MrchntName = $getPayGateway[0]['name'];
//echo '<pre>';	print_r($getPayGateway);die;	
  $data['Merchant_Id'] =$MrchntId;
  $data['Redirect_Url'] = base_url().$url ;
  $data['Order_Id']=$insId;
  $data['WorkingKey'] = "xfe406bnldmag83adb"  ;
  $data['Amount']=$ins['amt'];  
  $data['name']=$ins['name'];
  $data['city']=$ins['city'];
  $data['postal']=209081;
  $data['country']=$ins['country'];
  $data['state']=$ins['state'];$data['uri']=$ins['uri'];  
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
   
//if ( ! function_exists('ccavenueresponse')){		

   // function ccavenueresponse($table,$red,$aaid)
   // {
   // try
        // {
		
		  // //get main CodeIgniter object
       // $ci =& get_instance();
       
       // //load databse library
       // $ci->load->database();
       
     
			
 // $WorkingKey = "xfe406bnldmag83adb" ; 
 // $Merchant_Id= @$_REQUEST['Merchant_Id'];
 // $Amount= @$_REQUEST['Amount'];
      // $Order_Id= @$_REQUEST['Order_Id'];
 // $Merchant_Param= @$_REQUEST['Merchant_Param'];
 // $Checksum= @$_REQUEST['Checksum'];
  // $AuthDesc=@$_REQUEST['AuthDesc'];
 // $Checksum =verifyChecksum($Merchant_Id, $Order_Id , $Amount,$AuthDesc,$Checksum,$WorkingKey);
 // $order_status=@$_REQUEST['order_status'];
 
  
 // // echo $order_status;
 // // print_r($_REQUEST);
 // // die;
 
 // if($Checksum=="true" && $AuthDesc=="Y")
         // {    
    // $status=1;
    // $paystatus='success';
	
	 // updatetrans($table, $Order_Id, $aaid);
	
   // }
   // else if($Checksum=="true" && $AuthDesc=="B")
         // {
    // $status=2;
	// $paystatus='canaceled';
   // }
   // else if($Checksum=="true" && $AuthDesc=="N")
         // {
    // $status=0;
    // $paystatus='pending';
   // }
   // else
        // {
			
      // echo "<br>Security Error. Illegal access detected";	  
	  
      // redirect('thank-you');
   
        // }		
    // // $upData=array(
      // // 'status'=>$status,
	  // // 'postdate'=>date("y-m-d h:i:s"),
      // // );
	  		
	         // $ordid=advnos($Order_Id);
	        
                	
					  
					  
					
					 
                    // $trans = $ci->Allfunction->insertDatas('1', $transData,'transactions');
	
       // $ci->session->set_flashdata("sucess","New Order Created with order id -#$ordid and your payment status is $paystatus  ");	    
	   // redirect(base_url().$red); 	  
  // }
   // catch (Exception $e)
     // {
                    // echo 'Caught exception: ',  $ci->$e->getMessage(), "\n";
           // }
   // }
//}
if ( ! function_exists('ccavenueresponse')){		
   function ccavenueresponse($table,$red,$aaid)
   {
   try{
		
	     //get main CodeIgniter object
			   $ci =& get_instance();
			   //load databse library
			   $ci->load->database();
		//echo '<pre>';	print_r($_REQUEST);die;		
		 $WorkingKey = "xfe406bnldmag83adb" ; 
		 $Merchant_Id= @$_REQUEST['Merchant_Id'];
		 $Amount= @$_REQUEST['Amount'];
		 $Order_Id= @$_REQUEST['Order_Id'];
		 $Merchant_Param= @$_REQUEST['Merchant_Param'];
		 $Checksum= @$_REQUEST['Checksum'];
		  $AuthDesc=@$_REQUEST['AuthDesc'];
		 $Checksum =verifyChecksum($Merchant_Id, $Order_Id , $Amount,$AuthDesc,$Checksum,$WorkingKey);
		 $order_status=@$_REQUEST['order_status'];
	
			 if($Checksum=="true" && $AuthDesc=="Y")
					 {    
				$status=1;
				$paystatus='success';
				
				 updatetrans($table, $Order_Id, $aaid);
				
			   }
			   else if($Checksum=="true" && $AuthDesc=="B")
					 {
				$status=2;
				$paystatus='canceled';
			   }
			   else if($Checksum=="true" && $AuthDesc=="N")
					 {
				$status=0;
				$paystatus='pending';
			   }
			   else{echo "<br>Security Error. Illegal access detected";	  				  //redirect('thank-you');
				   }		
     $transData=array(
					  'oid'=>$Order_Id,
					  'amt'=>$Amount,
					  'status'=>$paystatus,
					  'postdate'=>date("y-m-d h:i:s")
					  );
	         $ordid=advnos($Order_Id);
			$trans = $ci->Allfunction->insertDatas('1', $transData,'transactions');
			
			$ar['oid']=$Order_Id;	 $ar['paystatus']=$paystatus;	
			$ar['uri']=$Merchant_Param;
			 $ar['red']=$red; 			 $ar['er']=0; 	
	return $ar;
      //  $ci->session->set_flashdata("sucess","For Order with order id -#$ordid  this payment status is $paystatus  ");	    
	 //  redirect(base_url().$red); 	  
  }
   catch (Exception $e)
     {    $ar['uri']=''; $ar['er']=1; 	 $ar['msg'] = 'Caught exception: '.  $ci->$e->getMessage(). "\n";
					$ar['oid']=0;	 $ar['paystatus']='Error';	
			 $ar['red']=$red;	  return $ar;	
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
	    $CI->Allfunction->tblUpdationByArray(array($aid=>$id),array('pays'=>1,'status'=>1),$table);  
	 
			 return  1; 
	}   
}


if ( ! function_exists('mailTemp')) 
{
function mailTemp($msg,$name,$fb,$goo,$tw,$ins,$foot,$add,$logo,$yt)
	{  $color1='#4CAF50'; $color2='#28306c';
		//$this->load->library('captcha');

		$mailformate = '<div>
    <table  width="100%" style="background-color:#f7f7f7;border-collapse:collapse;padding:10px 0"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top">
                <table align="center" cellspacing="0" cellpadding="0" style="background-color:transparent;border-collapse:collapse;margin-left:auto;margin-right:auto;padding:30px 0;width:600px;padding-top:30px">
				<tbody>
				<tr>
				<td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table width="100%" style="background-color:white;border-collapse:collapse;padding:10px 0"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table  width="100%" style="background-color:transparent;border-collapse:collapse;border-bottom:5px solid '.$color2.';width:100%!important"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-top:15px;padding-bottom:15px;padding-left:15px">
                 <img src="'.base_url().$logo.'" alt="DM DEMO" title="DM DEMO"  style="max-width: 200px; max-height: 60px;"  ></td>
                 </tr></tbody></table>
				 <table width="100%" style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:31px;width:100%!important">
				 <tbody>
				 <tr>
				 <td style="padding:5px 10px;vertical-align:top;font-size:16px;font-family:Arial,Helvetica,sans-serif;padding-top:15px;padding-right:15px;padding-left:15px">
            
        </td>
    </tr></tbody>
	</table><table width="100%" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top;padding-right:15px;padding-left:15px">
      <table style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	  <td  style="padding:5px 10px;vertical-align:top;font-size:13px;font-family:Arial,Helvetica,sans-serif;padding-top:25px;padding-bottom:25px">
            </td>
        </tr></tbody></table><table style="background-color:transparent;border-collapse:collapse;border:1px solid #dddddd;margin:0 35px;width:500px;padding-bottom:25px"><tbody><tr>
		<td  style="padding:20px;line-height: 2em;vertical-align:top;">
                '.$msg.'
                </td>
        </tr></tbody></table><table  align="center" style="background-color:transparent;border-collapse:collapse;margin:0 auto;table-layout:fixed"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;text-align:center;padding-top:30px;padding-bottom:40px">
         </td>
        </tr></tbody></table><table width="100%"  style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:25px;width:100%!important"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;font-size:13px;text-align:center;font-family:Arial,Helvetica,sans-serif">
                More from <a href="'.base_url().'" style="    color: black;">'.$name.'</a>
            </td>
        </tr></tbody></table>
		
		</td>
                                            </tr></tbody></table></td>
                                </tr></tbody></table><table align="center" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
								<td  style="padding:5px 10px;vertical-align:top;text-align:center;font-family:Arial,Helvetica,sans-serif;color:#636464;font-size:10px;padding-top:10px;padding-bottom:25px">
                                                                                  
                                            <br>
                   <table><tr><td>'.$add.'</td></tr></table>   
				   <br>   
				   <table><tr><td><a href="'.$fb.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/fb.png" ></a></td><td><a href="'.$goo.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/google.png" ></a></td><td><a href="'.$tw.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/twitter.png" ></a></td><td><a href="'.$ins.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/instagram.png" ></a></td><td><a href="'.$yt.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/youtube.png" ></a></td></tr></table>              
                                   <br>       
				'.$foot.'<br>
				All Rights Reserved.

                                    </td>
                                </tr></tbody></table></td>
                    </tr></tbody></table></td>
        </tr></tbody></table></div>';
     return $mailformate;
	}
}

if ( ! function_exists('mailTempLan1')) 
{
function mailTempLan1($msg,$name,$fb,$goo,$tw,$ins,$foot,$add,$logo,$yt)
	{  $color1='#409cb7'; $color2='#28306c';
	  
		//$this->load->library('captcha');

		$mailformate = '<div>
    <table  width="100%" style="background-color:#f7f7f7;border-collapse:collapse;padding:10px 0"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top">
                <table align="center" cellspacing="0" cellpadding="0" style="background-color:transparent;border-collapse:collapse;margin-left:auto;margin-right:auto;padding:30px 0;width:600px;padding-top:30px">
				<tbody>
				<tr>
				<td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table width="100%" style="background-color:white;border-collapse:collapse;padding:10px 0"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table  width="100%" style="background-color:transparent;border-collapse:collapse;border-bottom:5px solid '.$color2.';width:100%!important"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-top:15px;padding-bottom:15px;padding-left:15px">
                 <img src="'.base_url().$logo.'" alt="DM DEMO" title="DM DEMO"  style="max-width: 200px; max-height: 60px;"  ></td>
                 </tr></tbody></table>
				 <table width="100%" style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:31px;width:100%!important">
				 <tbody>
				 <tr>
				 <td style="padding:5px 10px;vertical-align:top;font-size:16px;font-family:Arial,Helvetica,sans-serif;padding-top:15px;padding-right:15px;padding-left:15px">
            
        </td>
    </tr></tbody>
	</table><table width="100%" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top;padding-right:15px;padding-left:15px">
      <table style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	  <td  style="padding:5px 10px;vertical-align:top;font-size:13px;font-family:Arial,Helvetica,sans-serif;padding-top:25px;padding-bottom:25px">
            </td>
        </tr></tbody></table><table style="background-color:transparent;border-collapse:collapse;border:1px solid #dddddd;margin:0 35px;width:500px;padding-bottom:25px"><tbody><tr>
		<td  style="padding:20px;line-height: 2em;vertical-align:top;">
                '.$msg.'
                </td>
        </tr></tbody></table><table  align="center" style="background-color:transparent;border-collapse:collapse;margin:0 auto;table-layout:fixed"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;text-align:center;padding-top:30px;padding-bottom:40px">
         </td>
        </tr></tbody></table><table width="100%"  style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:25px;width:100%!important"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;font-size:13px;text-align:center;font-family:Arial,Helvetica,sans-serif">
                More from <a href="'.base_url().'" style="    color: black;">'.$name.'</a>
            </td>
        </tr></tbody></table>
		
		</td>
                                            </tr></tbody></table></td>
                                </tr></tbody></table><table align="center" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
								<td  style="padding:5px 10px;vertical-align:top;text-align:center;font-family:Arial,Helvetica,sans-serif;color:#636464;font-size:10px;padding-top:10px;padding-bottom:25px">
                                                                                  
                                            <br>
                   <table><tr><td>'.$add.'</td></tr></table>   
				   <br>   
				   <table><tr><td><a href="'.$fb.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/fb.png" ></a></td><td><a href="'.$goo.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/google.png" ></a></td><td><a href="'.$tw.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/twitter.png" ></a></td><td><a href="'.$ins.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/instagram.png" ></a></td><td><a href="'.$yt.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/youtube.png" ></a></td></tr></table>              
                                   <br>       
				'.$foot.'<br>
				All Rights Reserved.

                                    </td>
                                </tr></tbody></table></td>
                    </tr></tbody></table></td>
        </tr></tbody></table></div>';
     return $mailformate;
	}
}


if ( ! function_exists('mailTempLan2')) 
{
function mailTempLan2($msg,$name,$fb,$goo,$tw,$ins,$foot,$add,$logo,$yt)
	{  $color1='#409cb7'; $color2='#28306c';
	  
		//$this->load->library('captcha');

		$mailformate = '<div>
    <table  width="100%" style="background-color:#f7f7f7;border-collapse:collapse;padding:10px 0"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top">
                <table align="center" cellspacing="0" cellpadding="0" style="background-color:transparent;border-collapse:collapse;margin-left:auto;margin-right:auto;padding:30px 0;width:600px;padding-top:30px">
				<tbody>
				<tr>
				<td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table width="100%" style="background-color:white;border-collapse:collapse;padding:10px 0"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table  width="100%" style="background-color:transparent;border-collapse:collapse;border-bottom:5px solid '.$color2.';width:100%!important"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-top:15px;padding-bottom:15px;padding-left:15px">
                 <img src="'.base_url().$logo.'" alt="DM DEMO" title="DM DEMO"  style="max-width: 200px; max-height: 60px;" ></td>
                 </tr></tbody></table>
				 <table width="100%" style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:31px;width:100%!important">
				 <tbody>
				 <tr>
				 <td style="padding:5px 10px;vertical-align:top;font-size:16px;font-family:Arial,Helvetica,sans-serif;padding-top:15px;padding-right:15px;padding-left:15px">
            
        </td>
    </tr></tbody>
	</table><table width="100%" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top;padding-right:15px;padding-left:15px">
      <table style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	  <td  style="padding:5px 10px;vertical-align:top;font-size:13px;font-family:Arial,Helvetica,sans-serif;padding-top:25px;padding-bottom:25px">
            </td>
        </tr></tbody></table><table style="background-color:transparent;border-collapse:collapse;border:1px solid #dddddd;    width: 100%;padding-bottom:25px"><tbody><tr>
		<td  style="padding:20px;line-height: 2em;vertical-align:top;">
                '.$msg.'
                </td>
        </tr></tbody></table><table  align="center" style="background-color:transparent;border-collapse:collapse;margin:0 auto;table-layout:fixed"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;text-align:center;padding-top:30px;padding-bottom:40px">
         </td>
        </tr></tbody></table><table width="100%"  style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:25px;width:100%!important"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;font-size:13px;text-align:left;font-family:Arial,Helvetica,sans-serif">
                More from <a href="'.base_url().'" style="    color: black;">'.$name.'</a>
            </td>
        </tr></tbody></table>
		
		</td>
                                            </tr></tbody></table></td>
                                </tr></tbody></table><table align="left" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
								<td  style="padding:5px 10px;vertical-align:top;text-align:left;font-family:Arial,Helvetica,sans-serif;color:#636464;font-size:10px;padding-top:10px;padding-bottom:25px">
                                                                                  
                                            <br>
                   <table><tr><td>'.$add.'</td></tr></table>   
				   <br>   
				   <table><tr><td><a href="'.$fb.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/fb.png" ></a></td><td><a href="'.$goo.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/google.png" ></a></td><td><a href="'.$tw.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/twitter.png" ></a></td><td><a href="'.$ins.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/instagram.png" ></a></td><td><a href="'.$yt.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/youtube.png" ></a></td></tr></table>              
                                   <br>       
				'.$foot.'<br>
				All Rights Reserved.

                                    </td>
                                </tr></tbody></table></td>
                    </tr></tbody></table></td>
        </tr></tbody></table></div>';
     return $mailformate;
	}
}



if ( ! function_exists('mailTempLan3')) 
{
function mailTempLan3($msg,$name,$fb,$goo,$tw,$ins,$foot,$add,$logo,$yt)
	{  $color1='#4CAF50'; $color2='#28306c';
	  
		//$this->load->library('captcha');

		$mailformate = '<div>
    <table  width="100%" style="background-color:#f7f7f7;border-collapse:collapse;padding:10px 0"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top">
                <table align="center" cellspacing="0" cellpadding="0" style="background-color:transparent;border-collapse:collapse;margin-left:auto;margin-right:auto;padding:30px 0;width:600px;padding-top:30px">
				<tbody>
				<tr>
				<td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table width="100%" style="background-color:white;border-collapse:collapse;padding:10px 0"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-right:0;padding-left:0">
                 <table  width="100%" style="background-color:transparent;border-collapse:collapse;border-bottom:5px solid '.$color2.';width:100%!important"><tbody><tr>
				 <td  style="padding:5px 10px;vertical-align:top;padding-top:15px;padding-bottom:15px;padding-left:15px">
                 <img src="'.base_url().$logo.'" alt="DM DEMO" title="DM DEMO" style="max-width: 200px; max-height: 60px;" ></td>
                 </tr></tbody></table>
				 <table width="100%" style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:31px;width:100%!important">
				 <tbody>
				 <tr>
				 <td style="padding:5px 10px;vertical-align:top;font-size:16px;font-family:Arial,Helvetica,sans-serif;padding-top:15px;padding-right:15px;padding-left:15px">
            
        </td>
    </tr></tbody>
	</table><table width="100%" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	<td style="padding:5px 10px;vertical-align:top;padding-right:15px;padding-left:15px">
      <table style="background-color:transparent;border-collapse:collapse"><tbody><tr>
	  <td  style="padding:5px 10px;vertical-align:top;font-size:13px;font-family:Arial,Helvetica,sans-serif;padding-top:25px;padding-bottom:25px">
            </td>
        </tr></tbody></table><table style="background-color:transparent;border-collapse:collapse;border:1px solid #dddddd;    width: 100%;padding-bottom:25px"><tbody><tr>
		<td  style="padding:20px;line-height: 2em;vertical-align:top;">
                '.$msg.'
                </td>
        </tr></tbody></table><table  align="center" style="background-color:transparent;border-collapse:collapse;margin:0 auto;table-layout:fixed"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;text-align:center;padding-top:30px;padding-bottom:40px">
         </td>
        </tr></tbody></table><table width="100%"  style="background-color:'.$color1.';border-collapse:collapse;background-size:cover;border-bottom:0 none;border-top:1px solid white;color:white;margin:0;min-height:25px;width:100%!important"><tbody><tr>
		<td  style="padding:5px 10px;vertical-align:top;font-size:13px;text-align:left;font-family:Arial,Helvetica,sans-serif">
                More from <a href="'.base_url().'" style="    color: black;">'.$name.'</a>
            </td>
        </tr></tbody></table>
		
		</td>
                                            </tr></tbody></table></td>
                                </tr></tbody></table><table align="left" style="background-color:transparent;border-collapse:collapse"><tbody><tr>
								<td  style="padding:5px 10px;vertical-align:top;text-align:left;font-family:Arial,Helvetica,sans-serif;color:#636464;font-size:10px;padding-top:10px;padding-bottom:25px">
                                                                                  
                                            <br>
                   <table><tr><td>'.$add.'</td></tr></table>   
				   <br>   
				   <table><tr><td><a href="'.$fb.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/fb.png" ></a></td><td><a href="'.$goo.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/google.png" ></a></td><td><a href="'.$tw.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/twitter.png" ></a></td><td><a href="'.$ins.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/instagram.png" ></a></td><td><a href="'.$yt.'"><img width="30" height="30" src="'.base_url().'assets/admin/images/social/youtube.png" ></a></td></tr></table>              
                                   <br>       
				'.$foot.'<br>
				All Rights Reserved.

                                    </td>
                                </tr></tbody></table></td>
                    </tr></tbody></table></td>
        </tr></tbody></table></div>';
     return $mailformate;
	}
}



 ?>