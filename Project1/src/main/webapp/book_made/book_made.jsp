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
  <title>book_made</title>


  <!-- ===============================================-->
  <!--    Favicons-->
  <!-- ===============================================-->
  <link rel="apple-touch-icon" sizes="180x180" href="../public/assets/img/favicons/apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="../public/assets/img/favicons/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="../public/assets/img/favicons/favicon-16x16.png">
  <link rel="shortcut icon" type="image/x-icon" href="../public/assets/img/favicons/favicon.ico">
  <link rel="manifest" href="../public/assets/img/favicons/manifest.json">
  <meta name="msapplication-TileImage" content="../public/assets/img/favicons/mstile-150x150.png">
  <meta name="theme-color" content="#ffffff">


  <!-- ===============================================-->
  <!--    Stylesheets-->
  <!-- ===============================================-->
  <link href="../public/assets/css/theme.css" rel="stylesheet" />

  <link href="../public/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../public/assets/css/main_bottom.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="book_css.css">
</head>

<body data-bs-spy="scroll" data-bs-target="#navbar">
	<%
		usersVO vo = (usersVO)session.getAttribute("vo");
	%>

  <!-- ===============================================-->
  <!--    Main Content-->
  <!-- ===============================================-->
  <main class="main" id="top">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
      data-navbar-on-scroll="data-navbar-on-scroll">
      <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="card-img"
            src="../public/assets/img/gallery/logo_small.png" alt="..." /><span class="fs-2 fw-bold text-primary ms-2">LEGEN<span
              class="text-warning">D</span></span></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
          aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item px-2"><a class="nav-link fw-bold" aria-current="page" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>write.jsp<%}%>">�ϱ� ��������</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold scroll" href="#look">�ѷ�����</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">����</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>../follow_list/follow.jsp<%}%>">�ȷο�</a></li>
            <li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">����</a></li>
            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="Login_v2/edit.jsp">������������</a></li><%}
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
   

    <div class="content" style="margin-top: 200px;">
        <table>
            <tr>
                <td><h2>�ϱ����� ������ �帳�ϴ�</h2></td>
                <td><img class="cont" src="imgs/book_01.png" alt="" style="background-color: silver"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="cont" src="imgs/book_02.jpeg" alt=""></td>
                <td><h2>�ϱ⸦ �ۼ��ϼ���</h2></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr>
                <td><h2>���� ǥ�� �������� ���� �� �־��</h2></td>
                <td><img class="cont" src="imgs/book_03.jpg" alt=""></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="cont" src="imgs/book_04.jpg" alt=""></td>
                <td><h2>pdf���Ϸ� ���� �� �־��</h2></td>
            </tr>
            <tr>
                <td></td>
                <td><img class="line" src="imgs/line_1.png" alt=""></td>
                <td></td>
            </tr>
            <tr>
                <td><h2>������ �ϱ����� �����ϼ���</h2></td>
                <td><img class="cont" src="imgs/book_05.jpg" alt=""></td>
                <td></td>
            </tr>
        </table>
    </div>
    
    <form style="text-align: center;">
        <input type="button" value="��û�ϱ�"
        style="width:150px; height:60px; margin-top: 100px; font-size: 20px; color: cornsilk;
        background-color: rgb(69, 100, 177); border:2"
        >
    </form>
    
    <div style="text-align: center; margin-top: 200px;">
        <img src="imgs/designed_01.png" alt="" style="margin-bottom: 30px; margin-right: 0;">
        <img src="imgs/logo.png" alt="">
    </div>
    



    <!-- ============================================-->
    <!-- <section> begin ============================-->
    <section class="py-6">

      <div class="container">
        <div class="row">

        </div>
        <div class="row">

        </div>
        <hr class="mt-6" />
      </div><!-- end of .container-->

    </section>
    <!-- <section> close ============================-->
    <!-- ============================================-->

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
  <script src="vendors/swiper/swiper-bundle.min.js"> </script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
  <script src="vendors/fontawesome/all.min.js"></script>
  <script src="assets/js/theme.js"></script>
  <script src="assets/js/jquery-3.6.0.min.js"></script>
  <script>
  	$(document).ready(function() {
  		$(".nav-link fw-bold .scroll").click(function(event){            
  			event.preventDefault();
  			$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
 		 });
 	 });
  </script>
  

</body>

</html>