<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="popup.css">
</head>
<body>

<script type="text/javascript" src="popup.js"></script>

	<button onclick="showPopup(false)">���;��� �˾�â ����</button>
	<button onclick="showPopup()">�����ִ� �˾�â ����</button>
		
	<div id="popup" class="hide">
	<div class="content">
	    <table>
	    	<tr class="post_view">
	    		<td id="img_view"><img src="book_02.jpeg" alt=""></td>
	    		<td id="writing_view">�� ����</td>
	    	</tr>
	    </table>
	    
    	<button onclick="closePopup()" style="position: absolute; top:50px; left: 1750px;"><img alt="" src="testtest.png">�ݱ�</button>
	 </div>
	</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>

</body>
</html>