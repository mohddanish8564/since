
<div id="content">
  <div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<h1 class="page-title txt-color-blueDark">
			
			<!-- PAGE HEADER -->
			<i class="fa-fw fa fa-user"></i> 
			<?php echo $title; ?>
<?php
// echo '<pre>';
// print_r($roles);
// die;
 ?>
		</h1>
	</div>
	
</div>



<!-- widget grid -->
<section id="widget-grid" class="">


	<!-- START ROW -->

	<div class="row">

		<!-- NEW COL START -->
		
		<!-- END COL -->

		<!-- NEW COL START -->
		<article class="col-sm-12 col-md-12 col-lg-12 sortable-grid ui-sortable">
			
			<!-- Widget ID (each widget will need unique ID)-->
			<div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false" role="widget">
			
				<!-- widget div-->
				<div role="content">
					
		
					<!-- widget content -->
					<div class="widget-body no-padding">
			<table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
									<thead>			                
										<tr>
											<th data-hide="phone">ID</th>
											<th data-class="expand"><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Role</th>
											<th data-class="expand"><i class="fa fa-fw fa-envelope text-muted hidden-md hidden-sm hidden-xs"></i> Email</th>
											<th data-hide="phone"><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> Phone</th>
											<th data-hide="phone,tablet"><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Firstname</th>
											<th data-hide="phone,tablet"> Lastname</th>
											<th data-hide="phone,tablet"><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Created Date</th>
										
										<th data-hide="phone,tablet">Status</th>
																						
											<th data-hide="phone,tablet"></i>Action</th>
										</tr>
									</thead>
									<tbody>
									<?php
$i=1;
									foreach($roles as $data) {
if($data['status']==1)
{
$status='<span class="label label-success">Activated</span>';
$button='<button onclick="changestatus(0,'.$data['id'].')" class="btn btn-sm btn-danger">De-activate</button>';
	}
	else{
		$status='<span class="label label-danger">De-Activated</span>';
		$button='<button onclick="changestatus(1,'.$data['id'].')" class="btn btn-success btn-sm">Activate</button>';
	}

										?>
										<tr>
											<td><?php echo $i; ?></td>
											<td><?php echo $data['userrole'];?></td>
											<td><?php echo $data['email'];?></td>
											<td><?php echo $data['mobile_no'];?></td>
											<td><?php echo $data['firstname'];?></td>
											<td><?php echo $data['lastname'];?></td>
									
											<td><?php echo date("d-m-Y",strtotime($data['post_date']));?></td>
											<td><?php echo $status;?></td>
											<td>
						<?php echo 	$button; ?>
						
						<div class="dropdown">
						
         <button class="btn btn-default btn-md  dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Actions <span class="caret"></span></button>
									
											<ul role="menu" class="dropdown-menu cstm_dropdown-menu">
														<li><a href="javascript:void(0);" onclick="changePassModal(<?php echo $data['id']; ?>)"><i class="fa fa-fw fa-user"></i> Change Password</a></li>
														<li><a href="javascript:void(0);" onclick="EditUserModal(<?php echo $data['id']; ?>)"><i class="fa fa-fw fa-edit"></i>Edit</a></li>
											</ul>
							</div>
							
			 </td>
										</tr>										
									<?php
						$i++;
									} ?>
										
												</tbody>
												
												</table>
						
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
			<!-- end widget -->
			
			<!-- Widget ID (each widget will need unique ID)-->
			
			
				
			
			
			
			<!-- end widget -->								


		</article>
		<!-- END COL -->		

	</div>

	<!-- END ROW -->

</section>
<!-- end widget grid -->


			</div>
			
			<!-- Modal For change Password -->
<button type="button" id="modalpop" class="btn btn-info btn-lg hidden" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Please Change Your Password</h4>
      </div>
      <div class="modal-body">
      <form method="post" action="#">
						<input type="hidden" id="hidechangepass" class="form-control form-group" placeholder="Change Password">	
						<input type="text" id="changepass"  name="changepass" class="form-control" placeholder="Change Password">						
						</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="changePassAjax()" >Submit</button>
      </div>
    </div>

  </div>
</div>

	<!-- Modal For Edit User -->
<button type="button" id="UserEditmodalpop" class="btn btn-info btn-lg hidden" data-toggle="modal" data-target="#Usermodalpop">Open Modal</button>
<!-- Modal -->
<div id="Usermodalpop" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update Profile</h4>
      </div>
      <div class="modal-body">
      <form method="post" action="#" id="editpro">
						<input type="hidden" id="edit_hidechangepass" class="form-control form-group" placeholder="Change Password">	
						
						<div class="form-group">
						<label>Email</label>
								<input readonly type="text" id="edit_email"  name="edit_email"  class="form-control form-group" placeholder="Email">			
						</div>
						
								<div class="form-group">
						<label>First Name</label>
								<input type="text" id="edit_firstName"  name="edit_firstName" class="form-control form-group" placeholder="First Name" autocomplete="off">		
      </div>
						
								<div class="form-group">
						<label>Last Name</label>
							<input type="text" id="edit_lastName"  name="edit_lastName" class="form-control form-group" placeholder="Last Name">									
							</div>

					 <div class="form-group">
						<label>Phone No.</label>							
								<input type="text" id="edit_phoneno" maxlength="12"  name="edit_phoneno" class="form-control form-group" placeholder="Phone Number">			
						</div>
						
				 <div class="form-group">
				  
								<input type="hidden"  id="edit_gender" readonly  name="edit_gender" class="form-control form-group" placeholder="Gender">											
						</div>
						
						
						
						</form>
      </div>
						
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="changeProfileAjax()" >Submit</button>
      </div>
						
    </div>

  </div>
</div>


			
			
<script src="<?php echo ASSETS_URL; ?>/js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo ASSETS_URL; ?>/js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="<?php echo ASSETS_URL; ?>/js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="<?php echo ASSETS_URL; ?>/js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="<?php echo ASSETS_URL; ?>/js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script>
			
			$('#dt_basic').dataTable();
			function randomPassword(length) {
    var chars = "abcdefghijklmnopqrstuvwxyz!@#$%^&*()-+<>ABCDEFGHIJKLMNOP1234567890";
    var pass = "";
    for (var x = 0; x < length; x++) {
        var i = Math.floor(Math.random() * chars.length);
        pass += chars.charAt(i);
    }
    return pass;
  }

  function changePassModal(hid){
	
	$("#hidechangepass").val(hid);
	$("#modalpop").trigger("click");
	
	
}
function generate() {
	var genval=randomPassword(10);
$('#password').val(genval);

}

// Chnage Password Ajax

function changePassAjax(){

var uid=$("#hidechangepass").val();
var changepass=$("#changepass").val();
	if(uid==''){		
	swal("Something went Wrong. Please try Again Later");
		return false;
	}
	
		if(changepass==''){		
	swal("Please fill the password field");
		return false;
	}
	
	
	
		swal({
		title: "Are you sure?",
		text: "Password has been changed",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, Changed it!',
		closeOnConfirm: false,
		//closeOnCancel: false
	},
	function(){
			$(".close").trigger("click");
			
	 $.ajax({                                      
      url:'<?php echo base_url()?>change-password',     
         type:'POST',
     
      data:{
		  uid:uid,
				changepass:changepass
		  
	  },                
      success: function(data)          
      {
							
							var uid=$("#hidechangepass").val('');
var changepass=$("#changepass").val('');
	
	if(data==1){ 
swal("Updated!", "Your password has been updated", "success");
	}
	
	else{
		swal("Error!", "Could not update password !", "error");
	}
      } 
    });
		
	});
		
	
}


function EditUserModal(hid){	
	$("#edit_hidechangepass").val(hid);
	$("#UserEditmodalpop").trigger("click");	
	
	 GetUserData(hid);
	
}


// Chnage Password Ajax

function GetUserData(uid){

 $.ajax({                                      
      url:'<?php echo base_url()?>getuserdetails',     
         type:'POST',
									 dataType: "json",
     
      data:{
		  uid:uid		  
	  },                
      success: function(response)          
      {
							
							
							$("#edit_email").val(response.email);
							$("#edit_firstName").val(response.firstname);
							$("#edit_lastName").val(response.lastname);
							$("#edit_phoneno").val(response.mobile_no);
							$("#edit_gender").val(response.gender);
   } 
    });

	
	
}


function changestatus(sid,uid){
	
	swal({
		title: "Are you sure?",
		text: "you want to change status",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, changed it!',
		closeOnConfirm: false,
		//closeOnCancel: false
	},
	function(){
			$(".close").trigger("click");
			
	 $.ajax({                                      
      url:'<?php echo base_url()?>changestatus',     
         type:'POST',
     								 dataType: "json",
      data:{
		    uid:uid,
						sid:sid
		  
	  },                
      success: function(data)          
      {
							
swal("Updated!", "Status has been updated", "success");

location.reload();
    
				} 
    });
		
	});
}
//changeprofilestatus
function changeProfileAjax(){
						
						var formd=$("#editpro").serialize();
	     var hid=$("#edit_hidechangepass").val();	
					 var email=$("#edit_email").val();
						var firstName=	$("#edit_firstName").val();
						var lastName=	$("#edit_lastName").val();
						var phoneno=	$("#edit_phoneno").val();
						var gender=	$("#edit_gender").val();
				
					if(email=='' || firstName=='' || lastName=='' || phoneno=='' || gender==''|| hid=='' ){
								swal("Error!", "Please fill all the details", "error");
								//return false;
					}
	
	// swal({
		// title: "Are you sure?",
		// text: "you want to change status",
		// type: "warning",
		// showCancelButton: true,
		// confirmButtonColor: '#DD6B55',
		// confirmButtonText: 'Yes, changed it!',
		// closeOnConfirm: false,
		// //closeOnCancel: false
	// },
	// function(){
			// $(".close").trigger("click");
			
	 // $.ajax({                                      
      // url:'<?php echo base_url()?>changeprofilestatus',     
         // type:'POST',
       // data:{
   								// hid:hid,
			 							// firstName:firstName,
											// lastName:lastName,
											// phoneno:phoneno
							// },              
      // success: function(data)          
      // {
							
// swal("Updated!", "Status has been updated", "success");

// location.reload();
    
				// } 
    // });
		
	// });
	swal({
		title: "Are you sure?",
		text: "you want to change status",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, changed it!',
		closeOnConfirm: false,
		//closeOnCancel: false
	},
	function(){
			$(".close").trigger("click");
			
	 $.ajax({                                      
      url:'<?php echo base_url()?>changeprofilestatus',     
         type:'POST',
     								 dataType: "json",
      data:{
		         hid:hid,
			 							firstName:firstName,
											lastName:lastName,
											phoneno:phoneno
	  },                
      success: function(data)          
      {
							if(data==1){
swal("Updated!", "Status has been updated", "success");
location.reload();
							}
							
							else {
								swal("Error!", "Could not update your profile. Please try again later", "error");
							}
//location.reload();
    
				} 
    });
		
	});
	
}





			</script>