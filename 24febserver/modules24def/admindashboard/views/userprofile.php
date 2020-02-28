
<?php 
// print_r($activeUsers); 

// $pr= get_user_details(1);
 // print_r($pr['firstname']);
 // exit();	
?>
<style>
.products-list .product-info {
    margin-left: 15px;
}
</style>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <?php if($this->session->flashdata('sucess')!="" || $this->session->flashdata('sucess')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('sucess');    ?>
              </div>  
			  
            <?php }?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        User Profile
        <small></small>
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">
      
	<div class="row">
    
	<div class="col-xs-12 col-sm-12">
   <form role="form" action="<?php echo  base_url().'update-profile'?>" method="post">

      <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">Unchanged Details</h4>
        </div>
        <div class="panel-body">
        
          <div class="form-group">
            <label class="col-sm-2 control-label">User Name</label>
            <div class="col-sm-10">
			<?php 	$uid=$this->session->userdata('user_id'); 
			     	$user=get_user_details($uid);
					if($user['role']==1){
						
						$lblrole='Admin';
						
					}
					else if($user['role']==2){
						
						$lblrole='Teacher';
					}
					
					else if($user['role']==3){
						$lblrole='Student';						
					}
					
					else{
						
						$lblrole='';	
					}
			?>
			
              <input type="text" class="form-control" value="<?php echo $user['username']; ?>" readonly>
			  
	    
			  
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">User Type</label>
            <div class="col-sm-10">
              <input readonly type="text" class="form-control" value="<?php echo $lblrole; ?>">
            </div>
          </div>
		     
			 <?php 
			 if($user['role']==1){
				 
			 }
			 else{
			 ?>
			 <div class="form-group">
            <label class="col-sm-2 control-label">Class</label>
            <div class="col-sm-10">
      <input type="text" class="form-control" value="<?php echo $allclass[0]['name']; ?>" readonly>
            </div>
          
		  </div>
		  
		  	 <div class="form-group">
            <label class="col-sm-2 control-label">Parent Mobile No</label>
            <div class="col-sm-10">
      <input type="text" class="form-control" value="<?php echo $user['mobile_no_parent']; ?>" readonly>
            </div>
          </div>
		  
		<?php  }?>
		  	
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">User info</h4>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label">First Name</label>
            <div class="col-sm-10">
              <input type="text" name="fname" value="<?php echo $user['firstname']; ?>" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Last Name</label>
            <div class="col-sm-10">
              <input type="text" name="lname" value="<?php echo $user['lastname']; ?>" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Gender</label>
            <div class="col-sm-10">
              <input type="text" name="gender" value="<?php echo $user['gender']; ?>" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Dob</label>
            <div class="col-sm-10">
             <input type="date"  name="dob" value="<?php echo date("Y-m-d",strtotime($user['dob'])); ?>" class="form-control">
            </div>
            </div>
			
			  <div class="form-group">
            <label class="col-sm-2 control-label">Address</label>
            <div class="col-sm-10">
               <input type="text"  name="address" value="<?php echo $user['address']; ?>" class="form-control">
            </div>
            </div>
			
			
          </div>
        </div>

	  
	  
	  <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">Contact Details</h4>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $user['email']; ?>" class="form-control" maxlength="65">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Alternate Email</label>
            <div class="col-sm-10">
              <input type="text" name="altemail" value="<?php echo $user['altrnatemail']; ?>" class="form-control" maxlength="65">
            </div>
          </div>
		  
		  
		    <div class="form-group">
            <label class="col-sm-2 control-label">Mobile No.</label>
            <div class="col-sm-10">
              <input type="text" name="mobileNo" value="<?php echo $user['mobile_no']; ?>" class="form-control number" maxlength="12">
            </div>
          </div>
		  
		  
		    <div class="form-group">
            <label class="col-sm-2 control-label">Whatsapp No.</label>
            <div class="col-sm-10">
              <input type="text" name="whatsappNo" value="<?php echo $user['whatsapp_no']; ?>" class="form-control number" maxlength="12">
            </div>
          </div>
		  
		      <div class="form-group">
            <label class="col-sm-2 control-label">Website</label>
            <div class="col-sm-10">
              <input type="text" name="website" value="<?php echo $user['website']; ?>" class="form-control">
            </div>
          </div>
		
        </div>
      </div>
	  
	  

<!--	<div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">Other Details</h4>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label">Package Type</label>
            <div class="col-sm-10">
              <input type="text" name="packagetype" value="<?php echo $user['packagetype']; ?>" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Storage Type</label>
            <div class="col-sm-10">
              <input type="text" name="storage_type" value="<?php echo $user['storage_type']; ?>" class="form-control">
            </div>
          </div>
		  
		  
		
        </div>
      </div>
	  
	  -->
	  
	  
<?php if($this->session->userdata('role')==3){$disp = 'display:none'; }else{$disp = '';  }?>
      <div class="panel panel-default" style="<?php echo $disp;?>">
        <div class="panel-heading">
        <h4 class="panel-title">Actions</h4>
        </div>
        <div class="panel-body">
       <!--   <div class="form-group">
            <label class="col-sm-2 control-label">Current password</label>
            <div class="col-sm-10">
              <input type="password" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">New password</label>
            <div class="col-sm-10">
              <input type="password" class="form-control">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
              <div class="checkbox">
                <input type="checkbox" id="checkbox_1">
                <label for="checkbox_1">Make this account public</label>
              </div>
            </div>
          </div>
		  
		  -->
          <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
              <button type="submit" class="btn btn-primary">Submit</button>
            
            </div>
          </div>
        </div>
      </div>
	  
	  
    </form>
  </div>
  
</div>


	  
	  </div>
      
	   
	   </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  