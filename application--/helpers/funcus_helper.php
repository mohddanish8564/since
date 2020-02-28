<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');


       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       // $CI =& get_instance();
       
       // //load databse library
       // $CI->load->database();



if ( ! function_exists('presentabsent')){
   function presentabsent($empcode,$day,$month,$year){
       //get main CodeIgniter object
	   
	  // echo date("Y-m-".$day);
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
       $query = $ci->db->get_where('attendence',
	   array(
	   'empcode'=>$empcode,
	   'Date(postdate)'=>date("".$year."-".$month."-".$day)
	   ));    
	   
       if($query->num_rows() > 0){
           $result ='<span class="label label-success"><b>P</b></span>';
           return $result;
       }else{
           return '<span class="label label-danger"><b>A</b></span>';
       }
   }
}


if ( ! function_exists('checktimebetween')){
	
   function checktimebetween($time0){
     // $current_time = "4:59 pm";
// $sunrise = "5:42 am";
// $sunset = "6:26 pm";
  
	  // echo date("Y-m-".$day);
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
    
	    $sql= "select * from tyming";
        $query = $ci->db->query($sql);
		$result=$query->row_array();
		// print_r($result);
		// echo $time0;
 $intime=date("h:i a",strtotime($result['intime']));
$outtime=date("h:i a",strtotime($result['outtime']));
$halftimefrom=date("h:i a",strtotime($result['halftimefrom']));
$halftimeto=date("h:i a",strtotime($result['halftimeto']));

$timeafterleave=date("h:i a",strtotime($result['timeafterleave']));
$latelogin=date("h:i a",strtotime($result['latelogin']));


 $utime0 = DateTime::createFromFormat('H:i a', $time0);
$uintime = DateTime::createFromFormat('H:i a', $intime);
$uouttime = DateTime::createFromFormat('H:i a', $outtime);
$uhalftimefrom = DateTime::createFromFormat('H:i a', $halftimefrom);
$uhalftimeto = DateTime::createFromFormat('H:i a', $halftimeto);
$utimeafterleave = DateTime::createFromFormat('H:i a', $timeafterleave);
$ulatelogin = DateTime::createFromFormat('H:i a', $latelogin);


// echo $time0.'<br>'.$intime.'<br>'.$outtime.'<br>'.$latelogin.'<br>'.$halftimefrom.'<br>'.$halftimeto.'<br>'.$timeafterleave.'<br>';
// die;

if ($utime0->format('Y-m-d H:i:s') >= $ulatelogin->format('Y-m-d H:i:s') && $utime0->format('Y-m-d H:i:s') <= $uhalftimefrom->format('Y-m-d H:i:s'))
{
  return '<span class="label label-info"><b>Late</b></span>';
}
else if($utime0->format('Y-m-d H:i:s') >= $uhalftimefrom->format('Y-m-d H:i:s') && $utime0->format('Y-m-d H:i:s') <= $uhalftimeto->format('Y-m-d H:i:s')){
	 return '<span class="label label-warning"><b>Halfday</b></span>';
}

else if($utime0->format('Y-m-d H:i:s') >= $utimeafterleave->format('Y-m-d H:i:s')){
	 return '<span class="label label-danger"><b>Leave</b></span>';
}
else {	
	return '';		
}
	
	
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


if ( ! function_exists('get_tiimediffinmnt')){
   
   function get_tiimediffinmnt($t1,$t2){

   
   	  
						  $loginTime = strtotime($t1);
// echo 'Login Time : '.date('H:i:s', $loginTime);
// echo '<hr>';

$loginout = strtotime($t2);
$diff = $loginout - $loginTime;
// echo 'Login Out Time : '.date('H:i:s', $loginout).'<br>';
// echo ($diff < 0)? 'Late!' : 'Right time!'; echo '<br>';
// //echo 'Time diff in sec: '.abs(gmdate("H",$diff));

$seconds = $diff;
$minutes = floor($seconds/60);
$secondsleft = $seconds%60;
if($minutes<10)
	$minutes = "0" . $minutes;
if($secondsleft<10)
	$secondsleft = "0" . $secondsleft;
return "$minutes minutes";
   
   
   
   }
}

if ( ! function_exists('findpercent')) 
{	function findpercent($x, $y)
    {  
				
			
			$percent = $x/$y;
			$percent_friendly = number_format( $percent * 100, 2 ) . '%';
			return 		$percent_friendly;
			
	}   
}

if ( ! function_exists('convert_perc')) 
{	function convert_perc($x)
    {  

			$percent_friendly = number_format( $x * 100, 2 ) . '%';
			return 		$percent_friendly;
			
	}   
}



if ( ! function_exists('is_user_loggedin')) 
{	function is_user_loggedin()
    {  
				 $CI = & get_instance();
     //or you can load library in the site helper also
     $CI->load->library('session');
			
					if($CI->session->userdata('username')!=null)
		  {		
			
				}
				else{
						redirect(base_url().'admin');
					
				}
			
			// $percent = $x/$y;
			// $percent_friendly = number_format( $percent * 100, 2 ) . '%';
			// return 		$percent_friendly;
			
	}   
}



// danish
if ( ! function_exists('findquaretrFormat')){
	
   function findquaretrFormat($alias,$year,$quarter){
			//	echo $alias;
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
       $query = $ci->db->get_where('quarter_master',array('status'=>1,'id'=>$quarter));
       
       if($query->num_rows() > 0){
           $result = $query->row_array();
											$FromMonth=$result['range_from'];
											$ToMonth=$result['range_to'];
											
											$lastday=date('t',strtotime("$year-$ToMonth-01"));											

										//	$result="and Date($alias) BETWEEN '$year-$FromMonth-01' and '$year-$ToMonth-$lastday'";
											$result="and Date($alias) <= '$year-$ToMonth-$lastday'";

											
           return $result;
       }else{
           return false;
       }
   }
			
}



// danish
if ( ! function_exists('findquaretrBetweenFormat')){
	
   function findquaretrBetweenFormat($alias,$year,$quarter){
			//	echo $alias;
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
       $query = $ci->db->get_where('quarter_master',array('status'=>1,'id'=>$quarter));
       
       if($query->num_rows() > 0){
           $result = $query->row_array();
											$FromMonth=$result['range_from'];
											$ToMonth=$result['range_to'];
											
											$lastday=date('t',strtotime("$year-$ToMonth-01"));											

											$result="and Date($alias) BETWEEN '$year-$FromMonth-01' and '$year-$ToMonth-$lastday'";
										//	$result="and Date($alias) <= '$year-$ToMonth-$lastday'";

											
           return $result;
       }else{
           return false;
       }
   }
			
}


if ( ! function_exists('get_region_by_lotid')){
   function get_region_by_lotid($lotid){
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
      //get data from database
       $query = $ci->db->get_where('lots_master',array('lots_id'=>$lotid));
       
       if($query->num_rows() > 0){
           $result = $query->row_array();
           return $result;
       }else{
           return false;
       }
   }
}



if ( ! function_exists('get_quarter')){
   function get_quarter($qid,$year){
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
      //get data from database
       $query = $ci->db->get_where('quarter_master',array('id'=>$qid));
       
       if($query->num_rows() > 0){
								  $result = $query->row_array();
											$FromMonth=$result['range_from'];
											$ToMonth=$result['range_to'];
											
											$lastday=date('t',strtotime("$year-$ToMonth-01"));			
											
											$lasquarterdate= date("d F Y",strtotime("$year-$ToMonth-$lastday"));
											
											
           $result =$lasquarterdate;
           return $result;
       }else{
           return false;
       }
   }
}



 ?>