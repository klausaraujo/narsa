<!doctype html>
<html lang="en">
	<head>
		<!-- Loader Header -->
		<?php	require_once('inc/header.php');	?>
		<title>NARSA</title>
	</head>
	<body>
		<!-- loader Start -->
		<!--<div id="loading">
			<div id="loading-center">

			</div>
		</div>-->
		<!-- loader END -->
		<!-- Wrapper Start -->
		<div class="wrapper bg-narsa">
			<?php $data = array('usuario' => unserialize($this->session->userdata('user'))); ?>
			<!-- Sidebar  -->
			<?php $this->load->view('inc/nav-template',$data); ?>
			<!-- Sidebar END -->
			<!-- Page Content  -->
			<div id="content-page" class="content-page">
				<!-- TOP Nav Bar -->
				<?php $this->load->view('inc/nav-top-template',$data); ?>
				<!-- TOP Nav Bar END -->
				<div class="container-fluid">
				   <div class="row">
					  <div class="col-lg-12">
						 <!--<div class="row">
							<div class="col-md-6 col-lg-3">
							   <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
								  <div class="iq-card-body iq-bg-primary rounded">
									 <div class="d-flex align-items-center justify-content-between">
										<div class="rounded-circle iq-card-icon bg-primary"><i class="ri-user-fill"></i></div>
										<div class="text-right">                                 
										   <h2 class="mb-0"><span class="counter">5600</span></h2>
										   <h5 class="">Doctors</h5>
										</div>
									 </div>
								  </div>
							   </div>
							</div>
							<div class="col-md-6 col-lg-3">
							   <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
								  <div class="iq-card-body iq-bg-warning rounded">
									 <div class="d-flex align-items-center justify-content-between">
										<div class="rounded-circle iq-card-icon bg-warning"><i class="ri-women-fill"></i></div>
										<div class="text-right">                                 
										   <h2 class="mb-0"><span class="counter">3450</span></h2>
										   <h5 class="">Nurses</h5>
										</div>
									 </div>
								  </div>
							   </div>
							</div>
							<div class="col-md-6 col-lg-3">
							   <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
								  <div class="iq-card-body iq-bg-danger rounded">
									 <div class="d-flex align-items-center justify-content-between">
										<div class="rounded-circle iq-card-icon bg-danger"><i class="ri-group-fill"></i></div>
										<div class="text-right">                                 
										   <h2 class="mb-0"><span class="counter">3500</span></h2>
										   <h5 class="">Patients</h5>
										</div>
									 </div>
								  </div>
							   </div>
							</div>
							<div class="col-md-6 col-lg-3">
							   <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
								  <div class="iq-card-body iq-bg-info rounded">
									 <div class="d-flex align-items-center justify-content-between">
										<div class="rounded-circle iq-card-icon bg-info"><i class="ri-hospital-line"></i></div>
										<div class="text-right">                                 
										   <h2 class="mb-0"><span class="counter">4500</span></h2>
										   <h5 class="">Pharmacists</h5>
										</div>
									 </div>
								  </div>
							   </div>
							</div>
						 </div>-->
					  </div>
				   </div>
				</div>
				<!-- Footer -->
				<?php $this->load->view('inc/footer-template'); ?>
				<!-- Footer END -->
			</div>
			<!-- Page Content END -->
		</div>
		<!-- Wrapper END -->
		<?php	require_once('inc/footer.php');	?>
	</body>
</html>
