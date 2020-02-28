<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Adminmodel extends CI_Model
{
    public function __construct()
    {
      $this->load->database();
     //   error_reporting(0);
	//	$this->load->model('UserModel');
    }
	
	public function logincheck()
	{
		        $username = $this->input->post('username');
                $pass  = md5($this->input->post('password'));
				 
                $field_arry = array(
                    'email' => $username,
                    'pass' => $pass
                   
                );
                 $where = array('email' => $username);
                $userData = $this->Allfunction->getArray($field_get = '*', $table = 'user_login', $field_arry);
            
                 // 'status' => '1'
																	// if()
                if (count($userData) > 0) {
																	
																				if($userData[0]['status']==1){
																					
																					
																	
                     $session_data=array(
					             'user_id'=>$userData[0]['id'],
								 'username'=>$userData[0]['email'],
								 'email'=>$userData[0]['email'],
								 'role'=>$userData[0]['role'],
								 
								 );
					 
                return     $this->session->set_userdata($session_data);
																
																				}
																				
																				else{
																					
																					 return  'User has been Deactivated';
																					
																				}
	           }
	           	   else {
				   
				                   return  'Please Check Your Credentials';
			   }
			
        }

		
 	function data_delete()
		{
				try
		{
					
			foreach ($_POST  as $key => $value)
					{
						  $data[]= str_replace('delete=Delete','',$key.'='.$value);
					}
				 
				$str=explode('=',$data[0]);
					
					if($str[0]=='nav_id' && $str[1]=='navigation' )
					{
						$this->db->where('menu_id', $str[2]);
						$del=  $this->db->delete('taxonomy');
						$this->db->where($str[0], $str[2]);
						$del=  $this->db->delete($str[1]);
					}
					else
					{
						$this->db->where($str[0], $str[2]);
						$del=  $this->db->delete($str[1]);
						if($str[0]=='towno'){$this->db->where($str[0], $str[2]);
			           $del=  $this->db->delete('work');}
					  if($str[0]=='empid'){$this->db->where($str[0], $str[2]);
			           $del=  $this->db->delete('user_login');}
				
						
			        }
				if($del==1)
				{
					  return 1;
				}
				else
				{
					return 0;
				}
						
		}
						catch(Exception $e)
          {
              echo 'Caught exception: ',  $this->$e->getMessage(), "\n";
          }
						}
		function item_delete()
		{
			$id=$this->input->post('ID');
			$this->db->where('id', $id);
			$del=  $this->db->delete('work');
			if($del==1)  
			{
			  return 1;
			}
			else
			{
			   return 0;
			}
		}
		function delete_for_update()
		{
			$id=$this->input->post('update_id');
			$this->db->where('towno', $id);
			$del=  $this->db->delete('work');
			if($del==1)  
			{
			  return 1;
			}
			else
			{
			   return 0;
			}		
		}
		function dept_wise_work_status_list()
		{
			$this->db->select('*');
		   $this->db->from('acust_ano_details cad');
	//	$this->db->join("work_status  ws",'ws.towno=cad.towno','inner');
		//$this->db->where($where);
		$this->db->where('cad.desig_status !=',5);
		//$this->db->where('cad.issu_date <=',$end_iss_date);
		$query = $this->db->get();
		$result = $query->result_array();
		return $result;
		}
			function get_datewise_filter($st_iss_date, $end_iss_date,$where){
		$this->db->select('*');
$this->db->where($where);
$this->db->where('issu_date >=',$st_iss_date);
$this->db->where('issu_date <=',$end_iss_date);
$query = $this->db->get('cust_ano_details');
$result = $query->result_array();
return $result;
	}
}

