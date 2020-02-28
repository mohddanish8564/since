<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Add Main Service
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
              <h3 class="box-title">Edit Main Service form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?php echo base_url()?>main-service-edit-save" method="post" enctype="multipart/form-data">
              <div class="box-body">
                  <div class="form-group">
                  <label for="exampleInputPassword1">Select Master Service</label>
                  <input type="hidden" value="<?php echo $service[0]['sid']?>" name="update_id" >
                 <select required class="form-control" name="master_service" id="masterservice">
                    <option value="">--Select Master Service--</option>
                   <?php foreach($servicelst as $maslst){ ?>
                        <option <?php if($service[0]['msid']== $maslst['msid']){echo 'selected';}else{echo '';}?> value="<?php echo $maslst['msid']?>"><?php echo $maslst['service_name']?></option>
                    
                     <?php }?>
                 </select>
                </div>
                   <div class="form-group">
                  <label for="exampleInputPassword1">Select Sub Service</label>
                 <select required class="form-control" name="sub_service" id="subserv">
                    
                    <?php $field_arry1=array('ssmid'=>$service[0]['ssmsid']);
			         $mater_sub_ser=$this->Allfunction->getArray('*','sub_service_master',$field_arry1);?>
                    <option value="<?php echo $mater_sub_ser[0]['ssmid']?>"><?php echo $mater_sub_ser[0]['sub_ser_name']?></option>
                   
                 </select>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Service Name</label>
                  <input type="text" value="<?php echo $service[0]['service_name']?>" name="service_name" class="form-control" id="" required placeholder="Enter Sub Service Name">
                </div>
                  <!--<div class="form-group">
                  <label for="exampleInputEmail1">Description</label>
                  <textarea name="service_des" value="<?php echo $service[0]['service_des']?>" class="form-control" id="" required placeholder="Enter Service Description"></textarea>
                  
                </div>-->
                  <div class="form-group">
                  <label for="exampleInputEmail1">Price</label>
                  <input type="text" value="<?php echo $service[0]['price']?>" name="price" class="form-control" id="" required placeholder="Enter Sub Service Name">
                </div>
                    <div class="form-group">
                  <label for="exampleInputPassword1">Select Location</label>
                 <select required class="form-control" name="location_name" id="subserv">
                    <option value="">--Select Sub Service--</option>
                    <option <?php if($service[0]['location_name']=='kanpur'){echo 'selected';}else{echo '';}?> value="kanpur">Kanpur</option>
                    <option <?php if($service[0]['location_name']=='lucknow'){echo 'selected';}else{echo '';}?> value="lucknow">Lucknow</option>
                   
                 </select>
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Your Promise</label>
                  <textarea name="promise"  class="form-control" id="" required placeholder="Your Promise"><?php echo $service[0]['promise']?></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Video Embded Code</label>
                  <textarea name="video"  class="form-control" id="" required placeholder="Your tube embded code"><?php echo $service[0]['video']?></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Included Service</label>
                  <textarea name="included_service"  class="form-control" id="" required placeholder="Your Included Service"><?php echo $service[0]['included_service']?></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Note</label>
                  <textarea name="note" class="form-control"  id="" required placeholder="Your Note"><?php echo $service[0]['note'] ?></textarea>
                 
                </div>
                   
                <div class="form-group">
                  <label for="exampleInputPassword1">Status</label>
                 <select name="status" required class="form-control">
                    <option value="">--Select Status--</option>
                    <option <?php if($service[0]['service_status']=='1'){echo 'selected';}else{echo '';}?> value="1">Active</option>
                     <option <?php if($service[0]['service_status']=='2'){echo 'selected';}else{echo '';}?> value="2">In-Active</option>
                 </select>
                </div>
                
             <!--  <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="img"  id="exampleInputFile">

                  
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
       
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 