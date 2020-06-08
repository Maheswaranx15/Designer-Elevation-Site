<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Shop Materials</title>
<script src="js/historysur.js"></script>
<style>
#audioId{
	width:500px;
}
</style>
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/indexsuc.jsp";
}
</script>
<style>
#searchbut {
	background: #f6fbf5;
	border-radius: 25px;
	font-family: Montserrat-Bold;
	font-size: 15px;
	line-height: 1;
	color: block;
	text-transform: uppercase;
	width: 100%;
	height: 20px;
}
</style>
</head>
<body style="background-color:#ffcc00">
<center>
<button id="back" onclick="goFirst()">Back</button><br><br>
<span style="color:#FF5722;font-size:35px;"><b>Search Shop Materials</b></span><br><br><br><br>
<%@ page import="java.util.*" %>
<form action="searchmodular" method="post" enctype="multipart/form-data">  
<input type="hidden" name="category" value="Modular Kitchen">
<table>
<tr><td><span style="color:#2196F3;font-size:20px"><b>Search Product </b></span><input type="file" name="file"/></td>
<td><input type="submit" id="searchbut" value="Search"/></td>
<tr> <td style="color:white;font-size:15px"><center>(or)</center></td> </tr>
<tr><td><span style="color:#2196F3;font-size:20px"><b>Enter Product </b></span><input type="text" name="prod"/></td>
<td><input type="submit" id="searchbut" value="Search"/></td>
</tr> 
</table>  
</form>  
<table>
<% Map map = (Map)session.getAttribute("moduler");
String msg = (String)session.getAttribute("msg");
session.setAttribute("msg","");
if(map !=null){
%>
<tr><td><span style="color:white;font-size:18px;">Cost </span></td> <td><b style="font-size:18px;"><%=map.get("Cost")%></b> </td></tr>
<tr><td><span style="color:white;font-size:18px;">Builder </span></td> <td><b style="font-size:18px;"> <%=map.get("Builder")%></b> </td></tr>
<tr><td><span style="color:white;font-size:18px;">Styles </span></td> <td><b style="font-size:18px;"> <%=map.get("Styles")%></b> </td></tr>
<tr><td><span style="color:white;font-size:18px;">Images </span></td><td><img src="<%=map.get("Image")%>" width="500px" height="500px"/></td></tr>
<tr><td><span style="color:white;font-size:18px;">Audio </span></td> <td> <audio src="<%=map.get("Audio")%>"  controls="true" id="audioId"/></td></tr>
<tr><td><span style="color:white;font-size:18px;">Video </span></td> <td> <video width="500px" height="500px" controls="controls"><source src="<%=map.get("Video")%>" type="video/ogg"></video></td></tr>
<%}else{ %>
<br><br>
<span style="color:white;font-size:20px"> <%=(msg==null)?"":msg%></span>
<%} %>
</table>
</center>
</body>
</html>