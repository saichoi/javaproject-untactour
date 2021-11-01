<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">로그인</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">회원가입</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">마이페이지</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">장바구니</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">결제내역</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">O&A게시판</a>
			</div>
		</div>
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<div class="container-fluid" style="margin-top: 10px;">
				<button class="btn btn-primary" id="sidebarToggle">Toggle
					Menu</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				</div>
			</div>

			<!-- Page content-->
			<div class="container-fluid">
				<h1 class="mt-4">Simple Sidebar</h1>
				<p>The starting state of the menu will appear collapsed on
					smaller screens, and will appear non-collapsed on larger screens.
					When toggled using the button below, the menu will change.</p>
				<p>
					Make sure to keep all page content within the
					<code>#page-content-wrapper</code>
					. The top navbar is optional, and just for demonstration. Just
					create an element with the
					<code>#sidebarToggle</code>
					ID which will toggle the menu when clicked.
				</p>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp" %>
	<%@include file="/include/notice.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts.js"></script>
</body>
</html>