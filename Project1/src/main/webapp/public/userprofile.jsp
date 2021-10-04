<%@page import="comDAO.usersDAO"%>
<%@page import="comDAO.diaryDAO"%>
<%@page import="comVO.entireDiaryVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>프로필 게시글</title>


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

<!-- 게시물 팝업, 댓글 기능 css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/comment.css">
<link rel="stylesheet" href="assets/css/popup.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>

<!-- 새로 만든 상단바 css -->
<link rel="stylesheet" href="assets/css/nav_bar.css" />

</head>

<body data-bs-spy="scroll" data-bs-target="#navbar"
	style="background-color: #ffe1b9; width: 100%;">
	<%
	String user_email = request.getParameter("user_email");
	usersVO vo = (usersVO) session.getAttribute("vo");
	diaryDAO dao = new diaryDAO();
	ArrayList<entireDiaryVO> diary_list = dao.other_personal_diary(user_email);
	usersDAO userdao = new usersDAO();
	%>



	<!-- -------------------------------------------------------------------- -->
	<!-- 새로 만든 상단바 -->
	<!-- -------------------------------------------------------------------- -->

	<header class="nav_outer">
		<nav class="navi">

			<div class="navi_inner">
				<div class="LOGO">
					<a class="navbar-brand d-inline-flex" href="index.jsp"><img
						class="logo-img" src="assets/img/gallery/logo_small.png" alt="..."
						style="width: 70px; height: 70px;" /></a> <a><span
						style="color: #005DFF !important">LEGEN<span
							style="color: #FF6A00 !important;">D</span></span></a>
				</div>
			</div>

			<ul class="navi_inner2">
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>write.jsp<%}%>">일기
						쓰러가기</a></li>
				<li><a href="look.jsp">둘러보기</a></li>
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>index.jsp<%}%>">스크랩
						목록</a></li>
				<li><a
					href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow/follow.jsp<%}%>">구독
						목록</a></li>
				<li><a href="../publish/book_made.jsp">출판</a></li>
				<%
				if (vo == null) {
				%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../public/Login_v2/login.jsp">로그인</a>
					</form>
				<% 
				}else if (vo != null && vo.getAdmin_yn().equals("n")) {
				%><li class="nav-item dropdown"><a
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
				%><li class="nav-item px-2"><a class="nav-link fw-bold"
					href="#faqs">유저관리</a></li>
				<%
				}
				%>
			</ul>
		</nav>

	</header>

	<!-- -------------------------------------------------------------------- -->
	<!-- 새로 만든 상단바 끝 -->
	<!-- -------------------------------------------------------------------- -->

	<main class="main" id="top">


		<!-- Page Content -->
		<div class="container">

			<div class="row" style="position: absolute;">

				<div class="col-lg-3" style="padding: 134px; width: 108%;">

					<h3 class="my-4">
						@<%=userdao.findNick(user_email)%>
					</h3>
					<%if(vo==null){ }else{%>
					
						<div id="<%=user_email%>" onclick="subscribe(this.id)"><button id="content_subscribe">구독하기</button>
						</div>
					
						<%} %>
					


				</div>

				<div
					style="position: absolute; margin-top: 4px; margin: 100px 0 100px 0;">
					<h2>
						@<%=userdao.findNick(user_email)%>
						님의 일기장
					</h2>
				</div>

			</div>
			<!-- /.col-lg-3 -->
			<div class="list_wrap">
				<ul>
					<%
					for (int i = 0; i < diary_list.size(); i++) {
					%>
					<li class="item" id="<%=diary_list.get(i).getDiary_seq()%>"
						style="background-color: rgb(245, 242, 235);"><a
						href="post_view.jsp?post_seq=<%=diary_list.get(i).getDiary_seq()%>"><div class="image">
								<img
									src="<%=request.getContextPath()%>/upload/<%=diary_list.get(i).getDiary_title()%>.<%=diary_list.get(i).getUser_email()%>.png"
									alt="" onerror="this.src='assets/img/basicIMG.png'"
									style="width: 100%; height: 100%; object-fit: cover;">
							</div>
							<div class="cont">
								<strong>@<%=userdao.findNick(diary_list.get(i).getUser_email())%></strong>
								<p><%=diary_list.get(i).getDiary_title()%></p>
								<span class="hits">조회수 <%=diary_list.get(i).getHits()%></span><span
									class="date"><%=diary_list.get(i).getDiary_date()%></span>
							</div></a></li>
					<%
					}
					%>
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

	<!-- 게시물 팝업, 댓글 기능 js -->
	<script
		src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')
	</script>
	<script src="assets/js/functions-min.js"></script>
	<script src="assets/js/comment.js"></script>
	<script type="text/javascript" src="assets/js/popup.js"></script>
	<script>
		function subscribe(clicked_id) {
			var post_email = clicked_id;
			$.ajax({
				type : "POST",
				url : "../FollowService",
				data : {"follow_email" : post_email},
				async : false,
				success: function(data){
					alert(data);
				}
			})
		}
	</script>


</body>

</html>