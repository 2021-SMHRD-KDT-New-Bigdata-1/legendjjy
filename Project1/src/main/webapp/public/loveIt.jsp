<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩 목록</title>
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
	
	<!-- 게시물 팝업, 댓글 기능 css -->
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
	margin-left: 20%;
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
.navbar-brand {
    float: left;
    height: 50px;
    padding: 0px;
    font-size: 18px;
    line-height: 20px;
}
</style>

</head>

<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>
	
	<!-- ------------------------------------------------------------- -->
	<!-- 게시물 팝업 보기 -->
	<!-- ------------------------------------------------------------- -->
	
	<button onclick="showPopup()" style="margin_top: 200px;">팝업창 보기</button>
		
	<div id="popup" class="hide">
	<div class="content" style="z-index: 1;">
	    <table>
	    	<tr class="post_view">
	    		<td id="img_view"><img src="sample01.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_title" style="background: burlywood;" >제목</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" style="background: wheat;" >내용 Content and contents are nouns.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" style="background: pink;" >#태그1 #태그2 #태그3</td>
	    				</tr>
	    				<tr>
	    					<td id="content_date">2021-09-30</td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id= "content_hits" style="border-top: solid 1px black; border-bottom: solid 1px black; background: yellow;">조회수 1321</td>
	    		<td style="border-top: solid 1px black; border-bottom: solid 1px black;">
	    			<table>
	    				<tr>
	    					<td id="content_nick" style="background: aquamarine;">@legendjjy</td>
	    					<td id="content_scrap" style="background: gray;">스크랩버튼</td>
	    					<td id="content_subscribe" style="background: skyblue;">구독버튼</td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	
	    </table>
	    
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >댓글 <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="댓글 작성" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id=comments style="margin-top: 20px; "></div>
     				 </div>
	    
    	<button onclick="closePopup()" style="position: absolute; top:50px; left: 1750px;"><img alt="" src="#">닫기</button>
	 	</div>
	 	
	</div>
	<!-- ------------------------------------------------------------- -->
	<!-- 게시물 팝업 보기 끝 -->
	<!-- ------------------------------------------------------------- -->

		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll"
			style="background-color: rgb(242, 238, 233, 0.7);">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="index.jsp"><img
					class="card-img" src="assets/img/gallery/logo_small.png" alt="..."
					style="height: 50px;"/><span
					class="fs-2 fw-bold text-primary ms-2" style="padding-top: 12px">LEGEN<span
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
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/write.jsp<%}%>">일기
								쓰러가기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="#searching">둘러보기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/index.jsp<%}%>">관심</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>../public/Login_v2/login.jsp<%} else {%>../public/follow.jsp<%}%>">팔로우</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="../publish/book_made.jsp">출판</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%><li class="nav-item px-2"><a class="nav-link fw-bold"
							href="../public/Login_v2/edit.html">개인정보수정</a></li>
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

		<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
		<h1 class="py-5 text-center" id="searching">스크랩 목록</h1>
		
	<main class="main" id="top">
	
		<div class="mx-auto mt-6 mb-7 search_bar" style="position: sticky; top: 80px; z-index: 2; ">
			<input class="search" type="text" placeholder="검색어 입력">
			<button style="	border-radius: 20px;"class="search_button">검색</button>
		</div>
		

		<div class="list_wrap">
			<ul>
				<li class="item item1" style="background-color: rgb(245, 242, 235);"  onclick="showPopup()">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item2" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item3" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item4" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item5" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item6" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item7" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item8" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
				<li class="item item9" style="background-color: rgb(245, 242, 235);">
					<div class="image">사진</div>
					<div class="cont">
						<strong>작성자</strong>
						<p>내용이 들어갑니다.</p>
						<span class="hits">조회수</span> <span class="date">날짜</span>
					</div>
				</li>
			</ul>
		</div>
</main>

	<!-- 게시물 팝업, 댓글 기능 js -->
    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>

</body>
</html>