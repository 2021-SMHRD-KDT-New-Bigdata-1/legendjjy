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

	<div class="container">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tbody>
				<tr>
					<td align="left" bgcolor="beige">댓글</td>
				</tr>
				<tr>
				<%
					commentDAO commentDAO = new commentDAO();
					ArrayList<Comment> list = commentDAO.getList(boardID, diary_seq);
					for(int i=0; i<list.size(); i++){
				%>
						<div class="container">		//댓글하나당 container만들어서 보여줌
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
											<td colspan="2"></td>
											<td align="right">
												<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
												%>
													<form name = "p_search">
														<a type="button" onclick="nwindow(<%=boardID%>,<%=diary_seq %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
													</form>	
														<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>																	
												<%
												}
												%>	
											</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\commentUpload";
												File commentFile = new File(commentReal+"\\"+diary_seq+"사진"+list.get(i).getCommentID()+".jpg");
												if(commentFile.exists()){           //해당 댓글에 대응되는 사진이 있을 경우 사진도 보여준다.
											%>	
											<br><br><img src = "commentUpload/<%=diary_seq%>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>
											<%} %>	
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
</body>
</html>