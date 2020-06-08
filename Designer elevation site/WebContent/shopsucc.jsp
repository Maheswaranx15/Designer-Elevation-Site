<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Material List</title>
<script src="js/historysur.js"></script>
<link href="css/layout.css" rel="stylesheet" type="text/css" media="all">

</head>
<body style="background-color:#ffcc00">
<center>
<script>
function goFirst(){
	window.location = "/Designers_elevation_sites/indexsuc.jsp"
}
</script>
<button id="back" onclick="goFirst()"><b>Back</b></button><br><br>
<span style="color:#FF5722;font-size:35px;"><b>Material List</b></span><br><br><br><br>
<%@ page import="java.util.*" %>
<table border=1>
<tr>
<th style="color:white;font-size:20px;">Product ID</th>
<th style="color:white;font-size:20px;">Product Name</th>
<th style="color:white;font-size:20px;">Brand Name</th>
<th style="color:white;font-size:20px;">Net Price</th>
<th style="color:white;font-size:20px;">Quantity</th>
<th style="color:white;font-size:20px;">Discount</th>
<th style="color:white;font-size:20px;">Total Price</th>
<th style="color:white;font-size:20px;">No of Count</th>
<th style="color:white;font-size:20px;">Purchase</th>
</tr>
<%
List list = (List)session.getAttribute("shoplist");
for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
%>
<tr>
<td style="color:blue;font-size:18px;"><%=map.get("productid") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("Materials") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("brand") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("netprice") %></td>
<td style="color:blue;font-size:18px;" id="quentity<%=i%>"><%=map.get("Quantity") %></td>

<td style="color:blue;font-size:18px;"><%=map.get("Discount") %>%</td>
<td style="color:blue;font-size:18px;"><%=map.get("totalprice")%></td>
<td><input type="text" id="count<%=i%>"> </td>
<td><img src="images/arrow-57-xxl.png" width="40px" height="40px" onclick="prodpurchase(<%=map.get("productid") %>,<%=map.get("Quantity") %>,<%=map.get("totalprice") %>,<%=i%>)"></td>
</tr>
<%} %>

</table>
</center>
<br><br>
<div id="shopdet"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

function prodpurchase(produtid,quantity,price,i){
	if(parseInt(document.getElementById("quentity"+i).innerText) >= parseInt(document.getElementById("count"+i).value)){
	 $.ajax({
        type: 'POST',
        url: '/Designers_elevation_sites/purchaseproduct?produtid='+produtid+'&quantity='+document.getElementById("quentity"+i).innerText+'&count='+document.getElementById("count"+i).value+'&price='+price,
		 success: function(resp){
			 document.getElementById("quentity"+i).innerHTML = document.getElementById("quentity"+i).innerText-document.getElementById("count"+i).value;
			 document.getElementById("shopdet").innerHTML = resp;
			 var count = document.getElementById("quentity"+i).innerText;
			 document.getElementById("count"+i).value = "";
			 if(count == 0){
			 	document.getElementById("count"+i).disabled  = true;
			 }
		 }
	}) 
	}else{
		alert("No Stock Available");
	}
}
</script>
</body>
</html>