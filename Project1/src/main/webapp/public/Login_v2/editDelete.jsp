<%@page import="comDAO.usersDAO"%>
<%@page import="comVO.usersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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