<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Allfunction extends CI_Model
{
    public function __construct()
    {
      $this->load->database();
     //   error_reporting(0);
	//	$this->load->model('UserModel');
    }
	
	
	
	
public function insertDatas($uid,$ins_data,$tbl)
{ if($uid!='' && $tbl!=''  && count($ins_data)>0) 
  { 
//print_r($ins_data);

 $this->db->insert($tbl, $ins_data); 
	 $insert_id = $this->db->insert_id();
	 
	 return array( "success" => "success",
				 "emp_id" => $uid,
			    	"insId"=>$insert_id
		);
  
  }else{ return array( "success" => "not", "emp_id" => $uid );    } 
}
	
public  function runQueryGet($sql)
 { if($sql!='')
			{$query = $this->db->query($sql);
			 $result = $query->result_array();
			 return $result;	
			 }else{ return 'query Empty';}
 }
 
	
  public function getArray($field_get,$table,$field_arry)
  {	$this->db->select($field_get);
		foreach($field_arry as $key => $value){
			$this->db->where($key, $value);
		}
		//$this->db->order_by("id", "desc");
		$query = $this->db->get($table);
		
		$result = $query->result_array();
		return $result;
 }
 
 
 
  public function tblUpdationByArray($field_arry,$up_data,$tbl)
  {
     if( count($field_arry)>0 && $tbl!='' && count($up_data)>0)
     {
       foreach($field_arry as $key => $value)
	   { $this->db->where($key, $value);
	   }
       $ddd= $this->db->update($tbl, $up_data); 
       return '1'.$ddd;
     }
     else 
     { return '0'; } 
  } 
  // update data with limit
  
  public function tblUpdationByArrayLimit($field_arry,$up_data,$tbl,$limit)
  {
     if( count($field_arry)>0 && $tbl!='' && count($up_data)>0)
     {
       foreach($field_arry as $key => $value)
	   { $this->db->where($key, $value);
	   }
	   $this->db->order_by("tid", "desc");
	   $this->db->limit($limit);
       $ddd= $this->db->update($tbl, $up_data); 
       return '1'.$ddd;
     }
     else 
     { return '0'; } 
  } 
  
  
  
  
   public function deleteArrArow($id,$fieldAry,$table)
    {
	   foreach($fieldAry as $key => $value){
         $this->db->where($key, $value);
		}
		$rr= $this->db->delete($table);
		return $rr.'='.$id;
    } 
	  
//simple multiple delette
public function deletemultiple($fieldAry,$table)
    {
		$this->db->where($fieldAry);
		$rr= $this->db->delete($table);
	//	return $rr.'='.$id;
		//echo json_encode("success"+$id);
    } 
	  
function fetch_all($tblname,$orderby)
{

	try
	{
			$this->db->select('*');
		    $query = $this->db->order_by($orderby);
			$query = $this->db->get($tblname);
			$result=$query->result_array();
			return $result;
	}
			
	catch(Exception $e)
	{
		echo 'Caught exception: ',  $this->$e->getMessage(), "\n";
	}
}
function fetch_singlerow_data($where,$tblname)
						{
							 
									 try
					       {
															$this->db->select('*');
															$this->db->from($tblname);
															$this->db->where($where);
													 	$query = $this->db->get();
															 
															$result=		$query->row_array();
										//	echo 	 $this->db->last_query();
															return $result;
					      	}
						
				   		catch(Exception $e)
          {
              echo 'Caught exception: ',  $this->$e->getMessage(), "\n";
          }
						}
						public function getArray_by_or($field_get,$table,$where)
  {	$this->db->select($field_get);
		//foreach($field_arry as $key => $value){
			$this->db->where($where);
		//}
		//$this->db->where($key, $value);
		$query = $this->db->get($table);
		
		$result = $query->result_array();
		return $result;
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


