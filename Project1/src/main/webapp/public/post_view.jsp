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

<!-- �Խñ� ���� css -->
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/comment.css">
<link rel="stylesheet" href="assets/css/popup.css">

<!-- ��Ʈ -->
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
	String hashtag = "";
	%>
	<div class="content">
		<table class="post_table">
			<tbody class="post_tbody">
				<tr class="post_view">
					<td id="img_view"><img src="<%=request.getContextPath() %>/upload/<%=enVO.getDiary_title()%>.<%=enVO.getUser_email() %>.png" alt=""
						onerror="this.src='assets/img/basicIMG.png'" style="width: 100%; height: auto; object-fit:cover;"></td>
					<td id="writing_view">
						<table>
							<tr>
								<td id="content_nick" colspan='2'><a href="userprofile.jsp?user_email=<%=enVO.getUser_email()%>"><span id="nick_inner">@<%=userdao.findNick(enVO.getUser_email()) %></span></a></td>
								<td id="content_date" colspan='2'><%=enVO.getDiary_date()%></td>
							</tr>
							<tr>
								<td id="content_title" colspan='4'><%=enVO.getDiary_title()%></td>
							</tr>
							<tr>
								<td id="content_content" colspan='4'><%=enVO.getDiary_content()%></td>
							</tr>
							<tr>
							<%if(enVO.getHash_tag()!=null){hashtag=enVO.getHash_tag();}%>
								<td id="content_tag" colspan='4'><%=hashtag%></td>
							</tr>
							<tr>
								<td id="content_hits">��ȸ�� <%=enVO.getHits()%></td>
								<%
								if (vo == null) {
								%>
								<%
								} else if (vo.getUser_email().equals(enVO.getUser_email())) {
								%>
								<td><a
									href="post_view_update.jsp?diary_seq=<%=enVO.getDiary_seq()%>"><button
											id="content_modify">�����ϱ�</button></a></td>
								<td><a onclick="return confirm('������ �����Ͻðڽ��ϱ�?')"
									href="../DeleteDiaryService?diary_seq=<%=enVO.getDiary_seq()%>"><button
											id="content_modify">�����ϱ�</button></a></td>
								<%
								} else {
								%>
								<td id="<%=enVO.getDiary_seq()%>" onclick="scrap(this.id)"><button
										id="content_scrap">��ũ���ϱ�</button></td>
								<td id="<%=enVO.getUser_email()%>" onclick="subscribe(this.id)"><button
										id="content_subscribe">�����ϱ�</button></td>
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
		
	</div>
	<%
	}
	%>
	
	
		
		<div id="disqus_thread"></div>
		<script>
		    /** 
		    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
		    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
		    /*
		    var disqus_config = function () {
		    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
		    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
		    };
		    */
		    (function() { // DON'T EDIT BELOW THIS LINE
		    var d = document, s = d.createElement('script');
		    s.src = 'https://legend-project.disqus.com/embed.js';
		    s.setAttribute('data-timestamp', +new Date());
		    (d.head || d.body).appendChild(s);
		    })();
		</script>
		<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		
		
		
		
		
	
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
					alert(data);
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
				success: function(data){
					alert(data);
				}
			})
		}
	</script>
</body>
</html>