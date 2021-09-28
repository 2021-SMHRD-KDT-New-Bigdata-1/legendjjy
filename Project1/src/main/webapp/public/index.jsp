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
<link rel="stylesheet" href="assets/css/���.css" />

	<!-- �۾������̺� fade up ȿ�� -->
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      $( document ).ready( function() {
        AOS.init();
      } );
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

input[type="text"] {
	width: 100%
}
</style>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- �������� 1.x �ֽ� ���� �ε� -->
<script>
	// input file �̹��� �̸����� �Լ�
	function previewImage(targetObj, previewId) {

		var ext = $(targetObj).val().split('.').pop().toLowerCase();

		if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
			alert('gif, png, jpg, jpeg ���ϸ� ���ε� �Ҽ� �ֽ��ϴ�.');
			return;
		}

		var preview = document.getElementById(previewId); // �̸����� div id   
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) { //ie�϶�

			targetObj.select();

			try {
				var src = document.selection.createRange().text; // get file full path 
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error); //error�� ������ delete
				}

				var img = document.getElementById(previewId); //�̹����� �ѷ��� �� 

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')"; //�̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else { //ie�� �ƴҶ�
			var files = targetObj.files;
			for (var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/; //�̹��� ������ ��츸 �ѷ���.
				if (!file.type.match(imageType))
					continue;

				var prevImg = document.getElementById("prev_" + previewId); // ������ �̸����Ⱑ �ִٸ� ����
				if (prevImg) {
					preview.removeChild(prevImg);
				}

				var img = document.createElement("img"); // ũ���� div�� �̹����� �ѷ����� �ʱ⶧���� �ڽ� Element�� ����.
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;

				preview.appendChild(img);

				if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
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
	%>
	<div class="container">
		<div id="modal">
			<div class="modal_header">
				<section>
					<strong><a href="#" style="display: inline margin: 20px">@legend</a></strong>
					<div class="modal_content">
						<div class="diaryIMG">
							<img id="selectIMG" src="assets/img/camera.png">
						</div>
						<div class="diaryContent">
							<h2 style="margin-bottom: 15px">title</h2>
							<p style="direction: rtl">time</p>
							<br>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit
								esse cillum dolore eu fugiat nulla pariatur. Aspernatur aut odit
								aut fugit, sed quia consequuntur magni dolores eos qui ratione
								voluptatem sequi nesciunt.</p>
							<section class="list"></section>
						</div>
					</div>
				</section>
			</div>
			<div class="modal_header">
				<section>
					<div style="width: 100%;">
						<div id="form-commentInfo">
							<div id="comment-count">
								��� <span id="count">0</span>
							</div>
							<input id="comment-input" onkeyup="enterkey();" type="text"
								value="" placeholder="����� �޾��ּ���.">
							<button id="submit">OK</button>
						</div>
						<div id="comments"></div>
					</div>
				</section>
			</div>
			<div class="modal_layer">
				<button type="button" class="btm_image" id="modal_close_btn">
					<img src="assets/img/closeicon.png" alt="">
				</button>
			</div>
		</div>
	</div>
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
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							aria-current="page"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>#write<%}%>">�ϱ�
								��������</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold scroll"
							href="look.jsp">�ѷ�����</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>index.jsp<%}%>">����</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="<%if (vo == null) {%>Login_v2/login.jsp<%} else {%>follow.jsp<%}%>">�ȷο�</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">����</a></li>
						<%
						if (vo != null && vo.getAdmin_yn().equals("n")) {
						%><li
							class="nav-item px-2"><a class="nav-link fw-bold"
							href="Login_v2/edit.html">������������</a></li>
						<%
						} else if (vo != null && vo.getAdmin_yn().equals("y")) {
						%><li
							class="nav-item px-2"><a class="nav-link fw-bold"
							href="#faqs">��������</a></li>
						<%
						}
						%>
					</ul>
					<%
					if (vo == null) {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="Login_v2/login.jsp">�α���</a>
					</form>
					<%
					} else {
					%>
					<form class="ms-lg-5">
						<a class="btn btn-primary" href="../LogoutService">�α׾ƿ�</a>
					</form>
					<%
					}
					%>
				</div>
			</div>
		</nav>
		<section class="py-0" id="header">
			<div class="container">
				<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
				<h1 style="padding-bottom: 70px">������ �ϱ�</h1>
				<div class="container-fluid">
					<div class="row gx-2">
						<div class="col-12">
							<div class="swiper-container pb-4 overflow-hidden"
								data-pagination-target="pagination1">
								<div class="swiper-wrapper">
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-1.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-2.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-3.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-4.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-5.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-1.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-2.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-3.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn" id="modal_opne_btn"
											src="assets/img/gallery/product-4.png" alt="products" />
									</div>
									<div class="swiper-slide h-auto">
										<img class="w-100" id="modal_opne_btn"
											src="assets/img/gallery/product-5.png" alt="products" />
									</div>
								</div>
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
					<div class="col-12" id="write"  data-aos="fade-up" data-aos-duration="3000">
						<h1 class="py-5 text-center">�ϱ� ����</h1>
					</div>
				</div>
			</div>

			<div class="container" style="margin-bottom: 100px;"   >
				<table style="background-color: rgb(242, 238, 233);" data-aos="fade-up" data-aos-duration="3000">
					<tr>
						<td>
							<div id="user_upload_img"></div> <input id="file" type="file"
							onchange="previewImage(this, 'user_upload_img');"
							style="display: none;">
							<button class="button"
								onclick="onclick=document.all.file.click()"
								style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px;">+</button>

						</td>
						<td>
							<form action="write.jsp" method="post"
								style="width: 500px; font-size: 20px;">
								<div class="form-group">
									<br> <input type="text" class="form-control" id="title"
										placeholder="���� �Է�(2-100)" name="title" maxlength="100"
										required="required" pattern=".{2,100}"
										style="font-size: 20px;">
								</div>
								<div class="form-group">
									<br>
									<textarea class="form-control" rows="15" id="content"
										name="content" placeholder="���� �ۼ�" style="font-size: 17px;"></textarea>
								</div>
								<div class="form-group">
									<br> <input type="text" class="form-control" id="writer"
										placeholder="�±�(2��-10��)" name="writer"
										style="font-size: 17px;">
								</div>
								<input type="checkbox" value="" style="margin-right: 5px;">���
								��� <input type="checkbox" value=""
									style="margin-left: 10px; margin-right: 5px;">���� ���� <br>
								<%
								if (vo == null) {
								%>
								<button type="submit" class="btn btn-default" onclick="alert('�α����� �ʿ��մϴ�.')"
									style="border: 1px solid gray; font-size: 20px; color: black;">���</button>
								
								<%
								} else {
								%>
								<button type="submit" class="btn btn-default"
									style="border: 1px solid gray; font-size: 20px; color: black;">���</button>
								<%
								}
								%>
								
							</form>
						</td>
					</tr>
				</table>
			</div>

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
	<script src="assets/js/functions-min.js"></script>
	<script src="assets/js/���.js"></script>
	<script>
		$("#modal").hide();
		$("#modal_opne_btn").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal").attr("style", "display:none");
		});
	</script>
</body>
</html>