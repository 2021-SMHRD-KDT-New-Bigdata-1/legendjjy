<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Join</title>
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

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="../../JoinService" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>

					<div class="wrap-input100 validate-input" data-validate="이메일을 확인해주세요" style="margin-bottom: 15px; margin-top: 35px;">
						<input class="input100" id="input_email" type="text" name="email">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>
						<div style="text-align: right"><button type="button" value="이메일 중복 확인" style="width: 110px; height: 30px; border: none; 
						color: white; background: #1b5ac2; box-shadow:3px 3px 3px silver;" onclick="checkemail()">이메일 중복 확인</button></div>
					
					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력해주세요" style="margin-bottom: 40px;">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pass">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="닉네임은 2~10자 문자 또는 숫자이어야 합니다" style="margin-bottom: 15px; margin-top: 35px;">
						<input class="input100" id="input_nick" type="text" name="nickname">
						<span class="focus-input100" data-placeholder="Nickname"></span>
					</div>
						<div style="text-align: right; margin-bottom: 30px"><button type="button" value="닉네임 중복 확인" style="width: 110px; height: 30px; border: none; 
						color: white; background: #1b5ac2; box-shadow:3px 3px 3px silver;" onclick="checknick()">닉네임 중복 확인</button></div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								Create Account
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							가입된 계정이 있으신가요?
						</span>

						<strong><a class="txt2" href="login.jsp">
								로그인
							</a></strong><br>
						<span class="txt1">
							비밀번호를 잊어버리셨나요?
						</span>

						<strong><a class="txt2" href="findpass.html">
								비밀번호 찾기
							</a></strong>
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
		function checkemail(){
			var email = $('input#input_email').val();
			var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if(email==""){
				alert("이메일을 입력해주세요.");
			}else if(email.match(regExp)==null) {
                alert("이메일 형식이 아닙니다.");
			}else{
				$.ajax({
					type: "POST",
					url: "../../CheckEmailService",
					data: {"input_email": email},
					async: false,
					success: function(data){
						alert(data)
					}
				})
			}
		}
	</script>
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