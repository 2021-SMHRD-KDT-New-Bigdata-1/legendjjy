<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ϱ� ����</title>
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
				<h2 style="color: gray">���� �߰�</h2>
			</div>
			<input type="file" id="file" class="image_inputType_file"
				accept="img/*" multiple style="display: none;">
			<button class="button" onclick="onclick=document.all.file.click()"
				style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px;">+</button>
		</div>
		<form action="write.jsp" method="post"
			style="width: 500px; font-size: 20px;">

			<div class="form-group">
				<label for="title">����</label>

				<!-- pattern �Ӽ��� �̿��� ����ǥ�������� �������� ��ȿ�� �˻縦 �� �� �ִ�. -->
				<input type="text" class="form-control" id="title"
					placeholder="���� �Է�(2-100)" name="title" maxlength="100"
					required="required" pattern=".{2,100}" style="font-size: 17px;">
			</div>
			<div class="form-group">
				<label for="content">����</label>

				<!--  textarea �ȿ� �ִ� ��� ���ڴ� �״�� ��Ÿ����. ���鹮��, tag, enter -->
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="���� �ۼ�" style="font-size: 17px;"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">�±�</label> <input type="text"
					class="form-control" id="writer" placeholder="�±�(2��-10��)"
					name="writer" style="font-size: 17px;">
			</div>

			<br>
			<br>

			<button class="btn btn-default"
				style="margin-right: 20px; border: 1px solid gray; font-size: 20px; color: black;">��
				����</button>

			<button type="submit" class="btn btn-default"
				style="border: 1px solid gray; font-size: 20px; color: black;">�����Ϸ�</button>
			<br>
			<br> <input type="checkbox" value="" style="margin-right: 5px;">���
			��� <input type="checkbox" value=""
				style="margin-left: 10px; margin-right: 5px;">���� ����
		</form>
	</div>
	</main>
</body>
</html>

