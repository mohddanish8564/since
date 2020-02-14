<?php
 use Twilio\Rest\Client;
defined('BASEPATH') OR exit('No direct script access allowed');
class User extends CI_Controller
{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper('form');
        $this->load->library('session');
        $this->load->library('form_validation');
        $this->load->helper('url');       
        $this->load->model('UserModel');
	   $this->load->model('function/Allfunction');
	  
    }
    
   public function index()
    {
	   try{
             $this->load->view('signup');
			 	$this->load->view('user_template/mycustomjs');
           }
		 catch (Exception $e) {
           
           }
    }
   public function userDashboard()
    {
	 try{ 
         if ($this->session->userdata('username') != '') {
			$usrname=$this->session->userdata('username');
			$user_id=$this->session->userdata('user_id');
		    $sql="SELECT * FROM `nukash_membership_orders` as morder left join membership_levels as mlev on mlev.mid=morder.membership_id where morder.user_id='$user_id'";
			$sqlMembership="SELECT * FROM `membership_levels`";
			$sqlEarned="SELECT sum(`bonus`) as bonus FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=1";
		    $activeUser="SELECT count(*) as total FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=1";
		    $InactiveUser="SELECT count(*) as total FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=0";
			$data['mcheck']=$this->Allfunction->runQueryGet($sql);
			$data['membership']=$this->Allfunction->runQueryGet($sqlMembership);
			$data['sqlEarned']=$this->Allfunction->runQueryGet($sqlEarned);
			$data['activeUser']=$this->Allfunction->runQueryGet($activeUser);
			$data['InactiveUser']=$this->Allfunction->runQueryGet($InactiveUser);		  
            $this->load->view('user_template/header');
            $this->load->view('user_template/sidebarnavigation');
            $this->load->view('user_profile',$data);
            $this->load->view('user_template/footer');
            
			} else {
			    redirect(base_url().'login');
			}
	    }
	    catch (Exception $e) {
                 redirect(base_url().'login');
           }
     }
	 //send mail function
	 
	 public function send_mail($useremail,$msg) { 
	 
         $from_email = "noreply@ensoftech.com"; 
         //$to_email =$useremail; 
         //Load email library 
         $this->load->library('email'); 
   
         $this->email->from($from_email, 'nukash'); 
         $this->email->to($useremail);
         $this->email->subject('Account Activation'); 
         $this->email->message($msg); 
   
         //Send mail 
         if($this->email->send()) 
         $this->session->set_flashdata("email_sent","Email sent successfully."); 
         else 
         $this->session->set_flashdata("email_sent","Error in sending Email."); 
	// die;
        // $this->load->view('email_form'); 
      } 	

	   public function bulk_send_mail() { 
	    if($this->input->post('submit') != '') {
			 $uname=$this->session->username;
		 $refermail=$this->input->post('sendbulkrefmail');
		$link=base_url().'refer/'.$uname.'';
		$this->send_mail($refermail,$link);
		
		$table4='nukash_referred_links';
			$nukash_referred_links= array(
                'uid' =>$this->session->user_id,
				 'to_email' =>$refermail,
                'status' =>0,
                'postdate' =>date("Y-m-d h:i:d")		    
            );
			
		$nukash_referred_links = $this->Allfunction->insertDatas('1', $nukash_referred_links, $table4);	
		
        redirect(base_url().'user-dashboard');
		}
	
  
	   }

    public function userSignup()
    {
		
			$referUsername=$this->uri->segment(2);	
           $data['referUsername']=	$referUsername;	
          if($this->input->post('submit') != '') {	            
            $uname      = $this->input->post('uname');
            $pass       = md5($this->input->post('pass'));
            $email      = $this->input->post('email');
            $bankName   = $this->input->post('bankName');
            $accHolder  = $this->input->post('accHolder');
            $accNum     = $this->input->post('accNum');
            $branch     = $this->input->post('branch');
            $branchCode = $this->input->post('branchCode');
			$mobileno = $this->input->post('mobileno');
            $rferalCode = $this->input->post('rferalCode');	
	        $result['unique']=$this->UserModel->checkUniqueEmp(); 
        	$countarray=count($result['unique']);
      $flag=1;
      $UniqueEmpcode='';
      $UniqueEmail='';
	for($i=0; $i<$countarray; $i++)
	{
		if($uname==$result['unique'][$i]->username)
		{ 	
	      $UniqueEmpcode="Username must be unique";  
	     $flag=0;
		}		
		elseif($email==$result['unique'][$i]->email)
		{ 		
		$UniqueEmail="Email must be unique"; 
		$flag=0;
		}		
		else{			
			}
	}	 		
            $table1 = 'nukash_users';
			    $insData= array(
                'username' => $uname,
                'pass' => $pass,
                'email' => $email,
                'bank_name' => $bankName,
                'account_holder' => $accHolder,
                'acc_number' => $accNum,
                'branch' => $branch,
                'branch_code' => $branchCode,
                'status' => 'pending',
                'ft_verify' => '0',
                'referral' => $rferalCode,
                'post_date' => date('Y-m-d h:i:s')
            );			
			
			if($flag==0)
			{
			$data['isset']=array($bankName,$accHolder,$accNum,$branch,$branchCode,$rferalCode,$mobileno,'unique');
			// print_r($data);
			// die;
			$this->load->view('signup',$data);	
			$this->load->view('user_template/mycustomjs');
			
			}
			else {
           $data['insert']=$insData;
			 $success = $this->Allfunction->insertDatas('1', $insData, $table1);			
			$table2 = 'login_status';
			 $login_status= array(
                'date_time' => date("Y-m-d h:i:s"),
                'l_status' =>1,
                'ip' =>$_SERVER['REMOTE_ADDR'],
                'uid' => $uname,              
            );
			$successlogin_status = $this->Allfunction->insertDatas('1', $login_status, $table2);
			$table3='nukash_membership_orders';
			$membership_order= array(
                'user_id' =>$success['insId'],
				 'membership_id' =>1,
                'membership_type' =>'Free',
                'order_date' =>date("Y-m-d h:i:d"),
				'expired_date' =>date("Y-m-d h:i:d",strtotime("+1 days")),					
                'status' =>1      
            );
			$successmembership_order = $this->Allfunction->insertDatas('1', $membership_order, $table3);			
			$table4='nukash_rerred_bonus';
			$nukash_rerred_bonus= array(
                'user_id' =>$success['insId'],
				 'referral_id' =>$rferalCode,
                'bonus' =>100,
                'status' =>0,
                'post_date' =>date("Y-m-d h:i:d")		    
            );
			$nukash_rerred_bonus = $this->Allfunction->insertDatas('1', $nukash_rerred_bonus, $table4);	
          if ($success['success'] == 'success') {       	
$user_id=$success['insId'];
            $up_data=array( 'uid'=>$user_id , 'status'=>1 );						

		    $field_arry=array('mobileno'=>$mobileno,'status'=>0);
		    $suc=$this->Allfunction->tblUpdationByArrayLimit($field_arry,$up_data,'temp_verifymobile');	
			
			$field_arryDel=array('mobileno'=>$mobileno,'status'=>0);
		    $suc= $this->Allfunction->deletemultiple($field_arryDel,'temp_verifymobile');	
            
			
			$activationUrl=base_url().'send-activation/'.$uname.'';			
            $this->send_mail($email,$activationUrl);
            $this->session->set_flashdata('success_msg', 'Your Record has been inserted successfully');
            redirect(base_url().'login');
            }  			
		 }
            			
        }        
        else { 
              		
            $this->load->view('signup',$data);
			$this->load->view('user_template/mycustomjs');
        }        
    }
	
	  public function AccountVerification()
    {
	    $username=$this->uri->segment(2);	
        $data['username']=	$username;
	    $up_dataUser=array( 'status'=>'active');	
		$field_arryUser=array('username'=>$username);
		$suc=  $this->Allfunction->tblUpdationByArray($field_arryUser,$up_dataUser,'nukash_users'); 
	   $InactiveUser="SELECT id  FROM `nukash_users` WHERE username='$username'";
		$data['id']=$this->Allfunction->runQueryGet($InactiveUser);
		//print_r($data['id'][0]['id']);
		$user_id=$data['id'][0]['id'];
	    $up_data=array( 'status'=>1 );	
		$field_arry=array('user_id'=>$user_id);
		$suc= $this->Allfunction->tblUpdationByArray($field_arry,$up_data,'nukash_rerred_bonus'); 
		
		 $this->load->view('activation');
		
    }
    public function userLogin()
    {
	 try{
         if ($this->session->userdata('username') != '') {
			 // if($this->session->ft_verify==0){
				// $this->load->view('mobileverification');
	
			// }
			// else {
            redirect(base_url().'user-dashboard');
			//}
        } else {
            if ($this->input->post('submit') == '') {
                $this->load->view('login');
            } elseif ($this->input->post('submit')) {
                
                  $data['check']=$this->UserModel->logincheck();
                
                    if ($this->session->userdata('username') != '') {
				  $usrname=$this->session->userdata('username');
			$user_id=$this->session->userdata('user_id');
		    $sql="SELECT * FROM `nukash_membership_orders` as morder left join membership_levels as mlev on mlev.mid=morder.membership_id where morder.user_id='$user_id'";
			$sqlMembership="SELECT * FROM `membership_levels`";
			$sqlEarned="SELECT sum(`bonus`) as bonus FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=1";
		    $activeUser="SELECT count(*) as total FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=1";
		    $InactiveUser="SELECT count(*) as total FROM `nukash_rerred_bonus` WHERE referral_id='$usrname' and status=0";
			$data['mcheck']=$this->Allfunction->runQueryGet($sql);
			$data['membership']=$this->Allfunction->runQueryGet($sqlMembership);
			$data['sqlEarned']=$this->Allfunction->runQueryGet($sqlEarned);
			$data['activeUser']=$this->Allfunction->runQueryGet($activeUser);
			$data['InactiveUser']=$this->Allfunction->runQueryGet($InactiveUser);	
			// echo $this->session->ft_verify."dan";
			// die;
			// if($this->session->ft_verify==0){
				// $this->load->view('mobileverification');
	
			// }
			//else{
						  $this->load->view('user_template/header');
						  $this->load->view('user_template/sidebarnavigation');
						  $this->load->view('user_profile',$data);
						  $this->load->view('user_template/footer');
			//}
                     // redirect(base_url().'user-dashboard');
				}
				 else {
                    $this->session->set_flashdata('success_err', 'Email or password is In correct');
                    redirect(base_url().'login');
                }
                } else {
                    
                    redirect(base_url().'login');
                }
                
            }
            
        }	 
	catch (Exception $e) {
                 redirect(base_url().'login');
           }        
    }
    
    
	 public function user_sentotp()
    {
		try{
		$otp=rand(999999,6);
		$mobile=$this->input->post('mobile');
		//die;
	//	print_r($_POST);
	        $activeUser="SELECT count(*) as total FROM `temp_verifymobile` WHERE mobileno='$mobile' and status=1";
			$data['mcheck']=$this->Allfunction->runQueryGet($activeUser);
			//print_r($data['mcheck']);
			
				$alreadyext=$data['mcheck'][0]['total'];
					//echo $alreadyext;
				if($alreadyext==0)
				{
					
					 print_r($_SERVER['DOCUMENT_ROOT']);
					 $_SERVER['DOCUMENT_ROOT'].'/twillow/twilio-php-master/Twilio/autoload.php';
					
					//exit;
				     // require __DIR__ . '/twilio-php-master/Twilio/autoload.php';
//include_once('/twilio-php-master/autoload.php');
// Use the REST API Client to make requests to the Twilio REST API


// Your Account SID and Auth Token from twilio.com/console
$sid = 'ACb153fbc91706b4cdc8cad86000d8c498';
$token = 'f326c116217c5ee13c08dfd215ab338d';
$client = new Client($sid, $token);


$client->messages->create(
   
    $mobile,
   // '+27785807456',
   //'+918574184904',
   //'+918564957155',
   //  '+15005550006',
    array(
        
        'from' => '+15404695143',
        
        'body' => 'Your Otp is-'.$otp
    )
);
					$table3='temp_verifymobile';
				    $mobile_verify= array(
					'mobileno' =>$mobile,
					'otp' =>$otp,
					'postdate' =>date("Y-m-d h:i:d"),						
					'status' =>0   
				);
				$verifymobile = $this->Allfunction->insertDatas('1', $mobile_verify, $table3);
				//print_r($verifymobile);
				if($verifymobile['success']=='success'){
					  echo 'success';
				}
				
			}
			else{
				echo 'exist';
			}
				

            }
			 catch (Exception $e) {
				  redirect(base_url().'login');
			 }
    }
	
	
	
	
	//mobile veriffication
	
	
	 public function user_mobile_verification()
    {
		try{
		$otp=rand(999999,6);
		$mobile=$this->input->post('mobile');
		$otp=$this->input->post('otp');
		//die;
	//	print_r($_POST);
	      $activeUser="SELECT count(*) as total FROM `temp_verifymobile` WHERE mobileno='$mobile' and otp='$otp'";
			 $data['mcheck']=$this->Allfunction->runQueryGet($activeUser);
			// print_r($data['mcheck']);
			// die;
				$alreadyext=$data['mcheck'][0]['total'];									
				if($alreadyext==0)
				{				
					  echo 'error';	
			}
			else{								
				echo 'exist';
			}
             }
			 catch (Exception $e) {
				  redirect(base_url().'login');
			 }
    }
	
	
   public function logout()
    {
	     try{
			$this->session->sess_destroy();
			redirect(base_url().'login');
           }
          catch (Exception $e) {
                 redirect(base_url().'login');
           }
    }
    
}

