<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일기 쓰기</title>
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
<style>
table {
	border: 1px solid grey;
}
td {
	border: 1px solid grey;
	padding: 30px;
	align: center;
	width: 500px;
}
</style>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 제이쿼리 1.x 최신 버전 로드 -->
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

<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>

	<main class="main" id="top">
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="index.jsp"><img
					class="card-img" src="assets/img/gallery/logo_small.png" alt="..."
					style="height: 50px;" /><span
					class="fs-2 fw-bold text-primary ms-2" style="margin-top: 10px;">LEGEN<span
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
						<li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>../public/Login_v2/login.jsp<%}else{%>../public/write.jsp<%}%>">일기 쓰러가기</a></li>
			            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="../public/look.jsp">둘러보기</a></li>
			            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../public/Login_v2/login.jsp<%}else{%>../public/index.jsp<%}%>">관심</a></li>
			            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>../public/Login_v2/login.jsp<%}else{%>../public/follow.jsp<%}%>">팔로우</a></li>
			            <li class="nav-item px-2"><a class="nav-link fw-bold" href="../publish/book_made.jsp">출판</a></li>
			            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="../public/Login_v2/edit.html">개인정보수정</a></li><%}
			            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">유저관리</a></li><%} %>
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
			<div class="container" style="margin-bottom: 100px;"   >
				<table style="background-color: rgb(242, 238, 233); box-shadow: 5px 5px 5px gray;" data-aos="fade-up" data-aos-duration="3000">
					<tr>
						<td>
							<div id="user_upload_img"></div> <input id="file" type="file"
							onchange="previewImage(this, 'user_upload_img');"
							style="display: none;">
							<button class="button"
								onclick="onclick=document.all.file.click()"
								style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px; 
								box-shadow: 3px 3px 3px gray;">+</button>

						</td>
						<td>
							<form action="write.jsp" method="post"
								style="width: 640px; font-size: 20px;">
								<div class="form-group">
									<br> <input type="text" class="form-control" id="title"
										placeholder="제목 입력(2-100)" name="title" maxlength="100"
										required="required" pattern=".{2,100}"
										style="font-size: 20px; box-shadow: 2px 2px 2px gray;">
								</div>
								<div class="form-group">
									<br>
									<textarea class="form-control" rows="15" id="content"
										name="content" placeholder="내용 작성" 
										style="font-size: 17px; box-shadow: 2px 2px 2px gray;"></textarea>
								</div>
								<div class="form-group">
									<br> <input type="text" class="form-control" id="writer"
										placeholder="태그(2자-10자)" name="writer"
										style="font-size: 17px; box-shadow: 2px 2px 2px gray;">
								</div>
								<input type="checkbox" value="" style="margin-right: 5px;">댓글
								허용 <input type="checkbox" value=""
									style="margin-left: 10px; margin-right: 5px;">나만 보기 <br>
								<%
								if (vo == null) {
								%>
								<button type="submit" class="btn btn-default" onclick="alert('로그인이 필요합니다.')"
									style="border: 1px solid gray; font-size: 20px; color: black; box-shadow: 3px 3px 3px gray;">등록</button>
								
								<%
								} else {
								%>
								<button type="submit" class="btn btn-default"
									style="border: 1px solid gray; font-size: 20px; color: black; box-shadow: 3px 3px 3px gray;">등록</button>
								<%
								}
								%>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</nav>
	</main>
</body>
</html>

