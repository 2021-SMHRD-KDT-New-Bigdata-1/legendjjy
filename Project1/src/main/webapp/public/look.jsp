<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ϱ� �ѷ�����</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	<!-- �Խù� �˾�, ��� ��� css -->
	<link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/comment.css">
	<link rel="stylesheet" href="assets/css/popup.css">

<style>
.search_bar {
	height: 40px;
	width: 20%;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin-left: 20%;\
	border-radius: 20px;
	opacity:0.85;
}

.search {
	font-size: 20px;
	width: 80%;
	height: 100%;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	border-radius: 20px;
}

.search_button {
	width: 50px;
	height: 100%;
	border: none;
	font-size: 15px;
	background-color: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff

}

#month_button{
	width: 42px;
	height: 34px;
	padding-top: 0;
	border-radius: 12px;
	padding-bottom: -10px;
	margin-top: 10px;
	background: #1b5ac2;
	border: 0;
	color: white;
	opacity: 0.8;
	font-size: ;align:left;
}

#month_select{
	margin-right: 10px;
	padding-left: 20px;
	width: 145px;
	height: 32px;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>

<body style="width:100%">
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

		<nav 
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll"
			style="background-color: rgb(242, 238, 233, 0.7); z-index: 1;
			height: 120px;">



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
					<ul class="navbar-nav ms-auto mb-4 mb-lg-0" id="main-menu">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							aria-current="page"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>write.jsp<%}%>">�ϱ�
								��������</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="look.jsp">�ѷ�����</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>loveIt.jsp<%}%>">����</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow/follow.jsp<%}%>">�ȷο�</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="../publish/book_made.jsp">����</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> Hi,<%=vo.getUser_nick()%>
						</a>
							<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item fw-bold" href="profile.jsp">�� ������</a></li>
								<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">������������</a></li>
								<li><a class="dropdown-item fw-bold" href="../LogoutService">�α׾ƿ�</a></li>
							</ul></li>
						<%
						} else if (vo != null && vo.getAdmin_yn().equals("y")) {
						%><li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">��������</a></li>
						<%
						}
						%>
					</ul>
					<%
					if (vo == null) {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../public/Login_v2/login.jsp">�α���</a>
					</form>
					<% } %>
				</div>
			</div>
	</nav>

		<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
		<h1 class="py-5 text-center" id="searching" style="font-size: 38px">�ϱ� �ѷ�����</h1>
		
	<main class="main" id="top">
	
		<div class="mx-auto mt-6 mb-7 search_bar" style="position: sticky; top: 120px; z-index: 1; ">
			<input class="search" type="text" placeholder="�˻��� �Է�">
			<button style="	border-radius: 20px;"class="search_button">�˻�</button>
		</div>

    <form style="margin-left:274px; height:17px;">
    <table>
    	<tr>
    		<td><p><input type="month" value="2021-09"  min="2010-09" max="2030-09" id="month_select"></p></td>
    		<td><p><input type="submit" id="month_button" value="ok"></p></td>
    	</tr>
    </table>
     

    </form>

		<div class="list_wrap">
			<ul>
				<li class="item item1" style="background-color: rgb(245, 242, 235);"  onclick="showPopup()">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item2" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item3" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item4" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item5" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item6" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item7" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item8" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item9" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
			</ul>
		</div>
</main>

	<!-- �Խù� �˾�, ��� ��� js -->
    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>

</body>
</html>