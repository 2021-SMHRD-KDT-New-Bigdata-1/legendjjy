<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="EUC-KR">
<title>게시물and댓글</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="buckymaler.com">
</head>
<body>
		<div style="width: 1530px;">
        <div id="form-commentInfo"  style="margin:auto; margin-left: 400px;"> 
          <div id="comment-count" >댓글 <span id="count">0</span></div>  
          <input id="comment-input" onkeyup="enterkey();" type="text" value="" placeholder="댓글을 달아주세요." > 
          <button id="submit">OK</button>
         
        </div> 
        </div>
        
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/댓글.js"></script>
</body>
</html>