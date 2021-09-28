<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/content.css"/>
<body>
	<div id="root">
    	<button type="button" id="modal_opne_btn">모달 창 열기</button>
	</div>
	
	<div class="background" role="dialog">
		<div class="header">
			<strong><a href="#">@legend</a></strong>
			<button type="button" id="modal_close_btn">닫기</button>
			<div class="content">
				<div class="dairyIMG">
					<div class="IMG">
						<img src="assets/img/featured.jpg" id="img">
					</div>
				</div>
				<div class="diaryContent">
					<h2>title</h2>
					<p>time</p>
					<p>alsdjfliasjdfliasdjf</p>
				</div>
			</div>
		</div>
	</div>
<script src="../assets/js/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
<script src="assets/js/functions-min.js"></script>
<script src="assets/js/댓글.js"></script>
<script>
	$("#modal_opne_btn").click(function() {
		$(".background").attr("style", "display: inline-block");
	});

	$("#modal_close_btn").click(function() {
		$(".background").attr("style", "display:none");
	});
</script>
</body>
</html>