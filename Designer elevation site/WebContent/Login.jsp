<!DOCTYPE html>
<html lang="en">
<head>
<title>Login V1</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images-l/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor-l/bootstrap/css-l/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts-l/font-awesome-4.7.0/css-l/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor-l/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor-l/css-l-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor-l/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css-l/util.css">
<link rel="stylesheet" type="text/css" href="css-l/main.css">
<!--===============================================================================================-->
</head>
<body>
<script src="js/historysur.js"></script>
<center><button id="back" onclick="goBack()" ><b>Back</b></button></center><br>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images-l/img-01.png" alt="IMG">
				</div>

				<form action="Login" method="post"
					class="login100-form validate-form">
					<span class="login100-form-title"> Member Login </span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email"
							placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Eg. example@email.com" required> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"
							placeholder="Password" required> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Login</button>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="reg_c.jsp"> Create your Account <i
							class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>






	<!--===============================================================================================-->
	<script src="vendor-l/jquery/jquery-3.2.1.min.js-l"></script>
	<!--===============================================================================================-->
	<script src="vendor-l/bootstrap/js-l/popper.js-l"></script>
	<script src="vendor-l/bootstrap/js-l/bootstrap.min.js-l"></script>
	<!--===============================================================================================-->
	<script src="vendor-l/select2/select2.min.js-l"></script>
	<!--===============================================================================================-->
	<script src="vendor-l/tilt/tilt.jquery.min.js-l"></script>
	<script>
		$('.js-l-tilt').tilt({
			scale: 1.1
		})
	</script>
	<!--===============================================================================================-->
	<script src="js-l/main.js-l"></script>

</body>
</html>