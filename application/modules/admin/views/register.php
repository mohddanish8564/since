<?php //echo '<pre>'; print_r($po); echo '</pre>';?>
 
<style>
.wrapper {
    background-color: #d2d6de !important;
} .register-box {
    width: 90%;
    margin-top: 20px;
}
@media (max-width: 768px)
.login-box, .register-box {
    width: 90%;
    margin-top: 20px;
}   .select2-selection__choice{ background-color: #337ab7 !important};
</style>
<div class="register-page">
<div class="register-box">
  
<?php if($this->session->flashdata('sucess')!="" || $this->session->flashdata('sucess')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('sucess');    ?>
              </div>    
            <?php }?>
			<?php if($this->session->flashdata('error')!="" || $this->session->flashdata('error')!=null){?>
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('error');    ?>
              </div>    
            <?php }?>
  <div class="register-box-body">
    <h1 class="login-box-msg">Registration</h1>

    <form action="<?php echo base_url()?>user-register" method="post">
	
	<input type="hidden" value="<?php echo $this->session->userdata('user_id')?>" name="teachid">
	<div class="col-md-12 col-xs-12 col-sm-12">
		<div class="form-group  col-md-4 col-xs-12 col-sm-12"><label>User Type</label>
	<?php     //$utype= $this->Allfunction->fetch_all('tuser_type','id'); 
	$field_arry = array(
                    'urole !=' => 1,'dstatus' =>0
                );
			//   $field_arry = array();
		  $utype= $this->Allfunction->getArray('*','tuser_type', $field_arry);	
	?>
                  <select class="form-control" name="role" required>
				  <option value="">--Select User Type--</option>
				  <?php foreach($utype as $ulist){?>
                    <option <?php if(isset($po['role']) && $po['role']==$ulist['urole']){echo 'selected';}?> value="<?php echo $ulist['urole']?>"><?php echo $ulist['name']?></option>
				  <?php } ?>
                  </select>
         </div>
<div class="form-group col-md-4 col-xs-12 col-sm-12"><label> package Type</label>
                  <select onchange="fillajax();"class="form-control" name="packagetype" id="packagetype" required>
				  <option value="">--Select package Type--</option>
                    <option <?php if(isset($po['packagetype']) && $po['packagetype']=="online"){echo 'selected';}?> value="online">Online</option>
					 <option  <?php if(isset($po['packagetype']) && $po['packagetype']=="offline"){echo 'selected';}?> value="offline">Offline</option>
                  </select>
         </div>
		 <div class="form-group col-md-4 col-xs-12 col-sm-12" id="classDivID">
		  <label>Class</label>
                  <select class="form-control" name="class" id="classid" required onchange="fillajaxsubject(this.value)">
				  <option value="">--Class--</option>
				  <?php 
				  $field_arry = array('dstatus' =>0);
		  $ucls= $this->Allfunction->getArray('*','tclass', $field_arry); 
				  //$ucls= $this->Allfunction->fetch_all('tclass','id');
				 //  if(isset($po['class'])){
				  foreach($ucls as $cls){
				  ?>
					<option <?php if(isset($po['class']) && $po['class']==$cls['id']){echo 'selected';} ?> value="<?php echo $cls['id']?>"><?php echo $cls['name']?></option>';
					  
				  <?php } //}?>
                  </select>
         </div>
		 <div class="form-group col-md-4 col-xs-12 col-sm-12" id="subjectDivID"><label> Subject</label>
                  <select class="form-control select2" name="subject[]" id="subjectid" required multiple="multiple" data-placeholder="Select a Subject"
                        style="width: 100%;">
				  <option value="">--Subject--</option>
				  <?php 
				 // $usubj= $this->Allfunction->fetch_all('tsubject',$po['subject']);
				 $field_arry = array('classid'=>$po['class'],'dstatus' =>0);
		  $usubj= $this->Allfunction->getArray('*','tsubject', $field_arry);  			  
				  if(isset($po['subject'])){
				  foreach($usubj as $usub){
				  ?>
					<option <?php if(isset($po['subject']) && $po['subject']==$usub['id']){echo 'selected';} ?> value="<?php echo $usub['id']?>"><?php echo $usub['name']?></option>';
					  
				  <?php } }?>
                  </select>
         </div>
<div class="form-group col-md-4 col-xs-12 col-sm-12" id="durationDivID"><label>Duration</label>
                  <select class="form-control" name="duration" id="duration">
				  <option value="">--Duration--</option>
				  <?php 
				  $udration= $this->Allfunction->fetch_all('tduration','id');
				   if(isset($po['duration'])){
				  foreach($udration as $dur){
				  ?>
					<option <?php if($po['duration']==$dur['id']){echo 'selected';} ?> value="<?php echo $dur['id']?>"><?php echo $dur['name'].' '.$dur['name2']?></option>';
					  
				  <?php } }?>
                  </select>
         </div>
		 
		 <div class="form-group col-md-4 col-xs-12 col-sm-12"  id="StorageDivID"><label>Storage Type</label>
                  <select class="form-control" name="storagetype" id="storagetype" >
				  <option value="">--Select Storage Type--</option>
				  <option <?php if(isset($po['storagetype'])=="hdd"){echo 'selected';}?>  value="hdd">HDD</option>
				   <option <?php if(isset($po['storagetype'])=="pd"){echo 'selected';}?> value="pd">Pendrive</option>
                  </select>
         </div>
      <div class="form-group col-md-4 col-xs-12 col-sm-12"><label> First Name</label>
        <input type="text" class="form-control" name="firstname" placeholder="First Name" required value="<?php  if(isset($po['firstname'])){echo $po['firstname'];}else{'';}?>">
       
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Last Name</label>
        <input type="text" class="form-control" value ="<?php  if(isset($po['lastname'])){echo $po['lastname'];}else{'';}?>" name="lastname" placeholder="Last Name" required>
     
      </div>
	    <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>User Name</label>
        <input type="text" class="form-control" value ="<?php if(isset($po['username'])){echo $po['username'];}else{'';}?>" name="username" placeholder="User name" required>
       
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Password</label>
        <input type="password" class="form-control" value ="<?php if(isset($po['password'])){echo $po['password'];}else{'';}?>" name="password" placeholder="Password" required>
       
      </div>
	  <div class="form-group col-md-4 col-xs-12 col-sm-12"><label> Gender</label>
                  <select class="form-control" name="gender" required>
				  <option value="">--Select Gender--</option>
                    <option <?php if(isset($po['gender'])=="male"){echo 'selected';}?> value="male">Male</option>
					 <option <?php if(isset($po['gender'])=="female"){echo 'selected';}?> value="female">Female</option>
                  </select>
         </div>
	    <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>DOB</label>
        <input type="text" class="form-control" id="dob" value ="<?php if(isset($po['dob'])){echo $po['dob'];}else{'';}?>" name="dob" placeholder="Date Of Birth" readonly="readonly" required>
       
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Email</label>
        <input type="email" class="form-control" value ="<?php if(isset($po['email'])){echo $po['email'];}else{'';}?>"  name="email" placeholder="Email" required>
        
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Alternate Email</label>
        <input type="email" class="form-control" value ="<?php if(isset($po['altrnatemail'])){echo $po['altrnatemail'];}else{'';}?>"  name="altrnatemail" placeholder="Alternate Email" required>
       
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Mobile</label>
        <input type="text" class="form-control" onkeypress="isNumber(event);" value ="<?php if(isset($po['mobile_no'])){echo $po['mobile_no'];}else{'';}?>" name="mobile_no" placeholder="Mobile No." maxlength="10" required>
        
      </div>
      <div class="form-group col-md-4 col-xs-12 col-sm-12"><label> Mobile No. Parent</label>
        <input type="text" class="form-control" onkeypress="isNumber(event);" value ="<?php if(isset($po['mobile_no_parent'])){echo $po['mobile_no_parent'];}else{'';}?>" name="mobile_no_parent" placeholder="Mobile No. Parent" maxlength="13" required>
        
      </div>
	     <div class="form-group  col-md-4 col-xs-12 col-sm-12"><label>Whatsapp No</label>
        <input type="text" class="form-control" onkeypress="isNumber(event);" value ="<?php if(isset($po['whatsapp_no'])){echo $po['whatsapp_no'];}else{'';}?>" name="whatsapp_no" placeholder="Whatsapp No." maxlength="13" required>
       
      </div>
	  
	  <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Payment Method</label>
	  <?php     $paymnttype= $this->Allfunction->fetch_all('tpayment_mode','id'); ?>
                  <select class="form-control" name="payment_method" required>
				<option value="">--Select Payment Method--</option>
				  <?php foreach($paymnttype as $paytyp){?>
                    <option <?php if(isset($po['payment_method'])==$paytyp['id']){echo 'selected';}?> value="<?php echo $paytyp['id'];?>"><?php echo $paytyp['name'];?></option>
				  <?php } ?>
                  </select>
         </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label>Website</label>
        <input type="text" class="form-control" value ="<?php  if(isset($po['website'])){echo $po['website'];}else{'';}?>" name="website" placeholder="Website" required>
   
      </div>
	   <div class="form-group col-md-4 col-xs-12 col-sm-12"><label> Address</label>
        <textarea type="text" class="form-control" name="address"  placeholder="Address" required><?php if(isset($po['address'])){echo $po['address'];}else{'';}?></textarea>
       
      </div>
  

  
<div class="clearfix">
   
  </div>  </div>
  <div class="box-footer col-xs-12 col-sm-12" style="text-align: center;">
               <input type="submit" name="save" value="Signup" class="btn btn-primary btn-flat">
				
              </div> 
    </form>
	<div class="clearfix">
   
  </div>
	<div style="text-align: center;">
	<a href="<?php echo base_url()?>admin" class="text-center">I already have a membership</a>
	</div> 
  <!-- /.form-box -->
</div>

</div>


<!-- /.register-box 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$.get("https://ipinfo.io", function (response) {
   
    document.getElementById('country').value = response.country;
}, "jsonp");
</script>
