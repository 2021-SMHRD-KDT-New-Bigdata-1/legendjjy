<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="EUC-KR">
 <title>�Խù�and���</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="buckymaler.com">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/comment.css">
	<link rel="stylesheet" href="assets/css/popup.css">

</head>

<body>


	<button onclick="showPopup()">�˾�â ����</button>
		
	<div id="popup" class="hide">
	<div class="content">
	    <table>
	    	<tr class="post_view">
	    		<td id="img_view"><img src="sample01.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    				<tr>
	    					<td id="content_title" style="background: burlywood;" >����</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" style="background: wheat;" >���� Content and contents are nouns.</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" style="background: pink;" >#�±�1 #�±�2 #�±�3</td>
	    				</tr>
	    				<tr>
	    					<td id="content_date">2021-09-30</td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id= "content_hits" style="border-top: solid 1px black; border-bottom: solid 1px black; background: yellow;">��ȸ�� 1321</td>
	    		<td style="border-top: solid 1px black; border-bottom: solid 1px black;">
	    			<table>
	    				<tr>
	    					<td id="content_nick" style="background: aquamarine;">@legendjjy</td>
	    					<td id="content_scrap" style="background: gray;">��ũ����ư</td>
	    					<td id="content_subscribe" style="background: skyblue;">������ư</td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	
	    </table>
	    
	    <div id="featured" class="blurb" style="position: relative;">
        			<div style="text-align: right; margin-right: 10%;"><button style="width: 30px; height: 30px; position: relative; background-color: transparent; border: none;"><img src="letters/write_icon2.png" alt="" style="position:absolute; top:50%; left:50%; transform: translate(-50%, -50%);"></button></div>
	    		
		    		<div id="form-commentInfo"> 
			          <div id="comment-count" >��� <span id="count">0</span></div>  
			          <input id="comment-input" placeholder="��� �ۼ�" > 
			          <button id="submit">OK</button>
		        	</div> 
		        		<div id=comments style="margin-top: 20px; "></div>
     				 </div>
	    
    	<button onclick="closePopup()" style="position: absolute; top:50px; left: 1750px;"><img alt="" src="#">�ݱ�</button>
	 	</div>
	 	
	</div>

    <script src="https://ajaax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
    <script src="assets/js/functions-min.js"></script>
    <script src="assets/js/comment.js"></script>
    <script type="text/javascript" src="assets/js/popup.js"></script>

</body>
</html>