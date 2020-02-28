<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo $title?>
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url()?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#"><?php echo $title?></a></li>
       
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <?php if($this->session->flashdata('error')!="" || $this->session->flashdata('error')!=null){?>
              <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('error');    ?>
              </div>    
            <?php }?>
          <div class="box box-primary">
            <div class="box-header with-border">
              <!--<h3 class="box-title">Add Master Service form</h3>-->
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?php echo base_url()?>login-credential-save" method="post" enctype="multipart/form-data"> 
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email</label>
				  <input type="email" maxlength="45" name="email" class="form-control" />
                  </div>
                 <div class="form-group">
                  <label for="exampleInputEmail1">Username</label>
				  <input type="text" maxlength="45" name="username" class="form-control" />
                  </div>
                  <div class="form-group">
                  <label for="exampleInputEmail1">Password</label>
				  <input type="password" maxlength="45" name="password" class="form-control" />
                  </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Status</label>
                 <select name="status" required class="form-control">
                    <option value="">--Select Status--</option>
                    <option value="1">Active</option>
                     <option value="2">In-Active</option>
                 </select>
                </div>
              
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
				 <a onclick="window.history.go(-1);" class="btn btn-info">Back</a> 
              </div>
            </form>
          </div>
          <!-- /.box -->

        

        </div>
        <!--/.col (left) -->
       
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 