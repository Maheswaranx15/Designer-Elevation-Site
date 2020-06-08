<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<script src="js/historysur.js"></script>
<link rel="stylesheet" type="text/css" href="css-l/main.css">
</head>
<body style="background-color:#ffcc00">
<% String title = (String)session.getAttribute("Title"); 
%>
<center><br>
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/Adminlogin.jsp"
}
</script>
<button id="back" onclick="goFirst()"><b>Back</b></button><br><br>
<a href="addShopMaterial.jsp" style="font-size:18px;margin-right: 15px"><b>Add Shop Materials</b></a>
<a href="addTransportMaterial.jsp" style="font-size:18px;"><b>Add Transportation Materials</b></a>
<br><br>
<span style="color:#FF5722;font-size:35px;"><b>Subscriber List</b></span><br><br>
<form action="admindetails" method="post" onsubmit="return checkDupTitle();" enctype="multipart/form-data">  
<table style="font-size:18px;font-family:verdana;" class = "gfg">  
<tr style="margin-bottom: 20px;"><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Category </b></span></td><td>
<select class="input100" name="category" required>  
<option>Modular Kitchen</option>  
<option>Interior Design</option>  
<option>Bedroom Design</option>  
<option>Proper Design</option>  
</select>
</td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Title</b> </span></td><td><input class="input100" type="text" name="Title" id="Title" required/></td></tr>  <br>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Cost </b></span></td><td><input class="input100" type="number" name="Cost" required/></td></tr>  
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Builder </b></span></td><td><input class="input100" type="text" name="Builder" required/></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Materials </b></span></td><td><select class="input100" multiple name="Material" required>
  <option>Sand</option>
  <option>Iron</option>
  <option>Bricks</option> 
  <option>Cement</option>
</select></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Styles</b> </span></td><td><select class="input100" multiple name="Styles" required>
  <option>Mexican</option>
  <option>Italian</option>
  <option>spain</option> 
</select></td></tr>
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Image</b></span></td><td>
<input class="input100" type="file" name="file" required/><br/>  
<tr><td class = "geeks"><span style="color:white;margin-right: 20px;"><b>Audio</b></span></td><td>
<input class="input100" type="file" name="audio" required/><br/> 
<tr><td ><span style="color:white;margin-right: 20px;"><b>video </b></span></td><td>
<input class="input100" type="file" name="video" required/><br/> 
</td></tr>  
<tr id="errmsgpar" style="display:none;"><td colspan="2"><center><span style="color:red" id="errmsg"></span></center></td></tr>
<tr><td colspan="2"><center><input id="registerbut" type="submit" value="Upload"/></center></td></tr>  
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
<script>
function checkDupTitle(){
 	 var tit = "<%=title%>";
 	 if(tit.indexOf(document.getElementById("Title").value) >= 0){
	 	document.getElementById("errmsgpar").style.display = "block";
		document.getElementById("errmsg").innerHTML = "Title Already Exists";
		return false;
 	 }else{
 		document.getElementById("errmsgpar").style.display = "none";
		document.getElementById("errmsg").innerHTML = "";
		return true;
 	 }
}
</script>
</body>
</html>