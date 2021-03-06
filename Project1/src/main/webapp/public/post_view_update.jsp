<%@page import="comVO.usersVO"%>
<%@page import="comVO.entireDiaryVO"%>
<%@page import="comDAO.diaryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	int diary_seq = Integer.parseInt(request.getParameter("diary_seq"));
	diaryDAO dao = new diaryDAO();
	entireDiaryVO enVO = dao.select_diary(diary_seq);
	String hashtag = "";
	%>
		<div class="main_bottom">

			<div class="container">
				<div class="row">
					<div class="col-12" id="write" data-aos="fade-up"
						data-aos-duration="3000">
						<h1 class="py-5 text-center" style="margin-left: 800px">일기 쓰기</h1>
					</div>
				</div>
			</div>
		<form class="upload" action="../UpdateDiaryService?diary_seq=<%=enVO.getDiary_seq() %>" method="post" enctype="multipart/form-data">
			<div class="container" style="margin-bottom: 100px; margin-left: 300px;">
				<table style="background-color: #fdfdfd; box-shadow: 5px 5px 5px gray;" data-aos="fade-up" data-aos-duration="3000">
					<tr>
						<td style="width: 640px; font-size: 24px; border: 1px solid silver;">
						
							<div id="user_upload_img"></div> 
								<input name="file" id="file" type="file"
								onchange="previewImage(this, 'user_upload_img');"
								style="display: none;">
								<button class="button" type="button"
								onclick="document.all.file.click()"
								style="margin: auto; width: 50px; height: 50px; display: block; font-size: 20px; padding-bottom: 60px; 
								background: rgb(249, 208, 35); border: none; box-shadow: 3px 3px 3px silver; line-height: 70px; color: black;">+</button>
						</td>
						<td style=" border: 1px solid silver; border-radius: 20px;">
							<div style="width: 640px; font-size: 20px;">
								<div class="form-group">
									<br> <input type="text" class="form-control" id="title"
										placeholder="제목 입력(2-100)" name="title" maxlength="100" value="<%=enVO.getDiary_title() %>"
										required="required" pattern=".{2,100}"
										style="font-size: 20px; border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										 width: 580px; margin-left: 20px;">
								</div>
								<div class="form-group">
									<br>
									<textarea class="form-control" rows="15" id="content"
										name="content" placeholder="내용 작성" 
										style="font-size: 17px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										 width: 580px; margin-left: 20px;"><%= enVO.getDiary_content() %></textarea>
								</div>
								<div class="form-group">
								<%if(enVO.getHash_tag()!=null){hashtag=enVO.getHash_tag();}%>
									<br> <input type="text" class="form-control" id="writer"
										placeholder="태그(2자-10자)" name="writer" value="<%=hashtag %>"
										style="font-size: 17px;  border-top: 1px solid rgb(255, 160, 0); border-left: none; border-right: none; 
										 width: 580px; margin-left: 20px;">
								</div >
								<input type="checkbox" name="comment_yn" value="y" style="margin-right: 5px; margin-left: 20px">댓글 허용
								<input type="checkbox" name="public_yn" value="n"
									style="margin-left: 10px; margin-right: 5px;">나만 보기 <br>
								
								<button type="submit" class="btn btn-default" id="btn_submit"
									style="border: 1px solid gray; font-size: 20px; color: black; background: rgb(249, 208, 35); box-shadow: 3px 3px 3px silver;
									border: none; margin-left:15px; width: 50px; margin-bottom: 15px; height: 40px;">수정</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	 	
	 	<script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
	    <script src="assets/js/functions-min.js"></script>
	    <script src="assets/js/comment.js"></script>
	 	
</body>
</html>