<%@page import="board.vo.BasketVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
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
		<%@ include file="/include/sidebar.jsp" %>
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
				
			</table>
		</div>
		
		<div style="padding-top: 30px;">
			<!-- table-hover : 마우스 포인터가 있는 행의 배경을 바꾸어 눈에 띄도록 만들어진 클래스 -->
			<table class="table table-hover">
				<tr>
					<th>주문번호</th>
					<th>상품명</th>
					<th>개수</th>
					<th>주문금액</th>
					<th>주문일</th>
		
				</tr>
				
				<%
					int sum = 0;
					//세션 속성의 이름이 basketList인 세션 정보(장바구니에 담긴 물품 목록)를 가져와서 ArrayList에 대입
					ArrayList<BasketVo> purchaseList = (ArrayList<BasketVo>)session.getAttribute("purchaseList");
					
					/* basket.jsp 파일에서 전체상품을 삭제하는 deleteBasket.jsp에서 session.invalidate()를 호툴하게 되면
					   basketList는 null이 되기 때문에 아래와 같은 코드가 반드시 필요함. */
					if(purchaseList == null) {
						purchaseList = new ArrayList<>();
					}
					
					//상품 리스트 하나씩 출력하기
				
					
					for(int i = 0; i < purchaseList.size(); i++) {
						// Basket basket = Basket.get(i);
						int total = Integer.parseInt("BasketVo.getPrice() * BasketVo.getCnt()");
						sum += total;
						
				%>
				<tr>
					<%-- <td><%= %></td>
					<td><%= dFormat.format(basket.getPrice()) %></td>
					<td><%= BasketVo.getCnt() %></td> --%>
					<td><%= dFormat.format(total) %></td> 
					
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%= dFormat.format(sum) %></th>
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