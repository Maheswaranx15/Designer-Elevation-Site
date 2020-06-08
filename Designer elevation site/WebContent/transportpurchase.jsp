<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*" %>
<%
String equipment = (String)session.getAttribute("equipment");
String count = (String)session.getAttribute("noofcount");
String location = (String)session.getAttribute("location");
Date date = (Date)session.getAttribute("purchasedate");
String serialno = (String)session.getAttribute("serialno");
String duration = (String)session.getAttribute("duration");
String rentalprice = (String)session.getAttribute("rentalprice");

%>
<center>
<span style="color:#FF5722;font-size:35px;"><b>Equipment Rental Details</b></span><br><br>
<table border=1>
<tr><td style="color:green;font-size:20px;"><b>Equipment Name </b></td><td style="color:blue;font-size:18px;"><%=equipment%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>PurchaseCount </b></td><td style="color:blue;font-size:18px;"><%=count%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Location</b></td><td style="color:blue;font-size:18px;"><%=location%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Serial Number </b></td><td style="color:blue;font-size:18px;"><%=serialno%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Duration </b></td><td style="color:blue;font-size:18px;"><%=duration%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Rental Price </b></td><td style="color:blue;font-size:18px;"><%=rentalprice%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Purchase Date </b></td><td style="color:blue;font-size:18px;"><%=date%></td></tr>

</table>
</center>
</body>
</html>