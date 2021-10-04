<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.entireDiaryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comDAO.diaryDAO"%>
<%@page import="comVO.usersVO"%>
<%@page import="comVO.diaryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일기 둘러보기</title>
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

<!-- 새로 만든 상단바 css -->
<link rel="stylesheet" href="assets/css/nav_bar.css" />

<style>
.search_bar {
	height: 40px;
	width: 20%;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin-left: 20%;
	border-radius: 20px;
	opacity: 0.85;
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
	font-size: 18px;
	background-color: transparent;
	outline: none;
	float: right;
	color: black;
}

#month_button {
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
	font-size:;
	align: left;
}

#month_select {
	margin-right: 10px;
	padding-left: 20px;
	width: 225px;
	height: 35px;
}

.cont>p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 250px;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

</head>

<body style="width: 100%">
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	entireDiaryVO select_diary = (entireDiaryVO)session.getAttribute("select_diary");
	diaryDAO dao = new diaryDAO();
	usersDAO userdao = new usersDAO();
	ArrayList<entireDiaryVO> diary_list = dao.look_diary();
	%>


	<!-- -------------------------------------------------------------------- -->
	<!-- 새로 만든 상단바 -->
	<!-- -------------------------------------------------------------------- -->

	<header class="nav_outer" style="height: 108px;">
		<nav class="navi">

			<div class="navi_inner">
				<div class="LOGO">
					<a class="navbar-brand d-inline-flex" href="index.jsp"><img
						class="logo-img" src="assets/img/gallery/logo_small.png" alt="..."
						style="width: 70px; height: 70px;" /></a> <a
						style="padding-top: 25px;"><span
						style="color: #005DFF !important">LEGEN<span
							style="color: #FF6A00 !important;">D</span></span></a>
				</div>
			</div>


			<ul class="navi_inner2" style="width: 606px; right: -50px;">
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>write.jsp<%}%>">일기
						쓰러가기</a></li>
				<li><a href="look.jsp">둘러보기</a></li>
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>loveIt.jsp<%}%>">스크랩
						목록</a></li>
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow/follow.jsp<%}%>">구독
						목록</a></li>
				<li><a href="../publish/book_made.jsp">출판</a></li>
				<%
				if (vo != null && vo.getAdmin_yn().equals("n")) {
				%><li
					class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fw-bold" href="#"
					id="navbarDropdown" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> Hi, <%=vo.getUser_nick()%>
				</a>
					<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item fw-bold" href="profile.jsp">내
								프로필</a></li>
						<li><a class="dropdown-item fw-bold"
							href="Login_v2/edit.html">개인정보수정</a></li>
						<li><a class="dropdown-item fw-bold" href="../LogoutService">로그아웃</a></li>
					</ul></li>
				<%
				} else if (vo != null && vo.getAdmin_yn().equals("y")) {
				%><li
					class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li>
				<%
				}
				%>
			</ul>

			<%
			if (vo == null) {
			%>
			<form class="login_button" style="right: -80px; top: 36px;">
				<a class="log_button" href="Login_v2/login.jsp">로그인</a>
			</form>
			<%}%>

		</nav>

	</header>

	<!-- -------------------------------------------------------------------- -->
	<!-- 새로 만든 상단바 끝 -->
	<!-- -------------------------------------------------------------------- -->

	<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
	<h1 class="py-5 text-center" id="searching" style="font-size: 38px">일기
		둘러보기</h1>

	<main class="main" id="top">
		<form method="post" name="search_form" action="search_diary.jsp" style="position: sticky; top: 120px; z-index: 1; ">
			<input type="text" name="word"placeholder="검색어 입력" style="margin-left:710px; border-radius: 26px; height: 46px; width: 482px; font-size: 20px;">
			<input type="submit" value="검색" style="width:80px; margin-left: -92px; border-radius: 23px; border:none; background-color: white; font-size:20px;">
		</form>

		<form style="margin-left: 274px; height: 17px;">
			<table>
				<tr>
					<td><p>
							<input type="month" value="2021-09" min="2010-09" max="2030-09"
								id="month_select">
						</p></td>
					<td><p>
							<input type="submit" id="month_button" value="ok">
						</p></td>
				</tr>
			</table>

		</form>


		<div class="list_wrap">
			<ul>
				<%for(int i=0; i<diary_list.size(); i++){%>
					<li class="item" id="<%=diary_list.get(i).getDiary_seq() %>" style="background-color: rgb(245, 242, 235);" onclick="hitsup(this.id)">
						<a href="post_view.jsp?post_seq=<%=diary_list.get(i).getDiary_seq() %>"><div class="image"><img src="<%=request.getContextPath() %>/upload/<%=diary_list.get(i).getDiary_title()%>.<%=diary_list.get(i).getUser_email() %>.png"
						alt="" onerror="this.src='assets/img/basicIMG.png'" style="width:100%; height:100%; object-fit:cover;"></div></a>
						<div class="cont"> 
							<strong>@<%=userdao.findNick(diary_list.get(i).getUser_email()) %></strong>
							<p><%=diary_list.get(i).getDiary_title() %></p>
							<span class="hits">조회수 <%=diary_list.get(i).getHits()%></span><span class="date"><%=diary_list.get(i).getDiary_date() %></span>
						</div>
					</li>
				<%}%>
			</ul>
		</div>
	</main>

    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>
    <!-- 조회수기능 -->
	<script>
		function hitsup(clicked_id){
			var seq = clicked_id;
			$.ajax({
				type: "POST",
				url: "../HitsCheckService",
				data: {"post_seq":seq},
				async: false
			})
		}
	</script>

</body>
</html>