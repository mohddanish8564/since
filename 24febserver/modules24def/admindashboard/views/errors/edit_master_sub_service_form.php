<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Edit Sub Master Service
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
              <h3 class="box-title">Edit Sub Master Service form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?php echo base_url()?>edit-master-sub-service-save" method="post" enctype="multipart/form-data">
              <div class="box-body">
                  <div class="form-group">
                  <label for="exampleInputPassword1">Select Master Service</label>
                 <select required class="form-control" name="master_service">
                    <option value="">--Select Master Service--</option>
                   <?php foreach($servicelst as $maslst){ ?>
                        <option <?php if($mastersubservice[0]['msid']==$maslst['msid']){echo 'selected=selected';}else{echo '';}?> value="<?php echo $maslst['msid']?>"><?php echo $maslst['service_name']?></option>
                    
                     <?php }?>
                 </select>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Sub Service Name</label>
                  <input type="hidden" value="<?php echo $ssmid?>" name="update_id" />
                  <input type="hidden" value="<?php echo $mastersubservice[0]['sub_img'] ?>" name="hidimg" /> 
                  <input type="text" value= "<?php echo $mastersubservice[0]['sub_ser_name']?>" name="sub_service_name" class="form-control" id="" required placeholder="Enter Sub Service Name">
                </div>
                  <div class="form-group">
                  <label for="exampleInputEmail1">Sub Service Name</label>
                  <textarea name="sub_service_des" class="form-control" id="" required placeholder="Enter Service Description"><?php echo $mastersubservice[0]['sub_service_des']?></textarea>
                  
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Status</label>
                 <select name="status" required class="form-control">
                    <option value="">--Select Status--</option>
                    <option <?php if($mastersubservice[0]['sub_sev_status']==1){echo 'selected=selected';}else{echo '';}?> value="1">Active</option>
                     <option <?php if($mastersubservice[0]['sub_sev_status']==2){echo 'selected=selected';}else{echo '';}?> value="2">In-Active</option>
                 </select>
                </div>
               <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="img"  id="exampleInputFile">

                  <p class="help-block">Example block-level help text here.</p>
                </div>
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
        <img src="<?php echo base_url().'uploads/'.$mastersubservice[0]['sub_img'] ?>" />
       </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 