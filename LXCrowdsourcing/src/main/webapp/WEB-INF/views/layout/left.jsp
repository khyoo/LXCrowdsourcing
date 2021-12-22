<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/dashboard">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">설문조사</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="/dashboard"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/evaluation/g2"> <i class="fas fa-fw fa-chart-area"></i> <span>새태스크 평가</span>
	</a></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/mypage"> <i class="fas fa-fw fa-cog"></i> <span>마이페이지</span>
	</a></li>

	<c:if test="${workerInfo.level == 1}">
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link" href="/admin/dashboard"> - <span>태스크 결과 목록</span>
		</a></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link" href="/admin/dashboard2"> - <span>전체 태스크 상태</span>
		</a></li>
	</c:if>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->