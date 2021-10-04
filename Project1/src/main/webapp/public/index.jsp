<%@page import="comVO.entireDiaryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comDAO.diaryDAO"%>
<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<link rel="stylesheet" href="assets/css/modal.css" />
<link rel="stylesheet" href="assets/css/댓글.css" />

<!-- 글쓰기테이블 fade up 효과 -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
	$(document).ready(function() {
		AOS.init();
	});
</script>

<style>
table {
	border: 1px solid grey;
}

td {
	border: 1px solid grey;
	padding: 30px;
	align: center;
	width: 40%;
}
h4{
	margin-bottom: 5px;
	text-align: inherit;
	height: 42px;
	margin-top: 15px;
	color: white;
}

input[type="text"] {
	width: 100%
}
.site-footer
{
  background-color: burlywood;
  padding:20px 0 12px;
  font-size:20px;
  line-height:21px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{

  font-size: 16px;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}

.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}
.text-justify{
	line-height: 5px;
}


</style>

</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	// input file 이미지 미리보기 함수
	function previewImage(targetObj, previewId) {

		var ext = $(targetObj).val().split('.').pop().toLowerCase();

		if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
			alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
			return;
		}

		var preview = document.getElementById(previewId); // 미리보기 div id   
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) { //ie일때

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full path 
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error가 있으면 delete
				}

				var img = document.getElementById(previewId); //이미지가 뿌려질 곳 

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')"; //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { //ie가 아닐때
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; //이미지 파일일 경우만 뿌려줌.
				if (!file.type.match(imageType))
					continue;

				var prevImg = document.getElementById("prev_" + previewId); // 이전에 미리보기가 있다면 삭제
				if (prevImg) {
					preview.removeChild(prevImg);
				}

				var img = document.createElement("img"); // 크롬은 div에 이미지가 뿌려지지 않기때문에 자식 Element를 만듬.
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera 확인.
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else { // safari is not supported FileReader
					//alert('not supported FileReader');
					if (!document.getElementById("sfr_preview_error_"
							+ previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>
<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	diaryDAO dao = new diaryDAO();
	ArrayList<entireDiaryVO> today_list = dao.today_diary();
	%>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll">
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
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0" id="main-menu">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							aria-current="page"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>#write<%}%>">일기
								쓰러가기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="look.jsp">둘러보기</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>loveIt.jsp<%}%>">스크랩 목록</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow/follow.jsp<%}%>">구독 목록</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="../publish/book_made.jsp">출판</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> Hi,<%=vo.getUser_nick()%>
						</a>
							<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item fw-bold" href="profile.jsp">내 프로필</a></li>
								<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">개인정보수정</a></li>
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
					<%
					if (vo == null) {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../public/Login_v2/login.jsp">로그인</a>
					</form>
					<% } %>
				</div>
			</div>
		</nav>
		<section class="py-0" id="header">
			<div class="container">
				<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
				<h1 style="padding-bottom: 70px">오늘의 일기</h1>
				<div class="container-fluid" style="height: 500px;">
					<div class="row gx-2" style="height: 500px;">
						<div class="col-12" style="height: 500px;">
							<div class="swiper-container pb-4 overflow-hidden"
								data-pagination-target="pagination1" style="height: 500px;">
								<div class="swiper-wrapper" style="height: 310px;">
								
								<%for(int i=0; i<10; i++){ %>
								
									<div class="swiper-slide h-auto" id="<%=today_list.get(i).getDiary_seq()%>" onclick="hitsup(this.id)" style="height: 310px;">
										<a href="post_view.jsp?post_seq=<%=today_list.get(i).getDiary_seq() %>">
											<img class="w-100" id="modal_opne_btn"
											src="<%=request.getContextPath() %>/upload/<%=today_list.get(i).getDiary_title()%>.<%=today_list.get(i).getUser_email() %>.png"
											onerror="this.src='assets/img/basicIMG.png'" style="width:100%; height:100%; object-fit:cover;" />
										</a>
										<span>작성자 닉네임</span><br>
										<span>글 제목</span>
									</div>
				
									
								<%} %>
								
									<!-- <div </div>
									
									<div </div>
									 -->
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- modal -->

		</section>


		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<section class="py-6">

			<div class="container">
				<div class="row"></div>
				<div class="row"></div>
				<hr class="mt-6" />
			</div>
			<!-- end of .container-->

		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->
		<div class="main_bottom">

			<div class="container">
				<div class="row">
					<div class="col-12" id="write" data-aos="fade-up"
						data-aos-duration="3000">
						<h1 class="py-5 text-center">일기 쓰기</h1>
					</div>
				</div>
			</div>
		<form class="upload" action="../UploadService" method="post" enctype="multipart/form-data">
			<div class="container" style="margin-bottom: 100px;">
				<table style="background-color: #fdfdfd; box-shadow: 5px 5px 5px gray; width: 100%;" data-aos="fade-up" data-aos-duration="3000">
					<tr>
						<td style="width: 30%">
							<div id="user_upload_img"></div> 
								<input name="file" id="file" type="file"
								onchange="previewImage(this, 'user_upload_img');"
								style="display: none;">
								<button class="button" type="button"
								onclick="document.all.file.click()"
								style="margin: auto; width: 50px; height: 50px; display: block; font-size: 30px; padding-bottom: 60px; 
								background: rgb(249, 208, 35); border: none; box-shadow: 3px 3px 3px silver; color: black;">+</button>
						</td>
						<td>
							<div style="width: 100%; font-size: 24px;">
									<input type="text" class="`" id="title"
										placeholder="제목 입력(2-100)" name="title" maxlength="100"
										required="required" pattern=".{2,100}"
										style="font-size: 28px; border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; margin-top: 30px;
										">
									<textarea class="form-control" rows="15" id="content"
										name="content" placeholder="내용 작성" 
										style="font-size: 28px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; height: 500px;
										"></textarea>
									<input type="text" class="form-control" id="writer"
										placeholder="태그(2자-10자)" name="writer"
										style="font-size: 24px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										">
								<input type="checkbox" name="comment_yn" value="y" style="margin-right: 5px;">댓글 허용
								<input type="checkbox" name="public_yn" value="y"
									style="margin-left: 10px; margin-right: 5px;">나만 보기 <br>
								<%
								if (vo == null) {
								%>
								<button type="submit" class="btn btn-default" onclick="alert('로그인이 필요합니다.')"
									style="border: 1px solid gray; font-size: 28px; color: black; background: rgb(249, 208, 35); box-shadow: 3px 3px 3px silver;
									border: none;">등록</button>
								<%
								} else {
								%>
								<button type="submit" class="btn btn-default" id="btn_submit"
									style="border: 1px solid gray; font-size: 28px; color: black; background: rgb(249, 208, 35); box-shadow: 3px 3px 3px silver;
									border: none;">등록</button>
								<%
								}
								%>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			
			<footer class="site-footer">
		      <div class="container">
		        <div class="row">
		          <div class="col-xs-6 col-md-3" style="width:456px;">
		            <div class="logo" style="width:100px">
						<a><img src="../public/assets/img/white.png" style="width:149px; height:100px: padding-left: 20px; border-left-width: 49px; margin-left: 184px; "></a>
					</div>
		          </div>
		          
		           <div class="col-sm-12 col-md-6" style="color:white; width:598px; padding-left: 101px; padding-right: 46px;">
		            <h4>Legendjjy</h4>
		            <p class="text-justify">광주광역시 남구 송암로 60 CGI센터 2층</p>
		            <p class="text-justify" style="word-spacing:10px;">총괄:정영동 
		            <p class="text-justify" style="word-spacing:10px;"> DB,CSS/HTML,JSP/Servlet:박재홍,박정현,전설아</p><br>
		            <p class="text-justify" style="word-spacing:20px;">TEL:+82)123-4567   FAX:+82)234-5678   고객센터:1522-5000</p>
		            
		          	
		          </div>
		
		           <div class="col-xs-6 col-md-3">
		            <h4>Quick Links</h4>
		            <ul class="footer-links" >
		              <li style="word-spacing:20px; line-height:35px; color:white;"><a href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>profile.jsp"<%}%>">내프로필</a>
		              <a href="look.jsp">둘러보기</a>
		              <a href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>loveIt.jsp<%}%>">관심</a>
		              <a href="../publish/book_made.jsp">출판</a><br>
		              <a href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>#write<%}%>">일기쓰러가기</a>
		              <a href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow/follow.jsp<%}%>">팔로우</a>
		              
		              </li>
		              <p class="copyright-text" style="width:304px; color:white">Copyright &copy; 2021 All Rights Reserved by 
		        		 <a href="#">Legendjjy</a>.
		              </p>
		            </ul>
		          </div>
		          
		        </div>
		        
		      </div>
		    
		</footer>
		</div>

	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->




	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="vendors/@popperjs/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script src="vendors/swiper/swiper-bundle.min.js">
		
	</script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="vendors/fontawesome/all.min.js"></script>
	<script src="assets/js/theme.js"></script>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<!-- '일기쓰기'메뉴 자동 스크롤 -->
	<script>
		$(document).ready(function() {
			$(".nav-link fw-bold .scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 500);
			});
		});
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')
	</script>
	<!-- Modal -->
	<script src="assets/js/functions-min.js"></script>
	<script src="assets/js/댓글.js"></script>
	<script>
		$("#modal").hide();
		$("#modal_opne_btn").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});
	</script>
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