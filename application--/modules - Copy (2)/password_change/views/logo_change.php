<!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

      <h1>

     Change Logo

       <!-- <small>advanced tables</small>-->

      </h1>

      <ol class="breadcrumb">

        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

        <li class="active">Change Logo</li>

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
         <?php if($this->session->flashdata('error')!="" || $this->session->flashdata('error')!=null){?>
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('error');    ?>
              </div>    
            <?php }?>



          <div class="box">

            <div class="box-header">

             <!-- <h3 class="box-title"><a class="btn btn-success" href="<?php echo base_url()?>add-flex-entry">+ Add Entry</a></h3>-->

            </div>

            <!-- /.box-header -->
	
	<form role="form" action="<?php echo base_url()?>change-logo-update" method="post" enctype="multipart/form-data"> 
					<input type="hidden" name="update_id" value="<?php echo $this->session->userdata('user_id');?>">
                        <div class="form-group">
                            <label for="cc-payment" class="control-label mb-1"><?php echo $text1;?> Image( max 1 MB) also format should be(png / jpg /jpeg ) </label>
        <input id="c" required name="logo" type="file" class="form-control"  >
                        </div>
						 <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-flat m-b-15">Submit</button>
						 <a  onclick="window.history.go(-1);" class="btn btn-info">Cancel</a> 
						</div>
					
                    </form>
              

          </div>

          <!-- /.box -->

        </div>

        <!-- /.col -->

      </div>

      <!-- /.row -->

    </section>

    <!-- /.content -->

  </div>

   

        

                
  