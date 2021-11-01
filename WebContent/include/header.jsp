<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>

<%
	session = request.getSession();
	//out.print("session:customer_id:"+session.getAttribute("customer_id")+"<br>");
%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/board">랜선투어</a>
			<!-- 1. 이부분 수정!!!!!!!!!!! -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<c:forEach var="category" items="${ categoryList }">
						<li class="nav-item"><a class="nav-link"
							href="/board?cmd=CATEGORYVIEW&category_code_id=${category.category_code_id}&category_code_name=${category.category_code_name}&nowpage=1&pagecount=8">
								${ category.category_code_name } </a></li>
					</c:forEach>
				</ul>
				<c:choose>
					<c:when test="${sessionScope.customer_id eq null}">
					<a class="btn btn-outline-dark" href="../view/login.jsp">
						<i class="bi-cart-fill me-1"></i> 
						Cart 
						<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</a>
					</c:when>
					<c:otherwise>
					<a class="btn btn-outline-dark" href="../view/basket.jsp">
						<i class="bi-cart-fill me-1"></i> 
						Cart 
						<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
					</a>
					</c:otherwise>
					</c:choose>
					
					<c:choose>
    					<c:when test="${sessionScope.customer_id eq null}">
							<a class="btn btn-outline-dark" href="../view/login.jsp"
									style="margin-left: 10px">로그인</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-dark" onclick="return logout();" href="../view/logout.jsp"
									style="margin-left: 10px">로그아웃</a>
						</c:otherwise>
					</c:choose>
					
					
					<c:choose>
						<c:when test="${sessionScope.customer_id eq null}">
							<a class="btn btn-outline-dark" href="../view/login.jsp"
								style="margin-left: 10px">마이페이지</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-outline-dark" href="../view/dashboard.jsp"
								style="margin-left: 10px">마이페이지</a>						
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</nav>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>