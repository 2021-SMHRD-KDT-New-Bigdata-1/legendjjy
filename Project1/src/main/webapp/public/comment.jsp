<%@page import="comVO.Comment"%>
<%@page import="comDAO.CommentDAO"%>
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
<div class="container">

			<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td align="left" bgcolor="skyblue">���</td>
							</tr>
							<tr>
								<%
									CommentDAO commentDAO = new CommentDAO();
									ArrayList<Comment> list = commentDAO.getList(bbsID);
									for (int i = 0; i < list.size(); i++) {
								%>
								<div class="container">
									<div class="row">
										<table class="table table-striped"
											style="text-align: center; border: 1px solid #dddddd">
											<tbody>
												<tr>
													<td align="left"><%=list.get(i).getUserID()%></td>

													<td align="right"><%=list.get(i).getCommentDate().substring(0, 11) + list.get(i).getCommentDate().substring(11, 13)
						+ "��" + list.get(i).getCommentDate().substring(14, 16) + "��"%></td>
												</tr>

												<tr>
													<td align="left"><%=list.get(i).getCommentContent()%></td>
													<td align="right"><a
														href="commentUpdate.jsp?bbsID=<%=bbsID%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-warning">����</a> <a
														onclick="return confirm('������ �����Ͻðڽ��ϱ�?')"
														href="commentDeleteAction.jsp?bbsID=<%=bbsID%>&commentID=<%=list.get(i).getCommentID()%>"
														class="btn btn-danger">����</a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<%
									}
								%>
							</tr>
					</table>
				</div>
			</div>
			<br>
			<div class="container">
				<div class="row">
					<form method="post" action="submitAction.jsp?bbsID=<%=bbsID%>">
						<table class="table table-bordered"
							style="text-align: center; border: 1px solid #dddddd">
							<tbody>
								<tr>
									<td align="left"><%=userID%></td>
								</tr>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="��� ����" name="commentContent" maxlength="300"></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="btn btn-success pull-right"
							value="��� ����">
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>

</html>