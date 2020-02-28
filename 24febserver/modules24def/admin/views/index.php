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
 
  <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/css/util.css">
   <link rel="stylesheet" href="<?php echo base_url()?>assets/admin/css/main.css">
  <link rel="stylesheet" href="https://colorlib.com/etc/lf/Login_v1/css/main.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>


  <style>
  .container-login100{
       min-height:99.6vh !important;
 background: url(<?php echo ASSETS_URL ?>/img/pattern/tileable_wood_texture.png) !important;
	  background-image: linear-gradient(to right, rgb(84, 81, 81), rgb(58, 51, 51));
}
  .login100-pic img {
    max-width: 100%;
	 
    box-shadow: 4px 2px 18px #807e7e;
}
.wrap-login100{
	 padding: 41px 130px 37px 95px !important;
		    min-height: 63vh !important;
	background: #f2f2f1ed !important;
}

.alert-validate::before{
	top: -18% !important;
}


@import url(https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300);

.container {position: fixed; top: 25%; left: 25%;}

/* make keyframes that tell the start state and the end state of our object */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fade-in {
  opacity:0;  /* make things invisible upon start */
  -webkit-animation:fadeIn ease-in 1;  /* call our keyframe named fadeIn, use animattion ease-in and repeat it only 1 time */
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;  /* this makes sure that after animation is done we remain at the last keyframe value (opacity: 1)*/
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fade-in.one {
  -webkit-animation-delay: 0.5s;
  -moz-animation-delay: 0.5s;
  animation-delay: 0.5s;
}

.fade-in.two {
  -webkit-animation-delay: 1.2s;
  -moz-animation-delay:1.2s;
  animation-delay: 1.2s;
}

.fade-in.three {
  -webkit-animation-delay: 1.6s;
  -moz-animation-delay: 1.6s;
  animation-delay: 1.6s;
}

/*---make a basic box ---*/
.box{


}

.wrap-input100{
    border-radius:27px !important;
}
.login100-form-btn{
 /* background:#ff7f08; */
    background-image: linear-gradient(to right, rgb(84, 81, 81), rgb(58, 51, 51));
}

.p-t-136 {
    
    padding-top: 43px !important;
}


.input100:focus + .focus-input100 + .symbol-input100,a:hover {
    color: #ff7f08 !important;
}

.focus-input100 {
   color: rgb(255, 134, 11) !important;
}
.alert.alert-danger {
    width: 100%;
}

@keyframes slideInFromLeft {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(0);
  }
}
.animateimg{
  animation: 1s ease-out 0s 1 slideInFromLeft;
}


.limiter.box.fade-in.one {
    border-color: #fff;
}

@media only screen and (max-width: 600px) {
   .wrap-login100{
	 padding: 20px !important;
        background-color: lightblue;
    }
}

  </style>
</head>
<body>

	<div class="limiter box fade-in one">
		<div class="container-login100">
			<div class="wrap-login100">
				
				<div class="login100-pic js-tilt" data-tilt="" style="will-change: transform; transform: perspective(300px) rotateX(0deg) rotateY(0deg);">
					<img class="animateimg" src="<?php echo ASSETS_URL ?>/img/logo.jpg" alt="logo" title="Move Mouse Here & There !!!">
				</div>
			<?php
			
			$attributes = array( 'id' => 'adminlogin','action'=>'post','class'=>'login100-form validate-form' );

		echo form_open(base_url().'admin-login', $attributes); ?> 

				<form class="login100-form validate-form">
					<span class="login100-form-title">Administrator Login</span>
					<!-- error -->
									<?php if($this->session->flashdata('error')!="" || $this->session->flashdata('error')!=null){?>
              <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('error');    ?>
              </div>    
            <?php }?>
			<?php if($this->session->flashdata('info')!="" || $this->session->flashdata('info')!=null){?>
              <div class="alert alert-warning">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                
                            <?php echo $this->session->flashdata('info');    ?>
              </div>    
            <?php } ?>
            
            
            <!-- error end -->

					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<input class="input100" type="text" name="username" placeholder="Username" autocomplete="off" maxlength="45">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password" placeholder="Password" autocomplete="off">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Allow Me Access
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<!--<a class="txt2" href="#">Powered by AGR INFOSOLUTIONS PVT. LTD.<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>-->
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>




<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/lf/Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/lf/Login_v1/vendor/bootstrap/js/popper.js"></script>
	<script src="https://colorlib.com/etc/lf/Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/lf/Login_v1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/lf/Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!-- Global site tag (gtag.js) - Google Analytics -->

<!--===============================================================================================-->
	<script src="https://colorlib.com/etc/lf/Login_v1/js/main.js"></script>



</body>
</html>
