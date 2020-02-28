<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       <?php echo $title?>
       <!-- <small>advanced tables</small>-->
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url()?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><?php echo $title?></li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
					
				 <?php if($this->session->flashdata('update')!="" || $this->session->flashdata('update')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('update');    ?>
              </div>    
            <?php }?>
          <?php if($this->session->flashdata('delete')!="" || $this->session->flashdata('delete')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('delete');    ?>
              </div>    
            <?php }?>
     <?php if($this->session->flashdata('sucess')!="" || $this->session->flashdata('sucess')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('sucess');    ?>
              </div>    
            <?php }?>
                <br>
								
           
              
          
          <div class="box">
           <div class="box-header">
              <h3 class="box-title"><a class="btn btn-info" href="<?php echo base_url()?>create-login">+ Create Login</a></h3>
					 </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
											<th>S.no</th>
											<th>User name</th>
											<th>Employee Email</th>
											<th>Created Date</th>
											<th>Status</th>
											 <th>Action</th>
                  
                </tr>
                </thead>
                <tbody>
                    <?php $sr=1; foreach($lst as $maslst){ ?>
                <tr>
                  <td><?php echo $sr++;?></td>
									 <td><?php echo $maslst['username']?></td>
                  <td><?php echo $maslst['email']?></td>
									<td><?php echo date('d/m/Y',strtotime($maslst['post_date']));?></td>

							
												  <td><?php if($maslst['status']==1){echo 'Active';}else{echo 'Inactive';}?></td>
                  <td><a onclick="del_id('<?php echo $maslst['id']?>')"class="btn btn-danger"  data-toggle="modal" data-target="#myModal" >Delete</a> </td>
                 
                </tr>
                <?php }?>
                </tbody>
             
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

   <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color:#E81212">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:#fff">Action Performed By Admin</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure to want to delete the data ?</p>
        <form method="post" action="<?php echo base_url()?>delete-data/employee-list" >
            <input type="hidden" id="delid" name="id=admin_login" />
            <input type="submit" name="delete" value="Delete" class=" btn btn-danger"/>
            <button type="button" class=" btn btn-warning" data-dismiss="modal">Close</button>
        </form>
      </div>
      <div class="modal-footer">
      
      </div>
    </div>

  </div>
</div>
  <!-- /.content-wrapper -->
  
  <script>
    function del_id(delid)
    {
         $('#delid').val(delid);
    }
    $('#example23').DataTable( {
       
        
    });
  </script>
