<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� -->
	<!-- ------------------------------------------------------------- -->

	<div id="popup" class="hide">
	<div class="content">
	    <table id="content_outer">
	    	<tr class="post_view">
	    		<td id="img_view"><img src="assets/img/2.jpg" alt="" style="width: 700px; height: 700px; object-fit: cover;"></td>
	    		<td id="writing_view">
	    			<table>
	    			
	    				<tr>
	    					<td id="content_nick" colspan='2'><span id="nick_inner">@</span></td>
	    					<td id="content_date" colspan='2'>date</td>
	    				</tr>
	    				<tr>
	    					<td id="content_title" colspan='4'>title</td>
	    				</tr>
	    				<tr>
	    					<td id="content_content" colspan='4'>content</td>
	    				</tr>
	    				<tr>
	    					<td id="content_tag" colspan='4'>hashtag</td>
	    				</tr>
	    				<tr>
	    					<td id="content_hits" >diary_list.get(i).getHits()</td>
	    					<td><button id="content_modify">�����ϱ�</button></td>
	    					<td><button id="content_scrap">��ũ���ϱ�</button></td>
	    					<td><button id="content_subscribe">�����ϱ�</button></td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td id="blank" ></td>
	    		<td id="blank" ></td>
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
	    
    	<button id="close_button" onclick="closePopup()">X</button>
	 	</div>
	 	
	</div>

	
	<!-- ------------------------------------------------------------- -->
	<!-- �Խù� �˾� ���� �� -->
	<!-- ------------------------------------------------------------- -->

</body>
</html>