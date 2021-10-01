<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!---------------------------- stylesheet ---------------------------------------->
<link rel="stylesheet" href="../public/assets/css/main_bottom.css" />

<!-- ���� ���� ��ܹ� css -->
<link rel="stylesheet" href="assets/css/nav_bar.css"/>

<!-- ��Ʈ -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">

<!-- �Խù� �˾�, ��� ��� css -->
	<link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/comment.css">
	<link rel="stylesheet" href="assets/css/popup.css">
<!---------------------------- stylesheet �� ---------------------------------------->

<style>
	.search_bar {
	height: 40px;
	width: 20%;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	margin-left: 20%;
	border-radius: 20px;
	opacity:0.85;
}

.search {
	font-size: 20px;
	width: 80%;
	height: 100%;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
	border-radius: 20px;
}

.search_button {
	width: 50px;
	height: 100%;
	border: none;
	font-size: 15px;
	background-color: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff

}
.navbar-brand {
    float: left;
    height: 50px;
    padding: 0px;
    font-size: 18px;
    line-height: 20px;
}
</style>

</head>
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
	        <form class="login_button"><a class="log_button" href="Login_v2/login.jsp">�α���</a></form>
	        <%}%>

	    </nav>
    
    </header>
    
    <!-- -------------------------------------------------------------------- -->
    <!-- ���� ���� ��ܹ� �� -->
    <!-- -------------------------------------------------------------------- -->
    
    <section class="main_content">
	
	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� -->
	<!-- ------------------------------------------------------------- -->
	
	<div id="popup" class="hide">
	<div class="content">
	    <table id="content_outer">
	    	<tr class="post_view">
	    		<td id="img_view"><img src="assets/img/2.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_nick" colspan='2'><span id="nick_inner">@legendjjy</span></td>
	    					<td id="content_date" colspan='2'>2021-09-30</td>
	    				</tr>
	    				<tr>
	    					<td id="content_title" colspan='4'>����</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" colspan='4'>���� Content and contents are nouns.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" colspan='4'>#�±�1 #�±�2 #�±�3</td>
	    				</tr>
	    				<tr>
	    					<td id="content_hits" colspan='2'>��ȸ�� 1321</td>
	    					<td><button id="content_scrap">��ũ���ϱ�</button></td>
	    					<td><button id="content_subscribe">�����ϱ�</button></td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id="blank" ></td>
	    		<td id="blank" ></td>
	    	</tr>
	    	
	    </table>
	    
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >��� <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="��� �ۼ�" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id=comments style="margin-top: 20px; "></div>
     				 </div>
	    
    	<button id="close_button" onclick="closePopup()">X</button>
	 	</div>
	 	
	</div>
	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� �� -->
	<!-- ------------------------------------------------------------- -->


		<div class="row align-items-center min-vh-75 min-vh-md-50"></div>
		<h2 class="py-5 text-center" id="searching">��ũ�� ���</h2>
		
	<main class="main" id="top">
	
		<div class="mx-auto mt-6 mb-7 search_bar" style="position: sticky; top: 80px; z-index: 2; ">
			<input class="search" type="text" placeholder="�˻��� �Է�">
			<button style="	border-radius: 20px;"class="search_button">�˻�</button>
		</div>
		

		<div class="list_wrap">
			<ul>
				<li class="item item1" style="background-color: rgb(245, 242, 235);"  onclick="showPopup()">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item2" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item3" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item4" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item5" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item6" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item7" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item8" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
				<li class="item item9" style="background-color: rgb(245, 242, 235);">
					<div class="image">����</div>
					<div class="cont">
						<strong>�ۼ���</strong>
						<p>������ ���ϴ�.</p>
						<span class="hits">��ȸ��</span> <span class="date">��¥</span>
					</div>
				</li>
			</ul>
		</div>
</main>

	<!-- �Խù� �˾�, ��� ��� js -->
    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>
    
    </section>
    

    
</body>
</html>