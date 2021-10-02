<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.appVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <title>publish_list</title>


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
</head>

<body data-bs-spy="scroll" data-bs-target="#navbar" >
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
	    usersDAO dao = new usersDAO();
		ArrayList<appVO> app_list = dao.application_list();
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
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="look.jsp">둘러보기</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../Login_v2/login.jsp<%}else{%>../index.jsp<%}%>">관심</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../Login_v2/login.jsp<%}else{%>follow.jsp<%}%>">팔로우</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="../../publish/book_made.jsp">출판</a></li>
            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="../Login_v2/edit.html">개인정보수정</a></li><%}
            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li><%} %>
          </ul>
          <%if(vo==null){ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="../Login_v2/login.jsp">로그인</a></form>
          <%}else{ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="../LogoutService">로그아웃</a></form>
          <%} %>
        </div>
      </div>
    </nav>
	<section style="width:100%; padding-top: 180px; padding-bottom: 100px; ">
			<h3>출판요청 목록</h3>

			<div class="all" style="position: fixed;">
				
			<ul style="margin-top: 150px; padding-left:0px; box-shadow: 5px 5px 5px gray;">
				<li class="fl tc w60 t_line lt_line title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">순번</li>
				<li class="fl tc w380 t_line lt_line title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">이메일</li>
				<li class="fl tc w760 t_line lt_line title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">요청사항</li>
				<li class="fl tc w150 t_line lt_line title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">디자인</li>
				<li class="fl tc t_line lt_line delete title" style="border-radius: 8px; background-color: rgb(69, 100, 177);">요청완료</li>
			</ul>
			</div>  
			
			<div class="all_1" style="position: fixed; overflow-x:hidden;" type="onClick">
				<script >
					function listDelete()
				  
				</script>
					
				<%for(int i=0; i<app_list.size(); i++){%>
				<ul id="appli" style="padding-left:0px; box-shadow: 5px 5px 5px gray;">
					<li class="fl tc w60 t_line lt_line title1"><%=(i+1) %></li>
					<li class="fl tc w380 t_line lt_line title1"><%=app_list.get(i).getUser_email() %></li>
					<li class="fl tc w760 t_line lt_line title1" ><%=app_list.get(i).getRequire() %></li>
					<li class="fl tc w150 t_line lt_line title1" ><%=app_list.get(i).getDesign() %></li>
					<li id="delete" class="fl tc t_line lt_line delete title1" type="button" >확인</li>
				</ul>
				
				<%} %>
			</div> 

			
			
	</section>
	</main>
	<script>
		function delete()
	
	</script>
	
</body>
</html>






















