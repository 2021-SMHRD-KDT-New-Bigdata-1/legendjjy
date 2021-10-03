<%@page import="comVO.entireDiaryVO"%>
<%@page import="comDAO.usersDAO"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap"
	rel="stylesheet">

</head>
<body>
	<%
	usersVO vo = (usersVO) session.getAttribute("vo");
	usersDAO userdao = new usersDAO();
	diaryDAO dao = new diaryDAO();
	int post_seq = Integer.parseInt(request.getParameter("post_seq"));
	entireDiaryVO enVO = dao.select_diary(post_seq);
	%>
	<div class="content">
		<table class="post_table">
			<tbody class="post_tbody">
				<tr class="post_view">
					<td id="img_view"><img src="assets/img/2.jpg" alt=""
						style="width: 700px; height: 700px; object-fit: cover;"></td>
					<td id="writing_view">
						<table>
							<tr>
								<td id="content_nick" colspan='2'><span id="nick_inner">@<%=userdao.findNick(enVO)%></span></td>
								<td id="content_date" colspan='2'><%=enVO.getDiary_date()%></td>
							</tr>
							<tr>
								<td id="content_title" colspan='4'><%=enVO.getDiary_title()%></td>
							</tr>
							<tr>
								<td id="content_content" colspan='4'><%=enVO.getDiary_content()%></td>
							</tr>
							<tr>
								<td id="content_tag" colspan='4'><%=enVO.getHash_tag()%></td>
							</tr>
							<tr>
								<td id="content_hits">조회수 <%=enVO.getHits()%></td>
								<%
								if (vo == null) {
								%>
								<%
								} else if (vo.getUser_email().equals(enVO.getUser_email())) {
								%>
								<td><a
									href="post_view_update.jsp?diary_seq=<%=enVO.getDiary_seq()%>"><button
											id="content_modify">수정하기</button></a></td>
								<td><a onclick="return confirm('정말로 삭제하시겠습니까?')"
									href="/Project1/src/main/java/comSERVLET/DeleteDiaryService.java?diary_seq=<%=enVO.getDiary_seq()%>"><button
											id="content_modify">삭제하기</button></a></td>
								<%
								} else {
								%>
								<td id="<%=enVO.getDiary_seq()%>" onclick="scrap(this.id)"><button
										id="content_scrap">스크랩하기</button></td>
								<td id="<%=enVO.getUser_email()%>" onclick="subscribe(this.id)"><button
										id="content_subscribe">구독하기</button></td>
								<%
								}
								%>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td id="blank"></td>
					<td id="blank"></td>
				</tr>
			</tbody>
		</table>
		<%
		if (enVO.getComment_yn().equals("y")) {
		%>
		<div id="featured" class="blurb" style="position: relative;">
			<div style="text-align: right; margin-right: 10%;">
				<button
					style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;">
					<img src="letters/write_icon2.png" alt=""
						style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
				</button>
			</div>

			<div id="form-commentInfo">
				<div id="comment-count">
					댓글 <span id="count">0</span>
				</div>
				<input id="comment-input" placeholder="댓글 작성">
				<button id="submit">OK</button>
			</div>
			<div id="comments" style="margin-top: 20px;"></div>
		</div>
	</div>
	<%
	}
	%>
	<button id="close_button" onclick="history.back()">X</button>
	<script
		src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')
	</script>
	<script src="assets/js/functions-min.js"></script>
	<script src="assets/js/comment.js"></script>
	<script>
		function scrap(clicked_id) {
			var seq = clicked_id;
			$.ajax({
				type : "POST",
				url : "../ScrapService",
				data : {
					"post_seq" : seq
				},
				async : false,
				success : function(data) {
					alert('스크랩되었습니다');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				}
			})
		}
	</script>
	<script>
		function subscribe(clicked_id) {
			var post_email = clicked_id;
			$.ajax({
				type : "POST",
				url : "../FollowService",
				data : {"follow_email" : post_email},
				async : false,
				success : function(data) {
					alert("구독되었습니다.");
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				}
			})
		}
	</script>
	<script>
		function del() {
			const del = confirm("해당 게시글을 삭제하시겠습니까?");
			if (del) {
				location.href = 'DeleteDiaryService?diary_seq='
						+
	<%=enVO.getDiary_seq()%>
		;
			}
		}
	</script>
</body>
</html>