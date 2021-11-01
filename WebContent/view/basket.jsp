<%@page import="board.vo.BasketVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<%
		//세션 ID값 가져오기
		String basket_id = session.getId();
		DecimalFormat dFormat = new DecimalFormat("###,###");		//숫자를 천단위 구분 
	%>

<script>
//alert('${ basketList[0].item_name }');
</script>
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<div class="d-flex" id="wrapper">
	<%@ include file="/include/sidebar.jsp" %>
	<!-- Page content wrapper-->
	<div id="page-content-wrapper">
	<div class="container" style="margin-top: 30px;">	
		<div style="padding-top: 30px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
					<th></th>
				</tr>
				<c:forEach var="basket" items="${ basketList }">
				<tr>
					<td>${ basket.item_name }</td> 
					<td>${ basket.price }</td> 
					<td>${ basket.cnt }</td> 
					<td>${ basket.subtotal }</td> 
					<td>${ basket.regdate }</td> 
					<td><a href="/board?cmd=DELETEBASKET&totalBasket=${ totalBasket }&basket_id=${basket.basket_id}" class="btn btn-danger">삭제</a></td>
				</tr>
				<c:set var="total" value="${total+basket.subtotal }"/>
				</c:forEach>			
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><c:out value="${ total }"/></th>
					<th></th>
					<th><a href="/board?cmd=PURCHASELIST&totalBasket=${ totalBasket }" class="btn btn-success">주문하기</a></th>
				</tr>	
			</table>
			<a href="/board?cmd=MAINVIEW&totalBasket=${ totalBasket }" class="btn btn-secondary">쇼핑 계속하기 &raquo;</a>
	</div>
	</div>
 <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
</footer>
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