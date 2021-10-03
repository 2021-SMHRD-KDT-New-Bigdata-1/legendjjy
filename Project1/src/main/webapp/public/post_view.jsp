<%@page import="comVO.usersVO"%>
<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.entireDiaryVO"%>
<%@page import="comDAO.diaryDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>post_view</title>

<!-- �Խñ� ���� css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/comment.css">
<link rel="stylesheet" href="assets/css/popup.css">

<!-- ��Ʈ -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">

</head>
<body>
<%
	usersVO uservo = (usersVO)session.getAttribute("vo");
	int post_seq = Integer.parseInt(request.getParameter("post_seq")); 

	diaryDAO dao = new diaryDAO();
	usersDAO userdao = new usersDAO();
	
	entireDiaryVO vo = dao.select_diary(post_seq);
%>

	<div class="content">
	    <table class="post_table">
	    <tbody class="post_tbody">
	    	<tr class="post_view">
	    		<td id="img_view"><img src="assets/img/2.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_nick" colspan='2'><span id="nick_inner">@<%= userdao.findNick(vo.getUser_email())%></span></td>
	    					<td id="content_date" colspan='2'><%=vo.getDiary_date() %></td>
	    				</tr>
	    				<tr>
	    					<td id="content_title" colspan='4'><%=vo.getDiary_title() %></td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" colspan='4'><%=vo.getDiary_content() %>.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" colspan='4'><%=vo.getHash_tag() %></td>
	    				</tr>
	    				<tr>
	    					<td id="content_hits" >��ȸ�� <%=vo.getHits() %></td>
	    				<%if(vo.getUser_email().equals(uservo.getUser_email())){ %>	
	    					<td><button id="content_modify">�����ϱ�</button></td>
	    				<%}else{ %>
	    					<td><button id="content_scrap">��ũ���ϱ�</button></td>
	    					<td><button id="content_subscribe">�����ϱ�</button></td>
	    				<%} %>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id="blank" ></td>
	    		<td id="blank" ></td>
	    	</tr>
	    </tbody>
	    </table>
	    <%if(vo.getComment_yn().equals("y")){ %>
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >��� <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="��� �ۼ�" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id=comments style="margin-top: 20px; "></div>
     				 </div>
	 	</div>
	 	<%} %>
	 	
	 	<button id="close_button" onclick="location.href='look.jsp'">X</button>
	 	
	 	<script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
	    <script src="assets/js/functions-min.js"></script>
	    <script src="assets/js/comment.js"></script>
	 	
</body>
</html>