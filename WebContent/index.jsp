<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous">
	
</script>
	<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<style>
/* 캐러셀(이미지슬라이드) 이미지 크기변경 */
.carousel-inner {
	width: auto;
	height: 300px; /* 이미지 높이 변경 */
}

.carousel-item {
	width: auto;
	height: 300px;
}

.d-block {
	display: block;
	width: auto;
	height: 300px;
}
/* 상품 컨테이너 이벤트 */
.card-img-top {
		height: 170px;
		object-fit: cover;
}

.card {
	overflow: hidden;
	transition-duration: 1s;
}

.card:hover{
	background-color:rgba(0,0,0,0.2);
}

.card:hover img {
	transform: scale(1.1);
	transition: transform 1s;
}

</style>
<script>
	$('.carousel').carousel({
		interval : 2000
	//기본 5초 
	})
</script>
<script>
/* $(function(){
		
		console.dir($('nav-link').find('100'));
	$('.card').on('click',function(){
	    var item_id = $(this).find('img').attr('item_id');
		var category_code_id = '${ category_code_id }';
		var category_code_name = '${ category_code_name }';
		var totalBasket = ${ totalBasket };
		var nowpage = 1;
		var pagecount = 8;
		//http://localhost:9090/board?cmd=DETAILVIEW&item_id=101&category_code_id=100k&nowpage=3&pagecount=2
		var params =  '&item_id=' + item_id
					+ '&category_code_id=' + category_code_id
					+ '&category_code_name=' + category_code_name
					+ '&totalBasket=' + totalBasket
					+ '&nowpage=' + nowpage
					+ '&pagecount=' + pagecount;
		location.href='/board?cmd=DETAILVIEW' + params; 
	});
}); */

</script>
</head>
<body>
	<!-- Header-->
	<%@include file="/include/header.jsp"%>

	<div class="container"></div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100" src="images/508.jpg" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>BEST ITEM</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/101.jpg" alt="Second slide">
				<div class="carousel-caption d-none d-md-block ">
					<h5>BEST ITEM</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="images/403.jpg" alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>BEST ITEM</h5>
				</div>
			</div>
			<!-- / 슬라이드 쇼 끝 -->
			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true">
			</span> <!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true">
			</span> <!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>

	<!-- Section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="main" items="${ mainList }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="images/${main.item_id}.jpg" item_id="${main.item_id}"
								alt="..." />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${main.item_name}</h5>
									<!-- Product price-->
									<h5 class="fw-bolder">${main.price}</h5>
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<c:choose>
								<c:when test="${ sessionScope.loginId  eq null }">
									<a class="btn btn-outline-dark mt-auto" href="/board?cmd=LOGINFORM&totalBasket=${ totalBasket }">장바구니에 담기</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-outline-dark mt-auto" href="/board?cmd=MAINBASKET&category_code_id=${ category_code_id }&category_code_name=${ category_code_name }&item_id=${fn:trim(main.item_id)}&totalBasket=${ totalBasket }&&cnt=1">장바구니에 담기</a>
								</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>

		</div>

	</section>

	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/notice.jsp"%>

</body>
</html>