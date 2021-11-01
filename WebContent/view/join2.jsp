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

			<!-- Page content-->
			
			
			<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">  <!-- col-md-12:  mx-auto : 수평 센터 처리 -->
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
          <div class="row">
            
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required >
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" placeholder="" value="" required >
              <div class="invalid-feedback">
                닉네임을 입력해주세요.
              </div>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="email">비밀번호</label>
            <input type="email" class="form-control" id="password" placeholder="password" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="email">비밀번호 확인</label>
            <input type="email" class="form-control" id="password2" required>
            <div class="invalid-feedback">
              비밀번호를 다시 입력해주세요.
            </div>
          </div>
          

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" required >
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="부산광역시 사하구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div>

          <div class="mb-3">
            <label for="address">연락처</label>
            <input type="tel" class="form-control" id="phone" placeholder="연락처" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
          
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2021 YD</p>
    </footer>
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