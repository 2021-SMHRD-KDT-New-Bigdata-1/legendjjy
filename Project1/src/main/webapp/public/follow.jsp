<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <title>follow_list</title>


  <!-- ===============================================-->
  <!--    Favicons-->
  <!-- ===============================================-->
  <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
  <link rel="manifest" href="assets/img/favicons/manifest.json">
  <link rel="stylesheet" type="text/css" href="style.css" />
  <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
  <meta name="theme-color" content="#ffffff">


  <!-- ===============================================-->
  <!--    Stylesheets-->
  <!-- ===============================================-->
  <link href="assets/css/theme.css" rel="stylesheet" />

  <link href="vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../public/assets/css/main_bottom.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
</head>

<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
	%>

  <!-- ===============================================-->
  <!--    Main Content-->
  <!-- ===============================================-->
  <main class="main" id="top">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
      data-navbar-on-scroll="data-navbar-on-scroll">
      <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="card-img"
            src="assets/img/gallery/logo_small.png" alt="..." /><span class="fs-2 fw-bold text-primary ms-2">LEGEN<span
              class="text-warning">D</span></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>#write<%}%>">일기 쓰러가기</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="look.jsp">둘러보기</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">관심</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>follow.jsp<%}%>">팔로우</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">출판</a></li>
            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="Login_v2/edit.html">개인정보수정</a></li><%}
            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li><%} %>
          </ul>
          <%if(vo==null){ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="Login_v2/login.jsp">로그인</a></form>
          <%}else{ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="../LogoutService">로그아웃</a></form>
          <%} %>
        </div>
      </div>
    </nav>
	<section style="padding-top: 162px; padding-bottom: 75px;">
			<h3>@legendjjy 님의 구독목록</h3>

			<div class="all" style="position: fixed;">
				
			<ul class="board" style="margin-top: 190px; padding-left:0px">
				<li class="fl tc w500 t_line lt_line email title" style="border-radius: 8px;" >구독이메일</li>
				<li class="fl tc w120 t_line lt_line delete title" style="border-radius: 8px;">구독취소</li>
				<li></li>
			</ul>
			</div>  

			<div class="all_2">
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">legendjjy123@naver.com</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">이메일</li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>

			</div>
	</section>
</body>
</body>
</html>