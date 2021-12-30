<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
				<div class="container">
					<div class="mb-2">&nbsp;</div>
					<form id="form" class="form-horizontal" role="form" method="POST" onSubmit="mypagecall();return false">
						<input type="hidden" name="worker_id" id="worker_id" value="${result.worker_id}" />		
						<input type="hidden" name="user_id" id="user_id" value="${result.user_id}" />
						<h2>마이페이지</h2>
						<div class="form-group">
							<label for="firstName" class="col-sm-3 control-label">이름<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="name" id="name" placeholder="이름을 입력해 주십시오." class="form-control" value="${result.name}" readonly required>
							</div>
						</div>			
						<!-- 
						<div class="form-group">
							<label for="userId" class="col-sm-3 control-label">학번<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="stdt_no" id="stdtNo" placeholder="학번을 입력해 주십시오." class="form-control" value="${result.stdt_no}" readonly required>								
							</div>
						</div>		
						 -->	
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Password</label>
							<div class="col-sm-9">
								<button type="button" class="btn btn-secondary btn_passwdMod">Password 변경</button>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">E-메일<span class="necessary">*</span> </label>
							<div class="col-sm-9">
								<input type="email" name="email" id="email" placeholder="E-메일을 입력해 주십시오." class="form-control" value="${result.email}" readonly required>
							</div>
						</div>
						<!-- 
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Password*</label>
							<div class="col-sm-9">
								<input type="password" id="password" placeholder="Password" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Confirm Password*</label>
							<div class="col-sm-9">
								<input type="password" id="password" placeholder="Password" class="form-control">
							</div>
						</div>
						 -->
						<div class="form-group">
							<label for="birthDate" class="col-sm-3 control-label">생년월일<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<!-- 
								<input type="date" name="birth" id="birth" class="form-control" value="${result.birth}" readonly required>
								 -->
								 <select name="birth1" id="birth1" class="col-sm-2 form-control" style="display:inline-block" disabled required>
									<c:set var="endYear" value="2010"></c:set>
									<c:forEach var="i" begin="0" end="60" step="1">
										<option value="${endYear-i}" <c:if test="${(endYear-i) eq fn:split(result.birth,'-')[0]}">selected</c:if>>${endYear-i}</option>    
									</c:forEach>
								</select>
								-
								<select name="birth2" id="birth2" class="col-sm-2 form-control" style="display:inline-block" disabled required>
									<option value="">선택</option>
									<option value="01" <c:if test="${fn:split(result.birth,'-')[1] == '01'}">selected</c:if>>1</option>
									<option value="02" <c:if test="${fn:split(result.birth,'-')[1] == '02'}">selected</c:if>>2</option>
									<option value="03" <c:if test="${fn:split(result.birth,'-')[1] == '03'}">selected</c:if>>3</option>
									<option value="04" <c:if test="${fn:split(result.birth,'-')[1] == '04'}">selected</c:if>>4</option>
									<option value="05" <c:if test="${fn:split(result.birth,'-')[1] == '05'}">selected</c:if>>5</option>
									<option value="06" <c:if test="${fn:split(result.birth,'-')[1] == '06'}">selected</c:if>>6</option>
									<option value="07" <c:if test="${fn:split(result.birth,'-')[1] == '07'}">selected</c:if>>7</option>
									<option value="08" <c:if test="${fn:split(result.birth,'-')[1] == '08'}">selected</c:if>>8</option>
									<option value="09" <c:if test="${fn:split(result.birth,'-')[1] == '09'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${fn:split(result.birth,'-')[1] == '10'}">selected</c:if>>10</option>
									<option value="11" <c:if test="${fn:split(result.birth,'-')[1] == '11'}">selected</c:if>>11</option>
									<option value="12" <c:if test="${fn:split(result.birth,'-')[1] == '12'}">selected</c:if>>12</option>
								</select>
								-
								<input type="text" name="birth3" id="birth3" class="col-sm-2 form-control" style="display:inline-block" value="${fn:split(result.birth,'-')[2]}" maxlength="2" readonly required>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="col-sm-3 control-label">연락처(핸드폰)<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="phoneNumber" name="phone" id="phone" placeholder="연락처를 입력해 주십시오." class="form-control" value="${result.phone}" readonly required>
							</div>
						</div>	
						<div class="form-group">
							<label for="phoneNumber" class="col-sm-3 control-label">주소<span class="necessary">*</span></label>
							<div class="col-sm-9">
								<input type="text" name="address" id="address" placeholder="주소를 입력해 주십시오." class="form-control" value="${result.address}" readonly required>
							</div>
						</div>					
						<div class="form-group">
							<label class="control-label col-sm-3">성별<span class="necessary">*</span></label>
							<div class="col-sm-6">
								<div class="row">
								<input type="hidden" name="sex_type" value="${result.sex}" />
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio" name="sex" id="maleRadio" value="Male" disabled required>남성
										</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input type="radio" name="sex" id="femaleRadio" value="Female" disabled required>여성
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<label for="phoneNumber" class="control-label">입금계좌<span class="necessary">*</span></label>  &nbsp;&nbsp;&nbsp;							
								<select name="bank_code" id="bank_code" class="form-control" style="display:inline;width:120px;" onchange="sel(this.value)" required disabled>
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
								계좌주명 : <input type="text" name="bank_name" id="bank_name" class="form-control" placeholder="계좌주명을 입력하세요" title="이름" style="display:inline;width:150px;" value="${result.bank_name}" readonly required> &nbsp;					
								계좌번호 : <input type="text" name="bank_acct" id="bank_acct" class="form-control" placeholder="계좌번호를 입력하세요" title="계좌번호" style="display:inline;width:250px;" value="${result.bank_acct}" readonly required>							
							</div>
						</div>
						
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<span class="help-block necessary">*필수 입력</span>
							</div>
						</div>
						<div class="div_modChk mt-5">
							<button type="button" class="btn btn-secondary btn-block btn_modChk">수정 하기</button>
						</div>
						<div class="div_modComp">
							<button type="button" class="btn btn-danger btn-block_half btn_modCancel">수정 취소</button>
							<button type="submit" class="btn btn-primary btn-block_half">수정 완료</button>
						</div>
					</form>
					<!-- /form -->
				</div>
				<!-- ./container -->
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
					<h5 class="modal-title">로그아웃</h5>
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

	<!-- 비밀번호변경 Modal-->
	<div class="modal fade" id="passwdModModal" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document" style="max-width:700px;">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 변경</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">현재 비밀번호<span style="color:#ff0000">*</span></label>
						<div class="col-sm-9">
							<input type="password" id="passwd0" placeholder="현재 비밀번호를 입력해 주십시오." class="form-control" maxlength="12" required>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">새 비밀번호<span style="color:#ff0000">*</span></label>
						<div class="col-sm-9">
							<input type="password" id="passwd1" placeholder="영문/숫자 조합 4-12자" class="form-control" maxlength="12" required>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">새 비밀번호 확인<span style="color:#ff0000">*</span></label>
						<div class="col-sm-9">
							<input type="password" id="passwd2" placeholder="영문/숫자 조합 4-12자" class="form-control" maxlength="12" required>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger btn_passwdModCompChk" type="button">변경</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호변경확인 Modal-->
	<div class="modal fade" id="passwdModChkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">변경 확인</h5>					
				</div>
				<div class="modal-body">비밀번호를 변경하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn_passwdModComp" type="button">예</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>										
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호변경완료 Modal-->
	<div class="modal fade" id="passwdModCompModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">변경 완료</h5>					
				</div>
				<div class="modal-body">비밀번호가 변경되었습니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수정확인 Modal-->
	<div class="modal fade" id="modCompChkModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">수정 확인</h5>					
				</div>
				<div class="modal-body">수정하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-primary btn_modComp" type="button">예</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>										
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수정완료 Modal-->
	<div class="modal fade" id="modCompModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">수정 완료</h5>					
				</div>
				<div class="modal-body">수정되었습니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">확인</button>					
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
	
		var sexType = $('[name="sex_type"]').val();
		
		if(sexType == "Male") {
			$('#maleRadio').prop('checked', true);
		} else if (sexType == "Female") {
			$('#femaleRadio').prop('checked', true);
		}
		
		$('#bank_code').val("${result.bank_code}");
		
		// 비밀번호 변경 이벤트
		$('.btn_passwdMod').click(function() {
			$('#passwd0').val('');
			$('#passwd1').val('');
			$('#passwd2').val('');
			
			$('#passwdModModal').modal('show');
		});
		
		// 비밀번호 변경 완료 체크		
		$('.btn_passwdModCompChk').click(function() {
			var params = {
				"user_id" : $('#user_id').val(),
				"passwd" : $('#passwd0').val()
			}
			//console.log($('#form').serialize());
			$.ajax({
				type : "POST",
				url : "/passwdChangeChk",
				data : JSON.stringify(params),		
				dataType : "json",
				contentType : "application/json",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
					console.log(data);
					if (data.result == '1') {
						if ($('#passwd0').val().length < 4) {
							alert("비밀번호를 4자 이상 입력하십시오.");
							$('#passwd0').focus();
							return false;
						}

						if ($('#passwd1').val().length < 4) {
							alert("비밀번호를 4자 이상 입력하십시오.");
							$('#passwd1').focus();
							return false;
						}

						if ($('#passwd2').val().length < 4) {
							alert("비밀번호를 4자 이상 입력하십시오.");
							$('#passwd2').focus();
							return false;
						}

						if ($('#passwd1').val() != $('#passwd2').val()) {
							alert('비밀번호가 일치하지 않습니다.')
							$('#passwd1').focus();
							return false;
						}
					} else {
						alert('현재 비밀번호를 정확하게 입력해 주십시오.')
						$('#passwd0').val('');
						$('#passwd0').focus();
						return false;
					}
					$('#passwdModChkModal').modal('show');
				}
			});
			
		});
		
		// 비밀번호 변경 완료
		$('.btn_passwdModComp').click(function() {
			var params = {		
				"user_id" : $('#user_id').val(),
				"passwd" : $('#passwd1').val()
			}
			//console.log($('#form').serialize());
			$.ajax({
				type : "POST",
				url : "/passwdChange",
				data : JSON.stringify(params),
				dataType : "json",
				contentType : "application/json",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
					console.log(data);
					if (data.result == '1') {
						$('#passwdModModal').modal('hide');
						$('#passwdModChkModal').modal('hide');
						$('#passwdModCompModal').modal('show');
					}
				}
			});
		});

		$('.div_modChk').show();
		$('.div_modComp').hide();
		$('.necessary').hide();

		$('.btn_modChk').click(function() {
			$('.div_modChk').hide();
			$('.div_modComp').show();
			$('.necessary').show();

			$('#name').prop('readOnly', false);
			//$('#stdtNo').prop('readOnly', false);
			$('#email').prop('readOnly', false);
			$('#birth1').prop('disabled', false);
			$('#birth2').prop('disabled', false);
			$('#birth3').prop('readOnly', false);
			$('#phone').prop('readOnly', false);
			$('#address').prop('readOnly', false);

			$('#maleRadio').prop('disabled', false);
			$('#femaleRadio').prop('disabled', false);
			$('#bank_code').prop('disabled', false);

			$('#bank_name').prop('readOnly', false);
			$('#bank_acct').prop('readOnly', false);
		});

		$('.btn_modCancel').click(function() {
			location.reload();
		});
		
		function mypagecall() {			
			$('#modCompChkModal').modal('show');			
		};
				
		$('.btn_modComp').click(function() {
			$('#modCompChkModal').modal('hide');
			
			$('.div_modChk').show();
			$('.div_modComp').hide();
			$('.necessary').hide();

			$('#name').prop('readOnly', true);
			//$('#stdtNo').prop('readOnly', true);
			$('#email').prop('readOnly', true);
			$('#birth1').prop('disabled', true);
			$('#birth2').prop('disabled', true);
			$('#birth3').prop('readOnly', true);
			$('#phone').prop('readOnly', true);
			$('#address').prop('readOnly', true);

			$('#maleRadio').prop('disabled', true);
			$('#femaleRadio').prop('disabled', true);
			$('#bank_code').prop('disabled', true);

			$('#bank_name').prop('readOnly', true);
			$('#bank_acct').prop('readOnly', true);
			
			var now = new Date();
			var age = now.getFullYear() - Number($('[name="birth1"]').val()) + 1;
			
			var params = {
				"user_id" : $('#user_id').val(),
				//"stdt_no" : $('#stdtNo').val(),
				"worker_id" : $('#worker_id').val(),
				"name" : $('#name').val(),
				"email" : $('#email').val(),
				"age" : age,
				"birth" : $('#birth1').val()+'-'+$('#birth2').val()+'-'+$('#birth3').val(),
				"phone" : $('#phone').val(),
				"address" : $('#address').val(),
				"sex" : $("input[name='sex']:checked").val(),
				"bank_code" : $('#bank_code').val(),
				"bank_name" : $('#bank_name').val(),
				"bank_acct" : $('#bank_acct').val()
			}
			//console.log($('#form').serialize());

			$.ajax({
				type : "POST",
				url : "/mypage",
				data : JSON.stringify(params),
				dataType : "json",
				contentType : "application/json",
				error : function() {
					alert('통신실패!!');
				},
				success : function(data) {
					console.log(data);
					$('#modCompModal').modal('show')

					//location.href = '/dashboard';
					//location.reload()
				}
			});
		});
	</script>

</body>
</html>
