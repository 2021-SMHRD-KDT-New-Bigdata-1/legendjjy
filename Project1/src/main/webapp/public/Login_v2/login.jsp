<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Login</title>
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
	<!--===============================================================================================-->
	<script>
		function checkLoginStatus(){
			var loginBtn = document.querySelector('#loginBtn');
			var nameTxt = document.querySelector('#name');
			if(gauth.isSignedIn.get()){
				console.log('logined');
				loginBtn.value = 'Logout';
				var profile = gauth.currentUser.get().getBasicProfile();
				console.log(profile.getEmail());
				nameTxt.innerHTML = 'Welcome <strong>'+profile.getName()+'</strong>';
			}else {
				console.log('logouted');
				loginBtn.value = 'Login with Google';
				nameTxt.innerHTML = '';
			}
		}
		function init(){
			console.log('init');
			gapi.load('auth2', function() {
				console.log('auth2');
				window.gauth = gapi.auth2.init({
					client_id:'287492847647-v4tckup8j6iartiq1f15sotqek7id16p.apps.googleusercontent.com'
				})
				gauth.then(function(){
					console.log('googleAuth success');
					checkLoginStatus();
				}, function(){
					console.log('googleAuth fail');
				});
			});
		}
	</script>
	<style>
		input[type=button] {
		width: 468px;
		height: 50px;
		box-sizing: border-box;
		border-radius: 50px;
		font-size: 24px;
		}
		#loginBtn:hover {
		cursor: pointer
		}
	</style>
</head>

<body>
<%
	String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg==null){
		errMsg = "";
	}
	session.removeAttribute("errMsg");
%>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="../../LoginService" method="post" class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
					<span class="login100-form-title p-b-48">
						<a href="../index.jsp"><img src="images\logo_small.png"></a>
					</span>

					<div class="wrap-input100 validate-input" data-validate="이메일을 확인해주세요">
						<input class="input100" type="text" name="email">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력해주세요">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pass">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
						<a href="../../JoinService"><input type="button" id="loginBtn" name="email" value="Login with Google" onclick="
						if(this.value === 'Login with Google'){
							gauth.signIn().then(function(){
								checkLoginStatus();
								
							});
						} else {
							gauth.signOut().then(function(){
								checkLoginStatus();
							});
							}"></a>
					</div>
					<div class="text-center p-t-115">
						<span class="txt1" style="color:red"><%=errMsg %></span>	
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							계정이 없으신가요?
						</span>

						<strong><a class="txt2" href="join.jsp">
								회원가입
							</a></strong><br>
						<span class="txt1">
							비밀번호를 잊으셨나요?
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
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

</body>

</html>