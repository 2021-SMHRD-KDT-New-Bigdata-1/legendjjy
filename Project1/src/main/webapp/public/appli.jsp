<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"> 
<head>
 <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
   <title>출판신청페이지</title> 
   <style> 
   * { 
   		box-sizing: border-box;
   		 } 
   body { 
   		margin: 0; 
   		padding: 0; 
   		color: #ffffff; 
   		font-size: 15px; 
   		} 
   input, textarea, button { 
   		color: #ffffff; 
   		font-size: 18px; 
   		} 
   input:focus, textarea:focus, button:focus { 
   		outline: none; 
   		} 
   textarea { 
   		resize: none; 
   		} 
   h3 { 
   		margin: 0 0 12px 0; 
   		font-size: 45px; 
   		text-align: center; 
   		text-transform: uppercase; 
   		} 
   p { 
   		padding: 0 10px; 
   		margin: 0 0 55px 0; 
   		text-align: center; 
   		line-height: 2.8; 
   		} 
   .wrapper { 
   		min-height: 100vh; 
   		display: flex; 
   		align-items: center; 
   		} 
   .form-container { 
   		max-width: 767px; 
   		width: 650px;
   		margin: auto; 
   		padding: 70px 100px 80px; 
   		border: 10px solid ; 
   		background: #ffe1b9; 
   		box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2); 
   		} 
    .form-group { 
    	position: relative; 
    	display: block; 
    	margin-bottom: 48px; 
    	} 
    .form-group span { 
    	position: absolute; 
    	font-weight: bold;
    	top: 11px; 
    	color: ivory; 
    	font-size: 18px; 
    	cursor: text; 
    	transition: all 0.2s ease; 
    	transform-origin: 0 0; 
    	} 
    .form-group span.border { 
    	position: absolute; 
    	left: 0; 
    	top: 41px; 
    	width: 100%; 
    	height: 2px; 
    	display: block;
    	background: #ffffff; 
    	transform: scaleX(0); 
    	transition: all 0.15s ease; 
    	} 
    .form-control { 
    	width: 100%; 
    	height: 43px;
    	display: block; 
    	font-size: 15px; 
    	border: none; 
    	border-bottom: 2px solid white;
    	background: none; 
    	} 
    .form-control:focus, .form-control:valid { 
    	border-bottom: 2px solid #ffffff; 
    	} 
    .form-control:focus + span, .form-control:valid + span { 
    	transform: translateY(-22px) scale(0.8); 
    	} 
    .form-control:focus + span + .border, .form-control:valid + span + .border { 
    	transform: scaleX(1); 
    	} 
    textarea.form-control { 
    	padding: 13px 1px; 
    	} 
    button[type="submit"] { 
    	width: 162px; 
    	height: 51px; 
    	display: flex; 
    	align-items: center; 
    	justify-content: center; 
    	margin: 60px auto 0;
    	padding: 0; 
    	color: #ffffff; 
    	border: 2px solid #ffffff; 
    	border-radius: 4px; 
    	background-color: rgb(249,208,35); 
    	cursor: pointer; 
    	text-transform: uppercase; 
    	transition: background-color 0.2s linear; 
    	} 
    button[type="submit"]:hover { 
    	background-color: #299cd1; 
    	} 
    @media(max-width:767px) { 
    	h3 { 
    		font-size: 38px 
    		}
    	p { 
    		padding: 0; 
    		font-size: 14px; 
    		} 
    	.wrapper { 
    		background: #39459b; 
    		border: 10px solid #95c6db; 
    		} 
    	.form-container {
    		width: 100%; 
    		padding: 24px;
    		border: none; 
    		box-shadow: none; 
    		}
    	 } 
    	 </style> 
    </head> 
    	 <body> 
    	 	<div class="wrapper"> 
    	 		<div class="form-container"> 
    	 			<form> 
    	 				<h3>출판 신청</h3>
						<p>양식에 맞게 기입해주세요.</p> 
						<div class="form-group"> 
							<input type="text" name="email" class="form-control" required> 
							<span>이메일</span> 
							<span class="border"></span> 
						</div> 
						<div class="form-group"> 
							<input type="text" name="require" class="form-control" required> 
							<span>요청사항</span> 
							<span class="border"></span> 
						</div> 
						<div class="form-group"> 
							<span>디자인 선택</span> 
							<input type="radio" name="chk_design" value="1" required><img src="" alt="">
							<input type="radio" name="chk_design" value="2"><img src="" alt="">
							<input type="text" name="design" class="form-control" required> 
						</div> 
						<button type="submit">신청하기</button> 
					</form> 
				</div> 
			</div> 
		</body>
	 </html>

