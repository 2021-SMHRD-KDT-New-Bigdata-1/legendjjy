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
					<td align="left" bgcolor="beige">���</td>
				</tr>
				<tr>
				<%
					commentDAO commentDAO = new commentDAO();
					ArrayList<Comment> list = commentDAO.getList(boardID, diary_seq);
					for(int i=0; i<list.size(); i++){
				%>
						<div class="container">		//����ϳ��� container���� ������
							<div class="row">
								<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>						
											<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "��" + list.get(i).getCommentDate().substring(14,16) + "��" %></td>		
											<td colspan="2"></td>
											<td align="right">
												<%
												if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //��� ������� ���� ������ ���� �� ������ ������ �����ϰ� ��
												%>
													<form name = "p_search">
														<a type="button" onclick="nwindow(<%=boardID%>,<%=diary_seq %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">����</a>
													</form>	
														<a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">����</a>																	
												<%
												}
												%>	
											</td>
										</tr>
										<tr>
											<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
											<% 	
												String commentReal = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\commentUpload";
												File commentFile = new File(commentReal+"\\"+diary_seq+"����"+list.get(i).getCommentID()+".jpg");
												if(commentFile.exists()){           //�ش� ��ۿ� �����Ǵ� ������ ���� ��� ������ �����ش�.
											%>	
											<br><br><img src = "commentUpload/<%=diary_seq%>����<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>
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