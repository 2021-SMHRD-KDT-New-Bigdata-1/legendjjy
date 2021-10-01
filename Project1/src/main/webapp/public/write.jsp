<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ϱ� �����ϱ�</title>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
	rel="stylesheet">
	
<!-- ���� ���� ��ܹ� css -->
<link rel="stylesheet" href="assets/css/nav_bar.css"/>
	
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

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

<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	%>

	<!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� -->
    <!-- -------------------------------------------------------------------- -->
    
    <header class="nav_outer">
    	<nav class="navi">
    	
		    <div class="navi_inner">
		    	<div class="LOGO">
			    	<a class="navbar-brand d-inline-flex" href="index.jsp"><img class="logo-img" src="assets/img/gallery/logo_small.png" alt="..." 
			    	style="width: 70px; height: 70px;"/></a>
				    <a><span style="color: #005DFF !important">LEGEN<span style="color: #FF6A00 !important;">D</span></span></a>
   				</div>
		    </div>
			    
   			
	    	<ul class="navi_inner2">
	    		<li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>write.jsp<%}%>">�ϱ� ��������</a></li>
	            <li ><a href="look.jsp">�ѷ�����</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>index.jsp<%}%>">��ũ�� ���</a></li>
	            <li ><a href="<%if(vo==null){%>Login_v2/login.jsp<%}else{%>follow/follow.jsp<%}%>">���� ���</a></li>
	            <li ><a href="../publish/book_made.jsp">����</a></li>
	            <%if(vo!=null&& vo.getAdmin_yn().equals("n")){%><li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle fw-bold" href="#"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"> Hi, <%=vo.getUser_nick()%>
							</a>
								<ul class="dropdown-menu fw-bold" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item fw-bold" href="profile.jsp">�� ������</a></li>
									<li><a class="dropdown-item fw-bold" href="Login_v2/edit.html">������������</a></li>
									<li><a class="dropdown-item fw-bold" href="../LogoutService">�α׾ƿ�</a></li>
								</ul></li><%}
	            else if(vo!=null&& vo.getAdmin_yn().equals("y")){%><li class="nav-item px-2"><a class="nav-link fw-bold" href="#faqs">��������</a></li><%} %>
	    	</ul>
	    	
	    	<%if(vo==null){ %>
	        <form class="login_button"><a class="btn btn-primary" href="Login_v2/login.jsp">�α���</a></form>
	        <%}%>
	    <div>
	    </div>
	    </nav>
    
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� �� -->
    <!-- -------------------------------------------------------------------- -->


	<main class="main" id="top">
		
					<div style="margin-top: 100px;"><h1>�ϱ� �����ϱ�</h1></div>
					
					
		<div class="outer" style="display: flex; justify-content: center;">
			<div class="" style="margin-bottom: 200px;">
				<form>
				<table style="background-color: #fdfdfd; box-shadow: 5px 5px 5px gray;" data-aos="fade-up" data-aos-duration="3000">
					<tr>
						<td style=" border: 1px solid silver;">
						
							<div id="user_upload_img"></div> <input id="file" type="file"
							onchange="previewImage(this, 'user_upload_img');"
							style="display: none;">
							<button class="button"
								onclick="onclick=document.all.file.click()"
								style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px; 
								background: rgb(249, 208, 35); border: none; box-shadow: 3px 3px 3px silver; color: black;">+</button>

						</td>
							<td style=" border: 1px solid silver; border-radius: 20px;">
							<div style="width: 640px; font-size: 20px;">
								<div class="form-group">
									<br> <input type="text" class="form-control" id="title"
										placeholder="���� �Է�(2-100)" name="title" maxlength="100"
										required="required" pattern=".{2,100}"
										style="font-size: 20px; border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										">
								</div>
								<div class="form-group">
									<br>
									<textarea class="form-control" rows="15" id="content"
										name="content" placeholder="���� �ۼ�" 
										style="font-size: 17px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										"></textarea>
								</div>
								<div class="form-group">
									<br> <input type="text" class="form-control" id="writer"
										placeholder="�±�(2��-10��)" name="writer"
										style="font-size: 17px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										">
								</div>
								<input type="checkbox" name="comment_yn" value="y" style="margin-right: 5px;">��� ��� 
								<input type="checkbox" name="public_yn" value="y"
									style="margin-left: 10px; margin-right: 5px;">���� ���� <br>
								
								    <button type="submit" class="btn btn-default" style="border: 1px solid gray; font-size: 20px; color: black; 
								    background: rgb(249, 208, 35); box-shadow: 3px 3px 3px silver;
									border: none;">�� ����</button>
    
    								<button type="submit" class="btn btn-default" style="border: 1px solid gray; font-size: 20px; color: black; 
    								background: rgb(249, 208, 35); box-shadow: 3px 3px 3px silver;
									border: none;">�����Ϸ�</button>
    								 
							</div>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>

	</main>
</body>
</html>

