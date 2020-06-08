<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transport Success</title>
<link rel="stylesheet" type="text/css" href="css-l/main.css">
</head>
<body style="background-color:#ffcc00">
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/addTransportMaterial.jsp"
}
</script>
<center>
<%
String suc = (String)session.getAttribute("msg");
session.setAttribute("msg","");
%>
<br>
<button id="back" onclick="goFirst()"><b>Back</b></button><br><br>
<br><br>
<span style="color:white;font-size:30px"><%=suc%></span>
<script src="js/historysur.js"></script>
</center>
</body>
</html>