
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <?php if($this->session->flashdata('sucess')!="" || $this->session->flashdata('sucess')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('sucess');    ?>
              </div>  
			  
            <?php }?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      
      <div class="row">
        <div class="col-md-4">
          
        </div>
        <!-- /.col -->
        <div class="col-md-4">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes 
            <div class="widget-user-header bg-aqua-active">
              <h3 class="widget-user-username text-center"><?php echo strtoupper($this->session->userdata('username'));?></h3>
              <h5 class="widget-user-desc text-center">Welcome! You login as <?php echo strtoupper($this->session->userdata('username'));?> </h5>
              <br>
            </div>
            <div class="widget-user-image" style="top: 75px !important">
              <img class="img-circle" src="<?php echo base_url()?>assets/admin/images/avatar.png" alt="User Avatar">
            </div>-->
            
          </div>
          <!-- /.widget-user -->
        </div>
        <!-- /.col -->
        
        <!-- /.col -->
      </div>
       </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


   