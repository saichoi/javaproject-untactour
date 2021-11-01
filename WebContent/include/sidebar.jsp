<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="../view/login.jsp">로그인</a>
					 
					<c:if test="${sessionScope.customer_id eq null}">
						<a class="list-group-item list-group-item-action list-group-item-light p-3"
						href="../view/join.jsp">회원가입</a> 
					</c:if>
					
					<c:choose>
						<c:when test="${sessionScope.customer_id eq null}">
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/login.jsp">마이페이지</a> 
						</c:when>
						<c:otherwise>
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/mypage.jsp">마이페이지</a> 						
						</c:otherwise>
					</c:choose>
					<form action="/board?cmd=LOGIN" method="POST">
					<c:choose>
						<c:when test="${sessionScope.customer_id eq null}">
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/login.jsp">장바구니</a> 
						</c:when>	
						<c:otherwise>
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/basket.jsp">장바구니</a> 
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.customer_id eq null}">
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/login.jsp">결제내역</a> 
					</c:when>	
						<c:otherwise>
							<a
							class="list-group-item list-group-item-action list-group-item-light p-3"
							href="../view/purchaselist.jsp">결제내역</a> 
						</c:otherwise>
					</c:choose>		
						
						<a
						class="list-group-item list-group-item-action list-group-item-light p-3"
						href="#!">O&A게시판</a>
			</div>
		</div>
</body>
</html>