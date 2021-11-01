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
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<!-- Related items section-->
	<section class="py-5 bg-light">
		<div class="container px-4 px-lg-5 mt-5">
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="item" items="${ itemList }">
					<div class="col mb-5">
						<div class="card h-100">
							<!-- Product image-->
							<img class="card-img-top" src="../images/${item.item_id}.jsp"
								alt="상품이미지" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${ item.item_name }</h5>
									<!-- Product price-->
									${ item.price }
								</div>
							</div>
							<!-- Product actions-->
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
								<div class="text-center">
									<a class="btn btn-outline-dark mt-auto" href="#">장바구니에 담기</a>
								</div> <!-- text-center end -->
							</div> <!-- car footer end -->
						</div> <!-- card end -->
					</div> <!-- col end -->
				</c:forEach>
			</div> <!-- row end -->

		</div> <!-- container end -->
		
		<%@include file="/include/paging.jsp"%>
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