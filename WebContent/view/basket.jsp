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
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
  
  <style>
    body {
      min-height: 100vh;

      
    }

    .row>.input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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
					href="../view/login2.jsp">로그인</a> <a
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
	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<table width=100%>
				<tr>
					<td align="left"><a href="./deletebasket.jsp?basket_id=<%= basket_id %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./orderbasket.jsp?basket_id=<%= basket_id %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		
		<div style="padding-top: 30px;">
			<!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				
				<tr>
					<%-- <td><%= %></td>
					<td><%= dFormat.format(basket.getPrice()) %></td>
					<td><%= BasketVo.getCnt() %></td> --%>
					<td><%-- <%= dFormat.format(total) %> --%></td> 
					<td><a href="./removebasket.jsp?id=<%= BasketVo.class %>" class="badge badge-danger">삭제</a></td>
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%-- <%= dFormat.format(sum) %> --%></th>
					<th></th>
				</tr>
			</table>
			<a href="./index.jsp" class="btn btn-secondary">쇼핑 계속하기 &raquo;</a>
		</div>
		<hr/>
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