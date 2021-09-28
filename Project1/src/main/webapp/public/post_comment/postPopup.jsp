<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/css/modal.css"/>
<link rel="stylesheet" href="assets/css/ÔøΩÔøΩÊπ≤ÔøΩ.css"/>
<body>
    <div id="root">
   
        <button type="button" id="modal_opne_btn">Ôßè‚ë§ÔøΩÔøΩ Ôß°ÔøΩ ÔøΩÎãøÎ¶∞</button>
           
    </div>
    <div class="container">
		<div id="modal">
			<div class="modal_header">
<<<<<<< HEAD
			<section style="padding: 50px;">
				<strong><a herf="#" style="display: inline">@legend</a></strong>
=======
			<section>
				<strong><a herf="#" style="display: inline margin: 20px">@legend</a></strong>
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/legendjjy.git
				<div class="modal_content">
					<div class="diaryIMG"  style="object-fit: cover;">
						<img id="selectIMG" src="assets/img/camera.png">
					</div>
					<div class="diaryContent">
						<h2 style="margin-bottom: 15px">title</h2>
						<p style="direction:rtl">time</p><br>
						<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
						<section class="list"></section>
					</div>
				</div>
				</section>
			</div>
			<div class="modal_header">
				<section>
<<<<<<< HEAD
					<div style="width: 100%;">
       				<div id="form-commentInfo" style="padding: 50px;"> 
        				<div id="comment-count" >¥Ò±€ <span id="count">0</span></div>  
         					<input id="comment-input" onkeyup="enterkey();" type="text" value="" placeholder="¥Ò±€¿ª ¥ﬁæ∆¡÷ººø‰." > 
=======
					<div style="width: 100%; height:450px; overflow-x: hidden;">
       				<div id="form-commentInfo"> 
<<<<<<< HEAD
        				<div id="comment-count" >ÎåìÍ∏Ä <span id="count">0</span></div>  
         					<input id="comment-input" onkeyup="enterkey();" type="text" value="" placeholder="ÎåìÍ∏ÄÏùÑ Îã¨ÏïÑÏ£ºÏÑ∏Ïöî." > 
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/legendjjy.git
=======
        				<div id="comment-count" >ÔøΩÔøΩÊπ≤ÔøΩ <span id="count">0</span></div>  
         					<input id="comment-input" onkeyup="enterkey();" type="text" value="" placeholder="ÔøΩÔøΩÊπ≤ÔøΩÔøΩÔøΩ ÔøΩ—äÔøΩÔøΩ‰∫åÏá±ÔøΩÎ™ÑÔøΩÔøΩ." > 
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-New-Bigdata-1/legendjjy.git
         					<button id="submit">OK</button>
        			</div> 
        			<div id="comments"></div>
      				</div>
				</section>
			</div>
			<div class="modal_layer">
				<button type="button" class="btm_image" id="modal_close_btn"><img src="assets/img/closeicon.png" alt=""></button>
			</div>
		</div>
	</div>
<script src="../assets/js/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-2.2.4.min.js"><\/script>')</script>
<script src="assets/js/functions-min.js"></script>
<script src="assets/js/ÔøΩÔøΩÊπ≤ÔøΩ.js"></script>
<script>
	$("#modal").hide();
	$("#modal_opne_btn").click(function() {
		$("#modal").attr("style", "display:block");
	});

	$("#modal_close_btn").click(function() {
		$("#modal").attr("style", "display:none");
	});
</script>

</body>
</html>