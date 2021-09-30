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

</head>
<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>

	<main class="main" id="top">


	<div class="container"
		style="border: solid 1px silver; margin-top: 20px;">
		<div style="width: 500px;">
			<div style="padding-top: 0;">
				<h2 style="color: gray">사진 추가</h2>
			</div>
			<input type="file" id="file" class="image_inputType_file"
				accept="img/*" multiple style="display: none;">
			<button class="button" onclick="onclick=document.all.file.click()"
				style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px;">+</button>
		</div>
		<form action="write.jsp" method="post"
			style="width: 500px; font-size: 20px;">

			<div class="form-group">
				<label for="title">제목</label>

				<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
				<input type="text" class="form-control" id="title"
					placeholder="제목 입력(2-100)" name="title" maxlength="100"
					required="required" pattern=".{2,100}" style="font-size: 17px;">
			</div>
			<div class="form-group">
				<label for="content">내용</label>

				<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성" style="font-size: 17px;"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">태그</label> <input type="text"
					class="form-control" id="writer" placeholder="태그(2자-10자)"
					name="writer" style="font-size: 17px;">
			</div>

			<br>
			<br>

			<button class="btn btn-default"
				style="margin-right: 20px; border: 1px solid gray; font-size: 20px; color: black;">글
				삭제</button>

			<button type="submit" class="btn btn-default"
				style="border: 1px solid gray; font-size: 20px; color: black;">수정완료</button>
			<br>
			<br> <input type="checkbox" value="" style="margin-right: 5px;">댓글
			허용 <input type="checkbox" value=""
				style="margin-left: 10px; margin-right: 5px;">나만 보기
		</form>
	</div>
	</main>
</body>
</html>

