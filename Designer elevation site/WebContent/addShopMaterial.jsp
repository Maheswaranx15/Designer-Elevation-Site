<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Shop Materials</title>
<link rel="stylesheet" type="text/css" href="css-l/main.css">
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/Admin.jsp"
}
</script>
</head>
<body style="background-color: #ffcc00">
	<center>
		<br>
		<button id="back" onclick="goFirst()"><b>Back</b></button>
		<br>
		<br> <span style="color: #FF5722; font-size: 35px;"><b>Add
				Shop Materials</b></span><br>
		<br>
		<br>
		<br>
		<script>
			function getBrand() {
				var sel = document.getElementById("brand");
				var opt1 = document.createElement("option");
				var opt2 = document.createElement("option");
				var opt3 = document.createElement("option");
				sel.remove(opt1);
				sel.remove(opt2);
				sel.remove(opt3);
				if (document.getElementById("Materials").value == "Concrete") {
					opt1.text = "Cemex";
					opt2.text = "Jidong";
					opt3.text = "Sinoma";
					sel.add(opt1, null);
					sel.add(opt2, null);
					sel.add(opt3, null);
				} else if (document.getElementById("Materials").value == "Metal") {
					opt1.text = "Custom Metal Stamp";
					opt2.text = "Heat Emboss Stamp ";
					opt3.text = "Custom Wood Brand Iron ";
					sel.add(opt1, null);
					sel.add(opt2, null);
					sel.add(opt3, null);
				} else if (document.getElementById("Materials").value == "Brick") {
					opt1.text = "COGO";
					opt2.text = "STAR DIAMOND";
					opt3.text = "ENLIGHTEN";
					sel.add(opt1, null);
					sel.add(opt2, null);
					sel.add(opt3, null);
				} else if (document.getElementById("Materials").value == "Tiles") {
					opt1.text = "Kajaria Ceramics";
					opt2.text = "Bajaj Tiles";
					opt3.text = "Nitco";
					sel.add(opt1, null);
					sel.add(opt2, null);
					sel.add(opt3, null);
				} else if (document.getElementById("Materials").value == "Wood") {
					opt1.text = "Premium";
					opt2.text = "Rect";
					sel.add(opt1, null);
					sel.add(opt2, null);
				}
			}
		</script>
		<form action="addshopdetails" method="post">
			<table style="font-size: 18px; font-family: verdana;" class="gfg">
				<tr style="margin-bottom: 20px;">
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Product</b> </span></td>
					<td><select class="input100" name="Materials" id="Materials" required
						onchange="getBrand();">
							<option>Concrete</option>
							<option>Metal</option>
							<option>Tiles</option>
							<option>Brick</option>
							<option>Wood</option>
					</select></td>
				</tr>
				<tr>
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Brand </b></span></td>
					<td><select class="input100" name="brand" id="brand" required>
							<option>Sinoma</option>
							<option>Cemex</option>
							<option>Jidong</option>
					</select></td>
				</tr>
				<tr>
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Net Price</b>
					</span></td>
					<td><input class="input100" type="number" name="netprice" required /></td>
				</tr>
				<tr>
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Quantity</b> </span></td>
					<td><input class="input100" type="number" name="Quantity" required/></td>
				</tr>
				<tr>
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Discount </b></span></td>
					<td><input class="input100" type="number" name="Discount" required/></td>
				</tr>
				<tr>
					<td class="geeks"><span
						style="color: white; margin-right: 20px;"><b>Gross
								Price </b></span></td>
					<td><input class="input100" type="number" name="grossprice" required/></td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input id="registerbut" type="submit" value="Add" />
						</center></td>
				</tr>
			</table>
		</form>
	</center>
	<style>
.geeks {
	border-right: hidden;
}

.gfg {
	border-collapse: separate;
	border-spacing: 0 15px;
}

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
</body>
<script src="js/historysur.js"></script>
</html>