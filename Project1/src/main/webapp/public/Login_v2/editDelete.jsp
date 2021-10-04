<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session = request.getSession();
	usersVO vo = (usersVO)session.getAttribute("vo");
	usersDAO dao = new usersDAO();
	int cnt = dao.editDelete(vo);
	if(cnt>0){
		session.removeAttribute("vo");%>
		<script>
			alert("탈퇴가 완료되었습니다")
			location.href = "../index.jsp"
		</script>
	<%} %>
</body>
</html>