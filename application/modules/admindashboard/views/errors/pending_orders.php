<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Today Service Request
       <!-- <small>advanced tables</small>-->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
         

          <div class="box">
            <!--<div class="box-header">
              <h3 class="box-title"><a class="btn btn-success" href="<?php echo base_url()?>add-master-service">+ Add Master Service</a></h3>
            </div>-->
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>S.no</th>
                  <th>Name</th>
                  <th>Image</th>
                  <th>Status</th>
               
                  <th>Action</th>
                  
                </tr>
                </thead>
                <tbody>
                    <?php $sr=1; foreach($servicelst as $maslst){ ?>
                <tr>
                  <td><?php echo $sr++;?></td>
                  <td><?php echo $maslst['service_name']?></td>
                   <td><img width="90px" height="90px" src="<?php echo base_url().'uploads/'.$maslst['master_img']?>"></td>
                  <td><?php if($maslst['status']==1){echo 'Active';}else{echo 'Inactive';}?></td>
           
                  <td><a class="btn btn-success" href="<?php echo base_url().'master-service-edit-form/'.$maslst['msid']?>">Edit</a> |
                  <a onclick="del_id('<?php echo $maslst['msid']?>')"class="btn btn-danger"  data-toggle="modal" data-target="#myModal" >Delete</a></td>
                 
                </tr>
                <?php }?>
                </tbody>
               <!-- <tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
                </tfoot>-->
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
        <form method="post" action="<?php echo base_url()?>delete-data/master-service-list" >
            <input type="hidden" id="delid" name="msid=master_services" />
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