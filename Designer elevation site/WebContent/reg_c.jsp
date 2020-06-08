<!DOCTYPE html>
<html lang="en">
<head>
<title>Register</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images_c/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/bootstrap/css_c/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts_c/font-awesome-4.7.0/css_c/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/animsition/css_c/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor_c/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css_c/util.css">
<link rel="stylesheet" type="text/css" href="css_c/main.css">
<!--===============================================================================================-->
</head>
<body>
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/Login.jsp"
}
</script>
<center><button id="back" onclick="goFirst()"><b>Back</b></button><br></center>

	<form action="Register" method="post"
		class="contact100-form validate-form">
		<div class="container-contact100">
			<div class="wrap-contact100">

				<span class="contact100-form-title"> Register </span> <label
					class="label-input100" for="first-name">Tell us your name *</label>
				<div class="wrap-input100 rs1-wrap-input100 validate-input"
					data-validate="Type first name">
					<input id="first-name" class="input100" type="text"
						name="first-name" placeholder="First name" required> <span
						class="focus-input100" ></span>
				</div>
				<div class="wrap-input100 rs2-wrap-input100 validate-input"
					data-validate="Type last name">
					<input class="input100" type="text" name="last-name"
						placeholder="Last name" required> <span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="age">Enter_age</label>
				<div class="wrap-input100">
					<input id="phone" class="input100" type="text" name="age"
						placeholder="Eg.number" required> <span class="focus-input100"></span>
				</div>
				<label class="label-input100" for="nationality">Enter nation</label>
				<div class="wrap-input100">
					<input id="phone" class="input100" type="text" name="nationality"
						placeholder="Eg.nation" required> <span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="phone">Enter phone number</label>
				<div class="wrap-input100">
					<input id="phone" class="input100" type="text" name="phone"
						placeholder="Eg. +1 800 000000"
						pattern="[7-9]{1}[0-9]{9}"  title="Eg. +1 800 000000" required> <span
						class="focus-input100" ></span>
				</div>

				<label class="label-input100" for="email">Enter your email *</label>
				<div class="wrap-input100 validate-input"
					data-validate="Valid email is required: ex@abc.xyz">
					<input id="email" class="input100" type="text" name="email"
						placeholder="Eg. example@email.com" required
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="Eg. example@email.com" > <span
						class="focus-input100"></span>
				</div>
				<label class="label-input100" for="pass"> create-Password *</label>
				<div class="wrap-input100 validate-input"
					data-validate="Valid password is required: 756774uguyg">
					<input id="email" class="input100" type="text" name="pass"
						placeholder="Eg. example@email.com"
						title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
						required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"> <span
						class="focus-input100"></span>
				</div>

				<label class="label-input100" for="message">Address</label>
				<div class="wrap-input100 validate-input"
					data-validate="address is required">
					<textarea id="message" class="input100" name="address"
						placeholder="Write us a address" required></textarea>
					<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
					<button id="registerbut">Register</button>
				</div>
			</div>

		</div>
	</form>


	<style>
#registerbut {
	background: #57b846;
	border-radius: 25px;
	font-family: Montserrat-Bold;
	font-size: 15px;
	line-height: 1.5;
	color: #fff;
	text-transform: uppercase;
	width: 100%;
	height: 50px;
}
</style>

	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor_c/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor_c/animsition/js_c/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor_c/bootstrap/js_c/popper.js"></script>
	<script src="vendor_c/bootstrap/js_c/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor_c/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor_c/daterangepicker/moment.min.js"></script>
	<script src="vendor_c/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor_c/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js_c/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js_c?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js_c', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

</body>
</html>
