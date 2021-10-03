<%@page import="comVO.commentVO"%>
<%@page import="comDAO.commentDAO"%>
<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.entireDiaryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comDAO.diaryDAO"%>
<%@page import="comVO.usersVO"%>
<%@page import="comVO.diaryVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% usersVO uvo = new usersVO();
	commentVO cvo = new commentVO();
%>


	<div class="container">
		<div class="form-group">
			<form method="post" encType = "multipart/form-data" action="commentAction.jsp?diary_seq=<%= diary_seq %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="border-bottom:none;" valign="middle"><br><br><%= user_email %></td>
						<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
						<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
					</tr>
					<tr>
						<td colspan="3"><input type="file" name="fileName"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


</body>
</html>