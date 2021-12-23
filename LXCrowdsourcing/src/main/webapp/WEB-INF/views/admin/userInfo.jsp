<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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

					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mt-4 mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-6 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">완료한 태스크</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${missionCnt}/${missionTotalCnt} 회(${missionPctge}%)</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-6 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-success text-uppercase mb-1">보상</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${reward}" pattern="#,###" /> 원</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="mb-2">&nbsp;</div>
					<h2>워커 목록</h2>
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">
						<thead>
							<tr>
								<th>No.</th>
								<th>워커 이름</th>
								<th>워커 ID</th>
								<th>연락처</th>
								<th>성별</th>
								<th>생년월일</th>
								<th>나이</th>
								<th>이메일</th>
								<th>주소</th>
								<th>은행코드</th>
								<th>은행계좌</th>
								<th>계좌명</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${result.name}</td>
									<td>${result.user_id}</td>
									<td>${result.phone}</td>
									<td>${result.sex}</td>
									<td>${result.birth}</td>
									<td>${result.age}</td>
									<td>${result.email}</td>
									<td>${result.address}</td>
									<td>${result.bank_code}</td>
									<td>${result.bank_acct}</td>
									<td>${result.bank_name}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

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
	
	<!-- 개별 태스크 수행 결과 Modal -->
	<div class="modal fade" id="taskResultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="color:#000;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">개별 태스크 수행 결과</h5>
				</div>
				<div class="modal-body resultDiv">
					
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
	
	<!-- Page level plugins -->
	<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>

	<script>	
		$('.taskId').click(function() {
			$('#taskResultModal').modal('show');
			
			var idx = $('.taskId').index(this);
			
			$.ajax({
				type : "GET",
				url : "/admin/taskIdResultList",
				//data : JSON.stringify(params),
				data : {"resultId": $('[name=resultId]').eq(idx).val()},
				dataType : "json",				
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {	console.log(data);					
					if(data.result.length>0) {
						var html = '';
						html += '<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center;">';
						html += '	<thead>';
						html += '		<tr>';
						html += '			<th>No.</th>';
						html += '			<th>왼쪽 이미지</th>';
						html += '			<th>오른쪽 이미지</th>';
						html += '			<th>정답 이미지</th>';
						html += '			<th>평가 결과</th>';
						html += '		</tr>';
						html += '	</thead>';
						html += '	<tbody>';
						for(var i=0; i<data.result.length; i++) {
							var temp = '', temp1 = '';
							if(data.result[i].worker_answer == 'left') {
								temp = '왼쪽';
							} else if(data.result[i].worker_answer == 'right') {
								temp = '오른쪽';
							} else if(data.result[i].worker_answer == 'equal') {
								temp = '일치';
							}
							
							if(data.result[i].pre_answer == 'left') {
								temp1 = '왼쪽';
							} else if(data.result[i].pre_answer == 'right') {
								temp1 = '오른쪽';
							}
							html += '		<tr>';
							html += '			<th>'+ (i+1) +'</th>';							
							html += '			<th>'+ data.result[i].image_id1 +'</th>';
							html += '			<th>'+ data.result[i].image_id2 +'</th>';
							html += '			<th>'+ temp1 +'</th>';
							html += '			<th>'+ temp +'</th>';
							html += '		</tr>';
						}
						html += '	</tbody>';
						html += '<table>';
						
						$('.resultDiv').html(html);
					}
				}
			});
		});	
	</script>
</body>
</html>
