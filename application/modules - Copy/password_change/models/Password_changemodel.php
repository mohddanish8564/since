<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Leavemodel extends CI_Model
{
    public function __construct()
    {
      $this->load->database();
     //   error_reporting(0);
	//	$this->load->model('UserModel');
    }
	
	function departmentWise_leave($depid)
	{
		try
		{
			$this->db->select('fyr.ye,emplv.*,ep.*,mr.role_name,ps.scale,q.name,dep.d_name,desg.desig_name');
			$this->db->from('emp_profile ep');
			$this->db->join("master_role  mr",'mr.rid=ep.type','inner');
			$this->db->join("payscale  ps",'ps.payid=ep.payscale','inner');
			$this->db->join("qualification  q",'q.qid=ep.emp_qualification','inner');
			$this->db->join("department  dep",'dep.did=ep.department','left');
			$this->db->join("designation  desg",'desg.id=ep.designation','inner');
			$this->db->join("emp_leave  emplv",'emplv.emp_id=ep.empid','inner');
			$this->db->join("f_year  fyr",'fyr.id=emplv.fy_id','inner');
			$this->db->where('ep.department',$depid);
			//$this->db->where('ep.type <=',$this->session->userdata('role'));
			$query = $this->db->get();
			$result= $query->result_array();
			return $result;
		}
		catch(Exception $e)
          {
              echo 'Caught exception: ',  $this->$e->getMessage(), "\n";
          }
	}
 	
		function base64url_encode($data) { 
  return rtrim(strtr(base64_encode($data), '+/', '-_'), '='); 
} 

function base64url_decode($data) { 
  return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT)); 
}
	function delete_leave($id)
	{
		    $this->db->where('lid', $id);
             $this->db->delete('emp_leave');
			
	}
	
	
}

