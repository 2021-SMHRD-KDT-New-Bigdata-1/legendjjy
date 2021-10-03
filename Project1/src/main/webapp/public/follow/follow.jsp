<%@page import="comVO.followVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comDAO.usersDAO"%>
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
  <link rel="apple-touch-icon" sizes="180x180" href="../assets/img/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/favicons/favicon-16x16.png">
  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicons/favicon.ico">
  <link rel="manifest" href="../assets/img/favicons/manifest.json">
  <link rel="stylesheet" type="text/css" href="style.css" />
  <meta name="msapplication-TileImage" content="../assets/img/favicons/mstile-150x150.png">
  <meta name="theme-color" content="#ffffff">


  <!-- ===============================================-->
  <!--    Stylesheets-->
  <!-- ===============================================-->
  <link href="../assets/css/theme.css" rel="stylesheet" />

  <link href="../vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>

<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
		usersDAO dao = new usersDAO();
		ArrayList<followVO> follow_list = dao.follow_list(vo) ;
	%>

  <!-- ===============================================-->
  <!--    Main Content-->
  <!-- ===============================================-->
  <main class="main" id="top">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
      data-navbar-on-scroll="data-navbar-on-scroll"
      style="background-color: rgb(242, 238, 233, 0.7);">
      <div class="container"><a class="navbar-brand d-inline-flex" href="../index.jsp"><img class="card-img"
            src="../assets/img/gallery/logo_small.png" alt="..." /><span class="fs-2 fw-bold text-primary ms-2">LEGEN<span
              class="text-warning">D</span></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>../Login_v2/login.jsp<%}else{%>../write.jsp<%}%>">일기 쓰러가기</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="../look.jsp">둘러보기</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../Login_v2/login.jsp<%}else{%>../loveIt.jsp<%}%>">스크랩 목록</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../Login_v2/login.jsp<%}else{%>follow.jsp<%}%>">구독 목록</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="../../publish/book_made.jsp">출판</a></li>
            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> Hi,<%=vo.getUser_nick()%>
						</a>
							<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item fw-bold" href="profile.jsp">내 프로필</a></li>
								<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">개인정보수정</a></li>
								<li><a class="dropdown-item fw-bold" href="../LogoutService">로그아웃</a></li>
							</ul></li><%}
            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li><%} %>
          </ul>
          <%if(vo==null){ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="../Login_v2/login.jsp">로그인</a></form>
          <%}%>
        </div>
      </div>
    </nav>
    
	<section style="padding-top: 140px; padding-bottom: 100px;">
			<h3>@legendjjy 님의 구독 목록</h3>

			<div class="all" style="position: fixed;">
			
			<ul id="head" style="margin-top: 150px; padding-left:0px; box-shadow: 5px 5px 5px gray; width:750px">
				<li class="fl tc w500 t_line lt_line nick title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">닉네임</li>
				<li class="fl tc w500 t_line lt_line email title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">이메일</li>
				<li class="fl tc t_line lt_line delete title" style="border-radius: 8px; background-color: rgb(69, 100, 177); width: 140px;">팔로우 취소</li>
			</ul>
			
			</div>  

			<div id="head" class="all_2" >
				<%for(int i=0; i<follow_list.size(); i++){%>
				<ul class="board">
					<li class="fl tc w500 list t_line lt_line">@<%=vo.getUser_nick() %></li>
					<li class="fl tc w500 list t_line lt_line"><%=follow_list.get(i).getFollow_email() %></li>
					<li class="fl tc w120 list lt_line"><button id="delete">취소</button></li>
				</ul>
				<%} %>
			</div>
			
	</section>
	</main>
</body>
</html>