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
  <title>publishing</title>


  <!-- ===============================================-->
  <!--    Favicons-->
  <!-- ===============================================-->
  <link rel="apple-touch-icon" sizes="180x180" 
  	href="../public/assets/img/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" 
  	href="../public/assets/img/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" 
  	href="../public/assets/img/favicons/favicon-16x16.png">
  <link rel="shortcut icon" type="image/x-icon" 
  	href="../public/assets/img/favicons/favicon.ico">
  <link rel="manifest" href="../public/assets/img/favicons/manifest.json">
  <meta name="msapplication-TileImage" content="../public/assets/img/favicons/mstile-150x150.png">
  <meta name="theme-color" content="#ffffff">


  <!-- ===============================================-->
  <!--    Stylesheets-->
  <!-- ===============================================-->
  <link href="../public/assets/css/theme.css" rel="stylesheet" />

  <link href="../public/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../public/assets/css/main_bottom.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link 
  	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" 
  	rel="stylesheet">
  <link rel="stylesheet" href="book_css.css">
  
  
  <!-- fade up 효과 -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
      $( document ).ready( function() {
        AOS.init();
      } );
    </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  
</head>

<script src="//code.jquery.com/jquery.min.js"></script>

<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
	%>

  <!-- ===============================================-->
  <!--    Main Content-->
  <!-- ===============================================-->
  <main class="main" id="top">
    <nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="../public/index.jsp"><img
					class="card-img" src="../public/assets/img/gallery/logo_small.png" alt="..." /><span
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
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0" id="main-menu">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							aria-current="page"
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/write.jsp<%}%>">일기
								쓰러가기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="../public/look.jsp">둘러보기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/loveIt.jsp<%}%>">관심</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/follow/follow.jsp<%}%>">팔로우</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="../publish/book_made.jsp">출판</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> Hi,<%=vo.getUser_nick()%>
						</a>
							<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item fw-bold" href="../public/profile.jsp">내 프로필</a></li>
								<li><a class="dropdown-item fw-bold" href="../public/Login_v2/edit.html">개인정보수정</a></li>
								<li><a class="dropdown-item fw-bold" href="../public/index.jsp">로그아웃</a></li>
							</ul></li>
						<%
						} else if (vo != null && vo.getAdmin_yn().equals("y")) {
						%><li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">유저관리</a></li>
						<%
						}
						%>
					</ul>
					<%
					if (vo == null) {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../public/Login_v2/login.jsp">로그인</a>
					</form>
					<% } %>
				</div>
			</div>
		</nav>
   
<section class="py-0" id="header">
	<div class="container">
			
    <div class="content" style="margin-top: 200px;">
        <table>
            <tr data-aos="fade-right" data-aos-duration="3000">
                <td><h2>일기장을 제작해 드립니다</h2></td>
                <td><img class="cont" src="imgs/book_01.png" alt="" style="background-color: silver"></td>
                <td></td>
            </tr>
            <tr data-aos="zoom-in" data-aos-duration="3000">
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr data-aos="fade-left" data-aos-duration="3000">
                <td></td>
                <td><img class="cont" src="imgs/book_02.jpeg" alt=""></td>
                <td><h2>일기를 작성하세요</h2></td>
            </tr>
            <tr data-aos="zoom-in" data-aos-duration="3000">
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr data-aos="fade-right" data-aos-duration="3000">
                <td><h2>직접 표지 디자인을 고를 수 있어요</h2></td>
                <td><img class="cont" src="imgs/book_03.jpg" alt=""></td>
                <td></td>
            </tr>
            <tr data-aos="zoom-in" data-aos-duration="3000">
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr data-aos="fade-left" data-aos-duration="3000">
                <td></td>
                <td><img class="cont" src="imgs/book_04.jpg" alt=""></td>
                <td><h2>pdf파일로 받을 수 있어요</h2></td>
            </tr>
            <tr data-aos="zoom-in" data-aos-duration="3000">
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr data-aos="fade-right" data-aos-duration="3000">
                <td><h2>나만의 일기장을 간직하세요</h2></td>
                <td><img class="cont" src="imgs/book_05.jpg" alt=""></td>
                <td></td>
            </tr>
        </table>
    </div>
    </div>
    </section>
    
    
    <form style="text-align: center;">

        <input type="button" value="신청하기"
        style="width:150px; height:60px; margin-top: 100px; font-size: 20px; color: cornsilk;
        background-color: rgb(69, 100, 177); border:2"
        data-aos="fade-up" data-aos-duration="2000"
        >

    </form>
    

    <div style="text-align: center; margin-top: 200px;">
        <img src="imgs/designed_01.png" alt="" style="margin-bottom: 30px; margin-right: 0;">
        <img src="imgs/logo.png" alt="">
    </div>
    



    <!-- ============================================-->
    <!-- <section> begin ============================-->
    <section class="py-6">

      <div class="container">
        <div class="row">

        </div>
        <div class="row">

        </div>
        <hr class="mt-6" />
      </div><!-- end of .container-->

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
  <script src="vendors/swiper/swiper-bundle.min.js"> </script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
  <script src="vendors/fontawesome/all.min.js"></script>
  <script src="assets/js/theme.js"></script>
  <script src="assets/js/jquery-3.6.0.min.js"></script>
  <script>
  	$(document).ready(function() {
  		$(".nav-link fw-bold .scroll").click(function(event){            
  			event.preventDefault();
  			$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
 		 });
 	 });
  </script>
  

</body>

</html>