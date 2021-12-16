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
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">설문조사</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="/dashboard">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
				</a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link" href="/evaluation">
					<i class="fas fa-fw fa-chart-area"></i> <span>새태스크 평가</span>
				</a>
			</li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link" href="/mypage">
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
												
					</ul>
			
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container mb-5">
					
					<div class="mb-2">&nbsp;</div>
					<form id="registForm" class="form-horizontal" method="POST" onSubmit="registcall();return false">						
						<h2>회원가입</h2>						
						 <div class="form-group">
							<label for="userId" class="col-sm-3 control-label">아이디<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="user_id" id="userId" placeholder="아이디 4-12자" class="form-control" maxlength="12" required autofocus>
								<span class="regist-idchk"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="userId" class="col-sm-3 control-label">학번<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="stdt_no" id="stdtNo" placeholder="학번을 입력해 주십시오." class="form-control" maxlength="20" required>								
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Password<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="password" id="passwd1" placeholder="영문/숫자 조합 4-12자" class="form-control" maxlength="12" required>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Confirm Password<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="password" id="passwd2" placeholder="영문/숫자 조합 4-12자" class="form-control" maxlength="12" required>
							</div>
						</div>
						<div class="form-group">
							<label for="firstName" class="col-sm-3 control-label">이름<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="name" id="name" placeholder="이름을 입력해 주십시오." class="form-control" required autofocus>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">E-메일<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="email" name="email" id="email" placeholder="E-메일을 입력해 주십시오." class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label for="birthDate" class="col-sm-3 control-label">생년월일<span class="necessary">*</span></label>
							<div class="col-sm-9">								
								<select name="birth1" class="col-sm-2 form-control" style="display:inline-block" required>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000" selected>2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
								</select>
								-
								<select name="birth2" class="col-sm-2 form-control" style="display:inline-block" required>
									<option value="">선택</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								-
								<input type="text" name="birth3" id="birth3" class="col-sm-2 form-control" style="display:inline-block" maxlength="2" required>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="col-sm-3 control-label">연락처(핸드폰)<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="phoneNumber" name="phone" id="phone" placeholder="연락처를 입력해 주십시오." class="form-control" required>
							</div>
						</div>						
						<div class="form-group">
							<label class="control-label col-sm-3">성별<span class="necessary">*</span></label>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio" name="sex" id="maleRadio" value="Male" required>남성
										</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio" name="sex" id="femaleRadio" value="Female" required>여성
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<label for="phoneNumber" class="control-label">입금계좌<span class="necessary">*</span></label>  &nbsp;&nbsp;&nbsp;							
								<select name="bank_code" id="bank_code" onchange="sel(this.value)" required>
									<option value="" selected="">은행선택</option>
									<option value="BK04">국민은행</option>
									<option value="BK03">기업은행</option>
									<option value="BK88">신한은행</option>
									<option value="BK37">전북은행</option>
									<option value="BK11">농협</option>
									<option value="BK71">우체국</option>	
									<option value="BK89">케이뱅크</option>
									<option value="BK90">카카오뱅크</option>
									<option value="BK05">외환은행</option>
									<option value="BK20">우리은행</option>
									<option value="BK45">새마을금고</option>
									<option value="BK07">수협</option>									
									<option value="BK48">신협</option>									
								</select>  &nbsp;
								계좌주명 : <input type="text" name="bank_name" id="bank_name" placeholder="계좌주명을 입력하세요" title="이름" style="width:150px;" maxlength="30" required> &nbsp;					
								계좌번호 : <input type="text" name="bank_acct" id="bank_acct" placeholder="계좌번호를 입력하세요" title="계좌번호" style="width:250px;" maxlength="50" required>							
							</div>
						</div>
						
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<span class="help-block necessary">*필수 입력</span>
							</div>
						</div>
						<button type="submit" class="btn btn-primary btn-block">등록 완료</button>
					</form>
					<!-- /form -->
				</div>
				<!-- ./container -->
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

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
		var idValid = false;
		
		$("#userId").keyup(function() {
	        //console.log($(this).val());
			if($(this).val() != '' && !/^[a-zA-Z]/.test($(this).val())){
			    alert("아이디는 영문으로 시작해야 합니다.");
			    $(this).val('');
			    
			    idValid = false;
			} else if($(this).val().length < 4) {
	        	$('.regist-idchk').css('color','#ff0000');
	        	$('.regist-idchk').text('* 아이디 글자수는 4-12자 입니다.');
	        	
	        	idValid = false;
	        } else if($(this).val().length >= 4) {
	        	$.ajax({
					type : "POST",
					url : "/idchk",
					data : JSON.stringify({"user_id":$(this).val()}),
					dataType : "json",
					contentType : "application/json",
					error : function() {
						alert('통신실패!!');
					},
					success : function(data) {
						console.log(data);
						if(data.result == '1') {
							$('.regist-idchk').css('color','#ff0000');
							$('.regist-idchk').text('* 이미 사용중인 아이디 입니다. 다른 아이디를 입력해 주세요.');
							
							idValid = false;
						} else {
							$('.regist-idchk').css('color','#858796');
							$('.regist-idchk').text('* 사용할 수 있는 아이디 입니다.');
							
							idValid = true;
						}
					}
				});
	        }	        
	    });
	
		function registcall() {
			/*
			if($('#userId').val().length < 4) {
				alert("아이디를 4자 이상 입력하십시오.");
				$('#userId').focus();
				return false;
			}
			*/
			
			if(!idValid) {
				alert("사용할 수 있는 아이디가 아닙니다. 아이디를 다시 입력해 주십시오.");
				$('#userId').focus();
				return false;
			}
			
			if($('#passwd1').val().length < 4) {
				alert("비밀번호를 4자 이상 입력하십시오.");
				$('#passwd1').focus();
				return false;
			}
			
			if($('#passwd2').val().length < 4) {
				alert("비밀번호를 4자 이상 입력하십시오.");
				$('#passwd2').focus();
				return false;
			}
			
			if($('#passwd1').val() != $('#passwd2').val()) {
				alert('비밀번호가 일치하지 않습니다.')
				$('#passwd1').focus();
				return false;
			}
			
			var params = {
				"user_id" : $('#userId').val(),
				"stdt_no" : $('#stdtNo').val(),
				"passwd" : $('#passwd1').val(),
				"name" : $('[name="name"]').val(),
				"email" : $('[name="email"]').val(),
				"birth" : $('[name="birth1"]').val()+'-'+$('[name="birth2"]').val()+'-'+$('[name="birth3"]').val(),
				"phone" : $('[name="phone"]').val(),
				"sex" : $("input[name='sex']:checked").val(),
				"bank_code" : $('#bank_code').val(),
				"bank_name" : $('#bank_name').val(),
				"bank_acct" : $('#bank_acct').val()
			}
			//console.log(params);
			$.ajax({
				type : "POST",
				url : "/regist",
				data : JSON.stringify(params),
				dataType : "json",
				contentType : "application/json",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
					console.log(data);
					alert("회원가입이 완료되었습니다.");
					location.href = '/dashboard';
				}
			});

			return false;
		}
	</script>

</body>
</html>
