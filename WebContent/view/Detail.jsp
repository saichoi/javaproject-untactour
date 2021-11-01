<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="nowpage" value="${ pageVo.nowpage }" />
<c:set var="pagecount" value="${ pageVo.pagecount }" />
<%
	//String category_code_id = request.getParameter("category_code_id"); //출력됨 
	//String category_code_name = request.getParameter("category_code_name"); //출력됨
	String item_id = request.getParameter("item_id");
	String nowpage = request.getParameter("nowpage");
	String pagecount = request.getParameter("pagecount");
	System.out.println(item_id);
	
%>
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
<style>
#related .card-img-top {
	height: 170px;
	object-fit: cover;
}

#related .card {
	overflow: hidden;
	transition-duration: 1s;
}

#related .card:hover {
	background-color: rgba(0, 0, 0, 0.2);
}

#related .card:hover img {
	transform: scale(1.1);
	transition: transform 1s;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>
	$(function() {
		$('.card').on('click',function(){
			var selected = <%=item_id%>; //현재 디테일에서 표시중인 상품
			var item_id = $(this).find('img').attr('item_id');
			var category_code_id = '${category_code_id}';
			var category_code_name = '${ category_code_name }';
			var nowpage = 1;
			var pagecount = 8;
			//http://localhost:9090/board?cmd=DETAILVIEW&item_id=101&category_code_id=100k&nowpage=3&pagecount=2
		    var params = '&item_id=' + item_id
					+ '&category_code_id='+ category_code_id 
					+ '&category_code_name='+ category_code_name 
					+ '&nowpage=' + nowpage
					+ '&pagecount=' + pagecount;
			location.href = '/board?cmd=DETAILVIEW' + params;
			
			
			
			//selected.remove('.card');
			
		});
		
		
		
		/* if( selected == item_id ){
		$('div').remove('.card');
		} */
		

	});
</script>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="../images/${itemVo.item_id}.jpg" alt="상품이미지"
						item_id="${itemVo.item_id}" />
					<!-- ITEM_ID -->
				</div>
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder">${ itemVo.item_name }</h1>
					<!-- ITEM_NAME -->
					<div class="fs-5 mb-5">
						<span>₩${ itemVo.price}</span>
						<!-- PRICE -->
					</div>
					<p class="lead">${ fn:replace(itemVo.item_cont, newLineChar, "<br/>") }</p>
					<!-- ITEM_CONT -->
					<div class="d-flex">
						<input class="form-control text-center me-3" id="inputQuantity"
							type="num" value="1" style="max-width: 3rem" />
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> 장바구니 담기
						</button>
						<button class="btn btn-outline-dark flex-shrink-0" type="button"
							style="margin-left: 10px">
							<i class="bi-cash-coin me-1"></i>결제하기
						</button>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<h2 class="fw-bolder mb-4">Related products</h2>
			<h4 class="fw-bolder mb-3">${category_code_name }</h4>
			<div id="related"
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
				<c:forEach var="item" items="${ itemList }" end="3" step="1">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/${item.item_id}.jpg"
								alt="상품이미지" item_id="${item.item_id}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${ item.item_name }</h5>
									<!-- Product price-->
									₩${ item.price }
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto" href="#">장바구니에 담기</a>
								</div>
								<!-- text-center end -->
							</div>
							<!-- car footer end -->
						</div>
						<!-- card end -->
					</div>
					<!-- col end -->
					</c:forEach>
			</div>
			<!-- row end -->
		</div>
	</section>
	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/notice.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../js/scripts.js"></script>
</body>
</html>