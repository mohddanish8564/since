<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Edit Master Service
        <small>Preview</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">General Elements</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Master Service form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?php echo base_url()?>edit-master-service-save" method="post" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Service Name</label>
                  <input type="hidden" name="hidimg" value="<?php echo $masterservice[0]['master_img'];?>" />
                  <input type="text" value="<?php echo $masterservice[0]['service_name']?>" name="service_name" class="form-control" id="" required placeholder="Enter Service Name">
                </div> <div class="form-group">

                  <label for="exampleInputEmail1">Image</label>

                  <input type="file" name="imgmaster" class="form-control" id="" required >

                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Status</label>
                 <input type="hidden" name="update_id" value="<?php echo $msid?>" />
                 <select name="status" required class="form-control">
                    
                    <option  value="">--Select Status--</option>
                    <option  <?php if($masterservice[0]['status']==1){echo 'selected=selected';}else{ echo '';}?> value="1">Active</option>
                     <option <?php if($masterservice[0]['status']==2){echo 'selected=selected';}else{ echo '';} ?> value="2">In-Active</option>
                 </select>
                </div>
               <!-- <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" id="exampleInputFile">

                  <p class="help-block">Example block-level help text here.</p>
                </div>-->
               <!-- <div class="checkbox">
                  <label>
                    <input type="checkbox"> Check me out
                  </label>
                </div>-->
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
          <!-- /.box -->

        

        </div>
        
        <!--/.col (left) -->
        <div class="col-md-6">
       <img width="200px" height="200px" src="<?php echo base_url().'uploads/'.$masterservice[0]['master_img']?>">
       </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 