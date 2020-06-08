<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Transportation Materials</title>
<link rel="stylesheet" type="text/css" href="css-l/main.css">
</head>
<body style="background-color:#ffcc00">
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/Admin.jsp"
}
</script>
<center>
<br>
<button id="back" onclick="goFirst()"><b>Back</b></button><br><br>
<span style="color:#FF5722;font-size:35px;"><b>Add Transportation Materials</b></span><br><br><br><br>
<form action="addtransportdetails" method="post">  
<table style="font-size:18px;font-family:verdana;" class = "gfg">  
<tr style="margin-bottom: 20px;"><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Equipment</b> </span></td><td><select class="input100" name="equipment" required>
  <option>JCB</option>
  <option>Truck</option>
  <option>Lorry</option> 
  <option>Excavators</option>
  <option>Dumpers</option>
  <option>Backhoe Loaders</option> 
</select></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Description of Equipment </b></span></td><td><textarea class="input100" name="description" required></textarea></td></tr>  
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Location of Equipment use </b></span></td><td><input class="input100" type="text" name="location" required/></td></tr>  
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Duration of Equipment use</b> </span></td><td><input class="input100" type="number" name="duration" required/></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Serial Identification Number</b></span></td><td><input class="input100" type="text" name="serialno" required/></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Equipment Quantity</b></span></td><td><input type="number" class="input100" name="quantity" required/></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Rental rate Per Unit</b></span></td><td><input type="number" class="input100" name="rate" required/></td></tr>
<tr><td colspan="2"><center><input id="registerbut" type="submit" value="Add"/></center></td></tr>  
</table>  
</form> 
</center> 
<style>
 .geeks { 
        border-right:hidden; 
      } 
      .gfg { 
          border-collapse:separate; 
          border-spacing:0 15px; 
      } 
#registerbut{
	background: #57b846;
	border-radius:25px;
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