<%@page import="comDAO.diaryDAO"%>
<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>post_view</title>

<!-- 게시글 보기 css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/comment.css">
<link rel="stylesheet" href="assets/css/popup.css">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap" rel="stylesheet">

</head>
<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	diaryDAO dao = new diaryDAO();
	int post_seq = Integer.parseInt(request.getParameter("post_seq"));
	entireDiaryVO postvo = dao.
	%>
	<div class="content">
	    <table class="post_table">
	    <tbody class="post_tbody">
	    	<tr class="post_view">
	    		<td id="img_view"><img src="assets/img/2.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_nick" colspan='2'><span id="nick_inner">@legendjjy</span></td>
	    					<td id="content_date" colspan='2'>2021-09-30</td>
	    				</tr>
	    				<tr>
	    					<td id="content_title" colspan='4'>제목</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" colspan='4'>내용 Content and contents are nouns.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" colspan='4'>#태그1 #태그2 #태그3</td>
	    				</tr>
	    				<tr>
	    					<td id="content_hits" >조회수 1321</td>
	    					<% if(user_email != null && user_email.equals(vo.getUser_email())){ %>
	    					<td><a href="write_update_delete.jsp"><button id="content_modify">수정하기</button></a></td>
	    					<%} %>
	    					<td><button id="content_scrap">스크랩하기</button></td>
	    					<td><button id="content_subscribe">구독하기</button></td>
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
	    
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >댓글 <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="댓글 작성" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id="comments" style="margin-top: 20px; "></div>
     				 </div>
	    
    	<a href="look.jsp"><button id="close_button" onclick="#">X</button></a>
    	
	 	</div>
	 	
	 	<script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
	    <script src="assets/js/functions-min.js"></script>
	    <script src="assets/js/comment.js"></script>
	 	
</body>
</html>