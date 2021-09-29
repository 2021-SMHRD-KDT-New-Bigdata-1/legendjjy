<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->
<title>Legend | Diary Everyday</title>


<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicons/favicon.ico">
<link rel="manifest" href="assets/img/favicons/manifest.json">
<meta name="msapplication-TileImage"
	content="assets/img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">


<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link href="assets/css/theme.css" rel="stylesheet" />

<link href="vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
<link rel="stylesheet" href="../public/assets/css/main_bottom.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/modal.css" />
<link rel="stylesheet" href="assets/css/댓글.css" />
</head>
<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="index.jsp"><img
					class="card-img" src="assets/img/gallery/logo_small.png" alt="..." /><span
					class="fs-2 fw-bold text-primary ms-2">LEGEN<span
						class="text-warning">D</span></span></a>
				<button class="navbar-toggler collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div
					class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
					id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							aria-current="page"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>#write<%}%>">일기
								쓰러가기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="look.jsp">둘러보기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>index.jsp<%}%>">관심</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow.jsp<%}%>">팔로우</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">출판</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%><li
							class="nav-item px-2"><a class="nav-link fw-bold"
							href="Login_v2/edit.html">개인정보수정</a></li>
						<%
						} else if (vo != null && vo.getAdmin_yn().equals("y")) {
						%><li
							class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">유저관리</a></li>
						<%
						}
						%>
					</ul>
					<%
					if (vo == null) {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="Login_v2/login.jsp">로그인</a>
					</form>
					<%
					} else {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../LogoutService">로그아웃</a>
					</form>
					<%
					}
					%>
				</div>
			</div>
		</nav>
		<section class="py-0" id="header">
			<div class="container">
				<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
				<h1>오늘의 일기</h1>
				
				</div>
			</div>
		</section>
		<div class="list_wrap">
				<div class="list_wrap" style="margin-top: 300px;">
					<ul>
						<li class="item item1"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item2"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item3"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item4"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item5"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item6"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item7"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
						<li class="item item8"
							style="background-color: rgb(245, 242, 235);">
							<div class="image">사진</div>
							<div class="cont">
								<strong>작성자</strong>
								<p>내용이 들어갑니다.</p>
								<sapn class="hits">조회수</sapn>
								<span class="date">날짜</span>
							</div>
						</li>
					</ul>
				</div>
			</div>

		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-6">

			<div class="container">
				<div class="row"></div>
				<div class="row"></div>
				<hr class="mt-6" />
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->
	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->




	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="vendors/@popperjs/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script src="vendors/swiper/swiper-bundle.min.js">
		
	</script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="vendors/fontawesome/all.min.js"></script>
	<script src="assets/js/theme.js"></script>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".nav-link fw-bold .scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 500);
			});
		});
	</script>
</body>
</html>