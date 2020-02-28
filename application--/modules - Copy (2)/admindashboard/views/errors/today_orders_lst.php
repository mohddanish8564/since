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
                  <th>Order Id</th>
                  <th>Service Image</th>
                   <th>Service Name</th>
                  <th>Name</th>
                  <th>Email</th>
                   <th>Phone</th>
                   <th>Location</th>
                    <th>Address</th>
                    
                    <th>Booking & time</th>
                     <th>Reqested date & time</th>
                   <th>Amount</th>
                   <th>Action</th>
                  
                </tr>
                </thead>
                <tbody>
                    <?php $sr=1; foreach($today_lst as $lst){
                      $field_arry11=array('order_id'=>$lst['order_id']);
				$item1=$this->Allfunction->getArray('*','cart',$field_arry11);
        $sub1=0;foreach($item1 as $items1){
				$field_arry1=array('sid'=>$items1['item_id']);
	            $mainservice1=$this->Allfunction->getArray('*','service',$field_arry1);
				
				$field_arry11=array('ssmid'=>$mainservice1[0]['ssmsid']);
				$mastersubservice_sub_service1=$this->Allfunction->getArray('*','sub_service_master',$field_arry11);
				
				$field_arry21=array('msid'=>$mastersubservice_sub_service1[0]['msid']);
				$master_service1=$this->Allfunction->getArray('*','master_services',$field_arry21);
				$sub1=$sub1+($mainservice1[0]['price']*$items1['quantity']);
        }
                      
                      ?>
                <tr>
                  <td><?php echo $sr++;?></td>
                  <td><?php echo $lst['order_id']?></td>
                  <td><img width="80" height="80" src="<?php echo base_url().'uploads/'.$mastersubservice_sub_service1[0]['sub_img']?>"></td>
                  <td><?php echo $master_service1[0]['service_name'].' => '.$mastersubservice_sub_service1[0]['sub_ser_name'].' => '.$mainservice1[0]['service_name']?>
           </td>
                  <td><?php echo $lst['name']?></td>
                   <td><?php echo $lst['email'] ?></td>
                    <td><?php echo $lst['phone']?> </td>
                   <td><?php echo $lst['location']?></td>
                   <td><?php echo $lst['address'].' ('.$lst['zip'].')'?></td>
                   
                    <td><?php echo $lst['requested_date']?></td>
                   <td><?php echo date('d/m/Y',strtotime($lst['booking_date'])). '  - '.$lst['req_time']?></td>
                   <td><?php echo $lst['tota_price']?></td>
                   <td><a data-toggle="modal" data-target="#myModal<?php echo $sr?>" class="btn btn-success" href="<?php //echo base_url().'update-order-status/'.$lst['srid']?>">Update Status</a>
                 </td>
                 
                </tr>
                <div id="myModal<?php echo $sr?>" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color:#E81212">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:#fff">Action Performed By Admin</h4>
      </div>
      <div class="modal-body">
        
        <form method="post" action="<?php echo base_url()?>update-order-to-complete" >
        
				<div class="col-md-12" style="margin-bottom: 15px;">

							<div class="col-md-3"><b>Image</b></div>
              	<div class="col-md-4"><b>Service</b></div>
                	<div class="col-md-2"><b>Price</b></div>
                  	<div class="col-md-2"><b>Quatity</b></div>
                    	<div class="col-md-1"><b>Total</b> </div>
				
			 </div>
        <br>
		
				
			<?php $field_arry1=array('order_id'=>$lst['order_id']);
				$item=$this->Allfunction->getArray('*','cart',$field_arry1);
        $sub=0;foreach($item as $items){
				$field_arry=array('sid'=>$items['item_id']);
	            $mainservice=$this->Allfunction->getArray('*','service',$field_arry);
				
				$field_arry1=array('ssmid'=>$mainservice[0]['ssmsid']);
				$mastersubservice_sub_service=$this->Allfunction->getArray('*','sub_service_master',$field_arry1);
				
				$field_arry2=array('msid'=>$mastersubservice_sub_service[0]['msid']);
				$master_service=$this->Allfunction->getArray('*','master_services',$field_arry2);
				$sub=$sub+($mainservice[0]['price']*$items['quantity']);
				?>
								<div class="col-md-12" style="margin-bottom:5px">

							<div class="col-md-3">
							
								<img width="80" height="80" src="<?php echo base_url().'uploads/'.$mastersubservice_sub_service[0]['sub_img']?>">
						   </div>

						<div class="col-md-4">
						<?php echo $master_service[0]['service_name'].' => '.$mastersubservice_sub_service[0]['sub_ser_name'].' => '.$mainservice[0]['service_name']?>
            </div>

						<div class="col-md-2">
							
              
              <?php echo $mainservice[0]['price']?></span>
             </div>

					<div class="col-md-2">
								
		
		             <?php echo $items['quantity']?>
          </div>
							<div class="col-md-1">

				
							<?php echo $mainservice[0]['price']*$items['quantity']?>
           </div>
					</div>
                
							
								<?php }?>
                <br><input type="hidden" value="<?php echo $items['order_id']?>" name="update_id">
                <p>Please change order status if you have got the Payment </p>
	        <div class="col-md-12">
            <div class="col-md-6">
           <select required class="form-control"><option value="">--Select to Complete--</option><option value="1">Complete</option></select></div>
            <div class="col-md-6"><input  class="btn btn-default" type="submit" value="Complete" name="complete"></div>
          </div>
        </form>
     
      <div class="modal-footer">
      <button type="button" class=" btn btn-warning" data-dismiss="modal">Close</button>
      </div>
    </div>
 </div>
  </div>
</div>
                <?php }?>
                </tbody>
             
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
 