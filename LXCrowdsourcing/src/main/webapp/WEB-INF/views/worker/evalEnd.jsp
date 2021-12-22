<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		
		<%@ include file="../layout/left.jsp" %>
		
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				
				<%@ include file="../layout/top.jsp" %>
				
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<form name="evalForm">
						<input type="hidden" name="taskId" value="${taskId}" />
						<input type="hidden" name="taskNum" value="${taskNum}" /> 
						<input type="hidden" name="flag" value="${flag}" />
						<div class="row">
							<div class="col-12 finish-title">
								<p>태스크 ID ${taskId}이 완료되었습니다.</p>
							</div>
						</div>
						<div class="row">
							<div class="col-4"></div>
							<div class="col-4 finish-cont">
								<div class="finish-cont-middle">
									<div class="finish-cont-top">
										평가 결과
									</div>
									<hr style="margin-bottom: 30px;" />
									<div class="finish-cont-detail" style="text-align: center;">
										- 평가 횟수 : ${taskNum} 회
									</div>
									<div class="finish-cont-detail" style="text-align: center;">
										- 평가 시간 : ${elapsedTime} 초
									</div>									
									<div class="finish-cont-detail">
										<p style="margin-top: 20px; text-align: center;">
											평가 유효성 : 
											<c:if test="${evalValid == 'Y'}">적합(${correct}/5)</c:if>
											<c:if test="${evalValid == 'N'}"><font style="color:red;">부적합(${correct}/5)</font></c:if>
											<c:if test="${evalValid == 'N'}">
											<div style="color:red;margin: 10px 100px 10px 100px;">
												당신은 5개의 랜덤 유효성 테스트 중 ${5-correct}개의 정답을 틀렸기 때문에 유효성 부적합이 되었습니다.												
											</div>
											</c:if>
										</p>
									</div>
								</div>
							</div>							
							<div class="col-4"></div>
						</div>

						<div class="row">
							<div class="col-4"></div>
							<div class="col-4" style="text-align: center;">
								<a href="#" class="btn btn-success btn-icon-split btn_finish">									 
									<span class="text">평가 종료</span>
								</a>&nbsp;&nbsp;&nbsp;
								<c:if test="${evalValid == 'N'}">
								<a href="#" class="btn btn-danger btn-icon-split btn_evalRe">									 
									<span class="text">다시 평가하기</span>
								</a>								
								</c:if>
								<c:if test="${evalValid == 'Y'}">
								<a href="#" class="btn btn-primary btn-icon-split btn_evalNew">									 
									<span class="text">새 태스크 평가</span>
								</a>								
								</c:if>
							</div>							
							<div class="col-4"></div>
						</div>
					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			
			<%@ include file="../layout/bottom.jsp" %>
			
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

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
		
		var taskNum = $('[name=taskNum]').val();
		var flag = $('[name=flag]').val();
		
		$('.btn_finish').click(function() {
			location.href = '/dashboard';		
		});

		
		$('.btn_evalRe').click(function() {
			location.href = '/evaluation/g2?taskId='+$('[name="taskId"]').val();		
		});
		
		$('.btn_evalNew').click(function() {
			location.href = '/evaluation/g2';		
		});
		
	</script>

</body>
</html>
