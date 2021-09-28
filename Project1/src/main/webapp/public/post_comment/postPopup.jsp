<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/modal.css"/>
<link rel="stylesheet" href="assets/css/댓글.css"/>
<body>
    <div id="root">
   
        <button type="button" id="modal_opne_btn">모달 창 열기</button>
           
    </div>
    <div class="container">
		<div id="modal">
			<div class="modal_header">
			<section style="padding: 50px;">
				<strong><a herf="#" style="display: inline">@legend</a></strong>
				<div class="modal_content">
					<div class="diaryIMG"  style="object-fit: cover;">
						<img id="selectIMG" src="assets/img/camera.png">
					</div>
					<div class="diaryContent">
						<h2 style="margin-bottom: 15px">title</h2>
						<p style="direction:rtl">time</p>
						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
						<section class="list"></section>
					</div>
				</div>
				</section>
			</div>
			<div class="modal_header">
				<section>
					<div style="width: 100%;">
       				<div id="form-commentInfo" style="padding: 50px;"> 
        				<div id="comment-count" >댓글 <span id="count">0</span></div>  
         					<input id="comment-input" onkeyup="enterkey();" type="text" value="" placeholder="댓글을 달아주세요." > 
         					<button id="submit">OK</button>
        			</div> 
        			<div id="comments"></div>
      			</div>
				</section>
				</div>
			<div class="modal_layer">
				<button type="button" class="btm_image" id="modal_close_btn"><img  src="assets/img/closeicon.png" alt=""></button>
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
		$("#modal").attr("style", "display:block");
	});

	$("#modal_close_btn").click(function() {
		$("#modal").attr("style", "display:none");
	});
</script>

</body>
</html>