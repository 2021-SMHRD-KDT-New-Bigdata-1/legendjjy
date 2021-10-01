<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- ���� ���� ��ܹ� css -->
<link rel="stylesheet" href="assets/css/nav_bar.css"/>

<!-- ��Ʈ -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">

</head>
<body>
    <%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� -->
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
	    		<li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>write.jsp<%}%>">�ϱ� ��������</a></li>
	            <li ><a href="look.jsp">�ѷ�����</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">��ũ�� ���</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>follow/follow.jsp<%}%>">���� ���</a></li>
	            <li ><a href="../publish/book_made.jsp">����</a></li>
	            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle fw-bold" href="#"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> Hi, <%=vo.getUser_nick()%>
							</a>
								<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item fw-bold" href="profile.jsp">�� ������</a></li>
									<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">������������</a></li>
									<li><a class="dropdown-item fw-bold" href="../LogoutService">�α׾ƿ�</a></li>
								</ul></li><%}
	            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">��������</a></li><%} %>
	    	</ul>
	    	
	    	<%if(vo==null){ %>
	        <form class="login_button"><a class="log_button" href="Login_v2/login.jsp">�α���</a></form>
	        <%}%>

	    </nav>
    
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� �� -->
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