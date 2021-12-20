<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>InfoLab-크라우드소싱</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">

<!--     
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<link rel="stylesheet" type="text/css" href="/resources/semanticUI/semantic.min.css">
	<script src="/kakao/resources/semanticUI/semantic.min.js"></script>
 	-->

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center btn_root" href="#">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">설문조사</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
				<a class="nav-link btn_dash" href="#">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item active">
				<a class="nav-link btn_newEval" href="#">
					<i class="fas fa-fw fa-chart-area"></i> <span>새태스크 평가</span>
				</a>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link btn_mypage" href="#">
					<i class="fas fa-fw fa-cog"></i> <span>마이페이지</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				
				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">
			
					<span class="navbar-title ml-3">거리영상기반 보행환경 설문조사</span>
			
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
			
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="fas fa-search fa-fw"></i>
							</a> <!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
						</li>
			
						<div class="topbar-divider d-none d-sm-block"></div>
			
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 font-weight-bold">${workerInfo.name}</span> <img class="img-profile rounded-circle" src="/resources/img/undraw_profile.svg">
							</a> <!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
								</a>
							</div>
						</li>
						
					</ul>
			
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<form name="evalForm">					
					<input type="hidden" name="taskNum" value="${taskNum}"/>
					<input type="hidden" name="questAnswer" value=""/>					
					
					<div class="row mt-4">
						<div class="col-4 h2 font-weight-bold">Task ID: ${taskId}</div>
						<div class="col-7"></div>
						<div class="col-1 h4">[${taskNum}/55]</div>
					</div>
					<div class="row">
						<div class="col-12" style="color: #666666; text-align: center; font-size: 3em; font-weight: bold; padding-bottom: 20px;">어느쪽이 더 걷기 좋다고 생각하십니까?</div>
						<div class="col-12" style="color: #ff0000; text-align: center; font-size: 1em; padding-bottom: 20px;">* 태스크당 일치(=)를 10회 이상 선택시 재평가 대상이 될 수 있습니다.</div>
					</div>
					<div class="row">
						<div class="col-1">							
						</div>
						<div class="col-10">
							<div class="row">								 
								<div class="col-5">
									<p style="text-align: center;">
										<img src="http://info.rlog.kr:35000/images/${img1}" alt="" class="img-comparision img1">									
									</p>
								</div>
								<div class="col-2">
									<div class="eval-vs">
									<p>
									<img src="/resources/img/choice_3.png" class="img-comparision2 img3 img_c3-1">
									</p>
									</div>									
								</div>
								<div class="col-5" id="eee">
									<p style="text-align: center;">
										<img src="http://info.rlog.kr:35000/images/${img2}" alt="" class="img-comparision img2">									
									</p>
								</div>
							</div>
							<div class="row">								 
								<div class="col-5">									
									<p style="text-align: center;">
									<div style="text-align: center;">
										<img src="/resources/img/choice_2.png" class="img-radio img_c1">									
									</div>
									</p>
								</div>
								<div class="col-2">
									<p style="text-align: center;">
									<div style="text-align: center;">
										<img src="/resources/img/choice_2.png" class="img-radio img_c3">									
									</div>
									</p>							
								</div>
								<div class="col-5">
									<p style="text-align: center;">										
									<div style="text-align: center;">
										<img src="/resources/img/choice_2.png" class="img-radio img_c2">										
									</div>
									</p>
								</div>
							</div>								
						</div>						
						<div class="col-1">							
						</div>
					</div>
					
					<div class="row mb-2">
						<div class="col-12" style="text-align: center;margin-top:10px;">
							<a href="#" class="btn btn-primary btn-lg btn-icon-split btn_next">
								<span class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
								</span> <span class="text">Next</span>
							</a>
						</div>
					</div>
					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->
			
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; InfoLab 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
			
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">					 
					<a class="btn btn-primary" href="/">예</a>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>					
				</div>
			</div>
		</div>
	</div>

	<!-- 평가 종료 Modal
	<div class="pop-wrap" id="layer01" style="display: none">
		<dl>
			<dt class="pop-header">
				로그인
				<a href="#none" class="btnp-close">팝업창 닫힘</a>
			</dt>
			<dd class="pop-box">
				<div class="pop-cont">
					<div class="pop-msg">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
						<p>Lorem ipsum dolor sit amet, ipisicing.</p>
						<p>Lorem ipsu consectetur adipisicing.</p>
					</div>
				</div>
				<div class="pop-noti">
					<div>
						<input type="checkbox" name="" id="daychk01" /> <label for="daychk01">1주일간 보지 않기</label>
					</div>
				</div>
			</dd>
		</dl>
	</div>
 -->
<!-- 
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	-->

<!-- Modal -->
<div class="modal fade" id="alertEvalChoice" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">경고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        걷기 좋은 사진을 선택해 주십시오.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="alertEvalProcess" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">경고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        현재 진행중인 태스크가 취소됩니다. 그래도 진행하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger move" data-dismiss="modal">YES</button>        
        <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="taskStart" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-center" style="display:relative;">
        <h5 class="modal-title">거리영상기반 보행환경 설문조사</h5>        
      </div>
      <div class="modal-body text-center">
        태스크 ${taskId}을 시작합니다.
      </div>
      <div class="modal-footer justify-content-center">                
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
	 
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="/resources/js/jquery.loading.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
		
		window.history.pushState(null, document.title, location.href); 
			
		var choiceImg1 = 0;
		var choiceImg2 = 0;
		var choiceImg3 = 0;
		
		var taskNum = $('[name=taskNum]').val();
		var flag = $('[name=flag]').val();
		
		if(taskNum == '1') {
			$('#taskStart').modal('show')
		}
		
		$('.btn_newEval').click(function() {
			$('#alertEvalProcess').modal('show')
			
			$('.move').click(function() {
				location.href = '/evaluation/g2';				
			})			
		});
		
		$('.btn_dash').click(function() {
			$('#alertEvalProcess').modal('show')
			
			$('.move').click(function() {
				location.href = '/dashboard';				
			})			
		});
		
		$('.btn_mypage').click(function() {
			$('#alertEvalProcess').modal('show')
			
			$('.move').click(function() {
				location.href = '/mypage';				
			})			
		});
		
		$('.btn_root').click(function() {
			$('#alertEvalProcess').modal('show')
			
			$('.move').click(function() {
				location.href = '/dashboard';				
			})			
		});
				
		$(document).keydown(function(event) {
			if (event.keyCode == '32') {
				if (choiceImg1 == 0 && choiceImg2 == 0 && choiceImg3 == 0) {
					$('#alertEvalChoice').modal('show')

				} else {

					if (flag == "true") {
						//$('.evalEnd').show();

						$('[name="taskNum"]').val(taskNum);
						/*
						$('[name="evalForm"]').prop('action', '/evalEnd');
						$('[name="evalForm"]').prop('method', 'post');
						$('[name="evalForm"]').submit();
						 */

						var params = {
							"q1" : $('[name="questAnswerList"]').val()
						}

						$.ajax({
							type : "POST",
							url : "/evalEnd",
							data : JSON.stringify(params),
							dataType : "json",
							contentType : "application/json",
							error : function() {
								alert('통신실패!!');
							},
							success : function(data) {
								console.log(data);
							}
						});
					} else {
						$('#wrapper').loading();

						$('[name="taskNum"]').val(taskNum);

						$('[name="evalForm"]').prop('action', '/evaluation');
						$('[name="evalForm"]').prop('method', 'post');
						$('[name="evalForm"]').submit();
					}
				}
			}
		});

		$('.btn_next').click(function() {
			//$('#layer01').show();

			if (choiceImg1 == 0 && choiceImg2 == 0 && choiceImg3 == 0) {
				$('#alertEvalChoice').modal('show')

			} else {

				if (flag == "true") {
					//$('.evalEnd').show();

					$('[name="taskNum"]').val(taskNum);
					/*
					$('[name="evalForm"]').prop('action', '/evalEnd');
					$('[name="evalForm"]').prop('method', 'post');
					$('[name="evalForm"]').submit();
					 */

					var params = {
						"q1" : $('[name="questAnswerList"]').val()
					}

					$.ajax({
						type : "POST",
						url : "/evalEnd",
						data : JSON.stringify(params),
						dataType : "json",
						contentType : "application/json",
						error : function() {
							alert('통신실패!!');
						},
						success : function(data) {
							console.log(data);
						}
					});
				} else {
					$('#wrapper').loading();

					$('[name="taskNum"]').val(taskNum);

					$('[name="evalForm"]').prop('action', '/evaluation');
					$('[name="evalForm"]').prop('method', 'post');
					$('[name="evalForm"]').submit();
				}
			}
		});

		$('.img1,.img_c1').click(function() {
			if (choiceImg2 != 0) {
				$('.img_c2').prop('src', '/resources/img/choice_2.png');

				$('.img2').css('background-color', '#fff');
				choiceImg2 = 0;
			} else if (choiceImg3 != 0) {
				$('.img_c3').prop('src', '/resources/img/choice_2.png');
				$('.img_c3-1').prop('src', '/resources/img/choice_3.png');

				//$('.img3').css('background-color', '#fff');
				choiceImg3 = 0;
			}

			if (choiceImg1 == 0) {
				$('.img_c1').prop('src', '/resources/img/choice_1.png');

				$('[name="questAnswer"]').val("1");

				$('.img1').css('background-color', '#3AF870');
				choiceImg1 = 1;
			} else {
				$('.img_c1').prop('src', '/resources/img/choice_2.png');
				$('.img1').css('background-color', '#fff');
				choiceImg1 = 0;
			}
		});

		$('.img2,.img_c2').click(function() {
			if (choiceImg1 != 0) {
				$('.img_c1').prop('src', '/resources/img/choice_2.png');

				$('.img1').css('background-color', '#fff');
				choiceImg1 = 0;
			} else if (choiceImg3 != 0) {
				$('.img_c3').prop('src', '/resources/img/choice_2.png');
				$('.img_c3-1').prop('src', '/resources/img/choice_3.png');

				//$('.img3').css('background-color', '#fff');
				choiceImg3 = 0;
			}

			if (choiceImg2 == 0) {
				$('.img_c2').prop('src', '/resources/img/choice_1.png');

				$('[name="questAnswer"]').val("2");

				$('.img2').css('background-color', '#3AF870');
				choiceImg2 = 1;
			} else {
				$('.img_c2').prop('src', '/resources/img/choice_2.png');
				$('.img2').css('background-color', '#fff');
				choiceImg2 = 0;
			}
		});

		$('.img3,.img_c3').click(function() {
			if (choiceImg1 != 0) {
				$('.img_c1').prop('src', '/resources/img/choice_2.png');

				$('.img1').css('background-color', '#fff');
				choiceImg1 = 0;
			} else if (choiceImg2 != 0) {
				$('.img_c2').prop('src', '/resources/img/choice_2.png');

				$('.img2').css('background-color', '#fff');
				choiceImg2 = 0;
			}

			if (choiceImg3 == 0) {
				$('.img_c3').prop('src', '/resources/img/choice_1.png');
				$('.img_c3-1').prop('src', '/resources/img/choice_4.png');

				$('[name="questAnswer"]').val("3");

				//$('.img3').css('background-color', '#456BD8');
				choiceImg3 = 1;
			} else {
				$('.img_c3').prop('src', '/resources/img/choice_2.png');
				$('.img_c3-1').prop('src', '/resources/img/choice_3.png');
				//$('.img3').css('background-color', '#fff');
				choiceImg3 = 0;
			}
		});
	</script>

</body>
</html>
