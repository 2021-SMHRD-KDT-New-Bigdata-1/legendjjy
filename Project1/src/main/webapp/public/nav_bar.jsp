<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- 새로 만든 상단바 css -->
<link rel="stylesheet" href="assets/css/nav_bar.css"/>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">

</head>
<body>
    <%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- 새로 만든 상단바 -->
    <!-- -------------------------------------------------------------------- -->
    
    <header class="nav_outer">
    	<nav class="navi">
    	
		    <div class="navi_inner">
		    	<div class="LOGO">
			    	<a class="navbar-brand d-inline-flex" href="index.jsp"><img class="logo-img" src="assets/img/gallery/logo_small.png" alt="..." 
			    	style="width: 70px; height: 70px;"/></a>
				    <a><span style="color: #005DFF !important">LEGEN<span style="color: #FF6A00 !important;">D</span></span></a>
   				</div>
		    </div>
			    
   			
	    	<ul class="navi_inner2">
	    		<li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>write.jsp<%}%>">일기 쓰러가기</a></li>
	            <li ><a href="look.jsp">둘러보기</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">스크랩 목록</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>follow/follow.jsp<%}%>">구독 목록</a></li>
	            <li ><a href="../publish/book_made.jsp">출판</a></li>
	            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle fw-bold" href="#"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> Hi, <%=vo.getUser_nick()%>
							</a>
								<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item fw-bold" href="profile.jsp">내 프로필</a></li>
									<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">개인정보수정</a></li>
									<li><a class="dropdown-item fw-bold" href="../LogoutService">로그아웃</a></li>
								</ul></li><%}
	            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li><%} %>
	    	</ul>
	    	
	    	<%if(vo==null){ %>
	        <form class="login_button"><a class="log_button" href="Login_v2/login.jsp">로그인</a></form>
	        <%}%>

	    </nav>
    
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- 새로 만든 상단바 끝 -->
    <!-- -------------------------------------------------------------------- -->
    
    <section class="main_content">
        <div>content</div>
	    <div>content</div>
	    <div>content</div>
	    <div>content</div>
	    <div>content</div>
	    <div>content</div>
	    <div>content</div>
	    <div>content</div>
    
    </section>
    

    
</body>
</html>