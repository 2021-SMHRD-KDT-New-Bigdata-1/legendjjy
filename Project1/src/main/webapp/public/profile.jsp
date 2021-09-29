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
  <title>������ �Խñ�</title>


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
  <link rel="stylesheet" href="profile/css/style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="profile/vendor/bootstrap/css/boostrap.css">
  <link rel="stylesheet" href="profile/css/shop-homepage.css">

</head>

<body data-bs-spy="scroll" data-bs-target="#navbar" style="background-color: #ffe1b9; width:100%;">
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
	%>

  <main class="main" id="top">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
      data-navbar-on-scroll="data-navbar-on-scroll"
      style="background-color: rgb(242, 238, 233, 0.7);">
      <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="card-img"
            src="assets/img/gallery/logo_small.png" alt="..." /><span class="fs-2 fw-bold text-primary ms-2">LEGEN<span
              class="text-warning">D</span></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0" style="margin-top: 8px;">
            <li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>write.jsp<%}%>">�ϱ� ��������</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="#look">�ѷ�����</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">����</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>follow.jsp<%}%>">�ȷο�</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">����</a></li>
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
    </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row" style="position: relative;">
		
      <div class="col-lg-3" style="padding-left: 49px; width: 30%;">

        <h4 class="my-4">@legendjjy</h4>
        <button id="follow">�����ϱ�</button>
        <p id="myself" style="color: gray;">�ڱ�Ұ�adsfdfsafdasfaafsfasdf��f</p>
		
      </div>
      		<div style="position: absolute; margin-top: 30px;"><h2>@legendjjy ���� �ϱ���</h2></div>
      </div>
      <!-- /.col-lg-3 -->



      <div class="list_wrap">
        <ul style="margin-left: 250px">
            <li class="item item1">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item2">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item3">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item4">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item5">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item6">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item7">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item8">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
            <li class="item item9">
                <div class="image">����</div>
                <div class="cont">
                    <strong>�ۼ���</strong>
                    <p>������ ���ϴ�.</p>
                    <span class="hits">��ȸ��</span>
                    <span class="date">��¥</span>
                </div>
            </li>
        </ul>
        </div>

    </div>
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
  

</body>

</html>