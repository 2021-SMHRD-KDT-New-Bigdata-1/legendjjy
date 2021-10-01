<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
<title>������ �Խñ�</title>


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
<link rel="stylesheet" href="profile/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="profile/vendor/bootstrap/css/boostrap.css">
<link rel="stylesheet" href="profile/css/shop-homepage.css">

	<!-- �Խù� �˾�, ��� ��� css -->
	<link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/comment.css">
	<link rel="stylesheet" href="assets/css/popup.css">
		<!-- ���� ���� ��ܹ� css -->
	<link rel="stylesheet" href="assets/nav_bar.css"/>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>


</head>

<body data-bs-spy="scroll" data-bs-target="#navbar"
	style="background-color: #ffe1b9; width: 100%;">
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>

	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� -->
	<!-- ------------------------------------------------------------- -->
	
	<div id="popup" class="hide">
	<div class="content">
	    <table id="content_outer">
	    	<tr class="post_view">
	    		<td id="img_view"><img src="assets/img/2.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_nick" colspan='2'><span id="nick_inner">@legendjjy</span></td>
	    					<td id="content_date" colspan='2'>2021-09-30</td>
	    				</tr>
	    				<tr>
	    					<td id="content_title" colspan='4'>����</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" colspan='4'>���� Content and contents are nouns.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" colspan='4'>#�±�1 #�±�2 #�±�3</td>
	    				</tr>
	    				<tr>
	    					<td id="content_hits" colspan='2'>��ȸ�� 1321</td>
	    					<td><button id="content_scrap">��ũ���ϱ�</button></td>
	    					<td><button id="content_subscribe">�����ϱ�</button></td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id="blank" ></td>
	    		<td id="blank" ></td>
	    	</tr>
	    	
	    </table>
	    
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >��� <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="��� �ۼ�" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id=comments style="margin-top: 20px; "></div>
     				 </div>
	    
    	<button id="close_button" onclick="closePopup()">X</button>
	 	</div>
	 	
	</div>
	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� �� -->
	<!-- ------------------------------------------------------------- -->

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
	        <form class="login_button"><a class="btn btn-primary" href="Login_v2/login.jsp">�α���</a></form>
	        <%}%>
	    <div>
	    </div>
	    </nav>
    
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� �� -->
    <!-- -------------------------------------------------------------------- -->

	<main class="main" id="top">
		
		<!-- Page Content -->
		<div class="container">

			<div class="row" style="position: absolute;">

				<div class="col-lg-3" style="padding: 134px; width: 108%;">

					<h4 class="my-4">
						@legendjjy
						<button id="follow" style="cursor: pointer">�����ϱ�</button>
					</h4>

					<p id="myself" style="color: gray;">ESTP�� �ϻ��� �ñ�����?</p>

				</div>

				<div style="position: absolute; margin-top: 4px;">
					<h2>@legendjjy ���� �ϱ���</h2>
				</div>

			</div>
			<!-- /.col-lg-3 -->



			<div class="list_wrap">
				<ul style="margin-left: 250px">
					<li class="item item1" onclick="showPopup()">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item2">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item3">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item4">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item5">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item6">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item7">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item8">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
					<li class="item item9">
						<div class="image">����</div>
						<div class="cont">
							<strong>�ۼ���</strong>
							<p>������ ���ϴ�.</p>
							<span class="hits">��ȸ��</span> <span class="date">��¥</span>
						</div>
					</li>
				</ul>
			</div>

		</div>
	</main>

	<!-- /.row -->


	<!-- /.container -->

	<!-- Footer -->
	<!--<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>-->
	<!--/.container -->
	<!--</footer>-->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
		<!-- �Խù� �˾�, ��� ��� js -->
    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>


</body>

</html>