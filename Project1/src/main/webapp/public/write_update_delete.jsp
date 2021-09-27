<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ϱ� ����</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
  <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
  <link rel="manifest" href="assets/img/favicons/manifest.json">
  <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
  <meta name="theme-color" content="#ffffff">


  <!-- ===============================================-->
  <!--    Stylesheets-->
  <!-- ===============================================-->
  <link href="assets/css/theme.css" rel="stylesheet" />

  <link href="vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../public/assets/css/main_bottom.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">

</head>
<body>
<%
	usersVO vo = (usersVO)session.getAttribute("vo");
%>

<main class="main" id="top">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
      data-navbar-on-scroll="data-navbar-on-scroll">
      <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="card-img"
            src="assets/img/gallery/logo_small.png" alt="..." /><span class="fs-2 fw-bold text-primary ms-2">LEGEN<span
              class="text-warning">D</span></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">�ϱ� ��������</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="#look">�ѷ�����</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">���ɸ��</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">�������</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">��������</a></li>
            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="Login_v2/edit.html">������������</a></li><%}
            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">��������</a></li><%} %>
          </ul>
          <%if(vo==null){ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="Login_v2/login.jsp">�α���</a></form>
          <%}else{ %>
          <form class="ms-lg-5"><a class="btn btn-primary" href="../LogoutService">�α׾ƿ�</a></form>
          <%} %>
        </div>
      </div>

<div class="container">
<h2>�ϱ� ����</h2>
<form action="write.jsp" method="post">
    <div class="form-group">
    <label for="title">����</label>

<!-- pattern �Ӽ��� �̿��� ����ǥ�������� �������� ��ȿ�� �˻縦 �� �� �ִ�. -->
    <input type="text" class="form-control" id="title"
    placeholder="���� �Է�(2-100)" name="title"
    maxlength="100" required="required"
    pattern=".{2,100}">
    </div>
    <div class="form-group">
<label for="content">����</label>

<!--  textarea �ȿ� �ִ� ��� ���ڴ� �״�� ��Ÿ����. ���鹮��, tag, enter -->
<textarea class="form-control" rows="5" id="content"
    name="content" placeholder="���� �ۼ�"></textarea>
</div>
    <div class="form-group">
    <label for="writer">�±�</label>
    <input type="text" class="form-control" id="writer"
    placeholder="�±�(2��-10��)" name="writer">
    </div>
    <input type="file" id="file" class="image_inputType_file" accept="img/*" multiple style="display: none;">
    <button class="button" onclick="onclick=document.all.file.click()">���� �߰�</button>
    <br><br>
    
    <button class="button" style="margin-right: 20px;">�� ����</button>

    <button type="submit" class="btn btn-default">���� �Ϸ�</button>
    
    <br><br>
        <input type="checkbox" value="" style="margin-right: 5px;">��� ���   
        <input type="checkbox" value="" style="margin-left: 10px; margin-right: 5px;">���� ����
</form>
</div>
</body>
</html>

