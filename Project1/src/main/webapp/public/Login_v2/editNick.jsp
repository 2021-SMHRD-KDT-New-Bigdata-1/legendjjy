<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Edit</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<!--===============================================================================================-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
</head>

<body>
<%
	String errNickMsg = (String)session.getAttribute("errNickMsg");
	if(errNickMsg==null){
		errNickMsg = "";
	}
	session.removeAttribute("errNickMsg");
%>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="../../EditService?edit=nick" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						닉네임변경
					</span>

					<div class="wrap-input100 validate-input" data-validate="닉네임은 2~10자 문자 또는 숫자이어야 합니다">
						<input class="input100" type="text" name="nickname">
						<span class="focus-input100" data-placeholder="Nickname"></span>
					</div>
					<div style="text-align: right; margin-bottom: 30px"><button type="button" value="닉네임 중복 확인" style="width: 110px; height: 30px; border: none; 
						color: white; background: #1b5ac2; box-shadow:3px 3px 3px silver;" onclick="checknick()">닉네임 중복 확인</button></div>
					<span class="txt1" style="color:red"><%=errNickMsg %></span>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								닉네임 변경하기
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
		<script>
		function checknick(){
			var nick = $('input#input_nick').val();
			if(nick==""){
				alert("닉네임을 입력해주세요");
			}else{
				$.ajax({
					type: "POST",
					url: "../../CheckNickService",
					data: {"input_nick": nick},
					async: false,
					success: function(data){
						alert(data)
					}
				})
			}
		}
	</script>

</body>

</html>