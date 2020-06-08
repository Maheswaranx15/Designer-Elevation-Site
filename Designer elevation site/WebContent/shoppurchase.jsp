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
String mat = (String)session.getAttribute("Materials");
String count = (String)session.getAttribute("noofcount");
String brand = (String)session.getAttribute("brand");
Date date = (Date)session.getAttribute("purchasedate");
String totprice = (String)session.getAttribute("totalprice");
%>
<center>
<span style="color:#FF5722;font-size:35px;"><b>Purchased Details</b></span><br><br>
<table border=1>
<tr><td style="color:green;font-size:20px;"><b>Product Name </b></td><td style="color:blue;font-size:18px;"><%=mat%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>PurchaseCount </b></td><td style="color:blue;font-size:18px;"><%=count%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Brand Name</b></td><td style="color:blue;font-size:18px;"><%=brand%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Net Price </b></td><td style="color:blue;font-size:18px;"><%=totprice%></td></tr>
<tr><td style="color:green;font-size:20px;"><b>Purchase Date </b></td><td style="color:blue;font-size:18px;"><%=date%></td></tr>

</table>
</center>
</body>
</html>