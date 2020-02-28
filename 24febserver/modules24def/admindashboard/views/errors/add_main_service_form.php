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
              <h3 class="box-title">Add Main Service form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="<?php echo base_url()?>main-service-save" method="post" enctype="multipart/form-data">
              <div class="box-body">
                  <div class="form-group">
                  <label for="exampleInputPassword1">Select Master Service</label>
                 <select required class="form-control" name="master_service" id="masterservice">
                    <option value="">--Select Master Service--</option>
                   <?php foreach($servicelst as $maslst){ ?>
                        <option value="<?php echo $maslst['msid']?>"><?php echo $maslst['service_name']?></option>
                    
                     <?php }?>
                 </select>
                </div>
                   <div class="form-group">
                  <label for="exampleInputPassword1">Select Sub Service</label>
                 <select required class="form-control" name="sub_service" id="subserv">
                    <option value="">--Select Sub Service--</option>
                   
                 </select>
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Service Name</label>
                  <input type="text" name="service_name" class="form-control" id="" required placeholder="Enter Sub Service Name">
                </div>
                  <!--<div class="form-group">
                  <label for="exampleInputEmail1">Description</label>
                  <textarea name="service_des" class="form-control" id="" required placeholder="Enter Service Description"></textarea>
                  
                </div>-->
                  <div class="form-group">
                  <label for="exampleInputEmail1">Price</label>
                  <input type="text" name="price" class="form-control" id="" required placeholder="Enter Sub Service Name">
                </div>
                    <div class="form-group">
                  <label for="exampleInputPassword1">Select Location</label>
                 <select required class="form-control" name="location_name" id="subserv">
                    <option value="">--Select Sub Service--</option>
                    <option value="kanpur">Kanpur</option>
                    <option value="lucknow">Lucknow</option>
                   
                 </select>
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Your Promise</label>
                  <textarea name="promise" class="form-control" id="" required placeholder="Your Promise"></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Video Embded Code</label>
                  <textarea name="video" class="form-control" id="" required placeholder="Your tube embded code"></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Included Service</label>
                  <textarea name="included_service" class="form-control" id="" required placeholder="Your Included Service"></textarea>
                 
                </div>
                     <div class="form-group">
                  <label for="exampleInputEmail1">Note</label>
                  <textarea name="note" class="form-control" id="" required placeholder="Your Note"></textarea>
                 
                </div>
                   
                <div class="form-group">
                  <label for="exampleInputPassword1">Status</label>
                 <select name="status" required class="form-control">
                    <option value="">--Select Status--</option>
                    <option value="1">Active</option>
                     <option value="2">In-Active</option>
                 </select>
                </div>
              <!-- <div class="form-group">
                  <label for="exampleInputFile">File input</label>
                  <input type="file" name="img"  id="exampleInputFile">

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
       
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 