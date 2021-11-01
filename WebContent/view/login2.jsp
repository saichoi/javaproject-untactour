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
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="/css/signin2.css" rel="stylesheet">
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="/view/login2.jsp">로그인</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="/view/join2.jsp">회원가입</a> <a
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
			<main class="form-signin">
  <form>
    <img class="mb-4" src="/images/logo_horizontal.png" alt="" width="330" height="150">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="Account">
       <label for="floatingInput">Account</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
       <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 로그인 정보 기억하기
      </label>
    </div>
    <a class="w-100 btn btn-lg btn-primary"  style="background-color : #FF9C00; margin-bottom:10px;"
    	href="../view/join2.jsp">Join</a>
    
    <button class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>
  </form>
</main>
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