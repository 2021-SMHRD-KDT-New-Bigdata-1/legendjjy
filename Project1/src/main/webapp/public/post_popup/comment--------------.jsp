<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript" src="comment.js"></script>

	<div id="commentes">
		<div id="comments-head" class="commentrow"></div>
			<span id="comments-count">2</span> Comment(s)
	</div>
	<div class="comment-row">
		<textarea id="new-comment" name="new_comment" rows=5 placeholder="New Cpmment"></textarea>
		<button type="submit" onclick="submitComment()">Submit</button>
	</div>
	<div class="comment-row">
		<div class="comment-date">2020-05-25 03:05:23</div>
		<div class="comment-content">sample comment 1</div>
	<div></div>
	</div>
	<div class="comment-row">
		<div class="comment-date">2020-05-26 14:52:06</div>
		<div class="comment-content">sample comment 2</div>
	<div></div>
	</div>
</body>
</html>