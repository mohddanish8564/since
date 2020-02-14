<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/css/AdminLTE.min.css">
  <!-- iCheck -->
 

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo"><b>DM Demo</b>
    <a href="<?php echo base_url()?>"></a>
  </div>
  <!-- /.login-logo -->
  
			<?php if($this->session->flashdata('error')!="" || $this->session->flashdata('error')!=null){?>
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('error');    ?>
              </div>    
            <?php }?>
			<?php if($this->session->flashdata('sucess')!="" || $this->session->flashdata('sucess')!=null){?>
              <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('sucess');    ?>
              </div>    
            <?php }?>
  <div class="login-box-body">
    <p class="login-box-msg">Change Password</p>

      <?php	$attributes = array( 'id' => 'forgot-pass-mail','action'=>'post' );

		echo form_open(base_url().'forgot-pass-mail', $attributes); ?> 
      <div class="form-group has-feedback">
        <input type="email" class="form-control" required placeholder="Email" name="email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
  
      <div class="row">
   
        <div class="col-xs-6">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Change Password</button>
        </div>
		<a href="<?php echo base_url()?>admin" class="text-center">Login</a><br>
		<a href="<?php echo base_url()?>user-register" class="text-center">Register a new membership</a>
        <!-- /.col -->
      </div>
      <?php echo form_close();?>


  </div>
  <!-- /.login-box-body -->
</div>


</body>
</html>
