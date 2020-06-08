<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Equipment List</title>
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
<span style="color:#FF5722;font-size:35px;"><b>Equipment List</b></span><br><br><br><br>
<%@ page import="java.util.*" %>
<table border=1>
<tr>
<th style="color:white;font-size:20px;">Product ID</th>
<th style="color:white;font-size:20px;">Equipment Name</th>
<th style="color:white;font-size:20px;">Description of Equipment</th>
<th style="color:white;font-size:20px;">Location of Equipment</th>
<th style="color:white;font-size:20px;">Duration of Equipment</th>
<th style="color:white;font-size:20px;">Serial Number</th>
<th style="color:white;font-size:20px;">Rental Rate</th>
<th style="color:white;font-size:20px;">Availability</th>
<th style="color:white;font-size:20px;" >Quantity</th>
<th style="color:white;font-size:20px;">No of Count</th>
<th style="color:white;font-size:20px;">Purchase</th>
</tr>
<%
List list = (List)session.getAttribute("transportlist");
for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
%>
<tr>
<td style="color:blue;font-size:18px;"><%=map.get("productid") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("equipment") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("description") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("location") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("duration") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("serialno") %></td>
<td style="color:blue;font-size:18px;"><%=map.get("rate")%></td>
<td style="color:blue;font-size:18px;"><%=map.get("availability")%></td>
<td style="color:blue;font-size:18px;" id="quantity<%=i%>"><%=map.get("quantity")%></td>
<td><input type="text" id="count<%=i%>"> </td>
<td><img src="images/arrow-57-xxl.png" width="40px" height="40px" onclick="prodpurchaset(<%=map.get("productid") %>,<%=map.get("rate") %>,'<%=map.get("availability")%>',<%=i%>,<%=map.get("quantity")%>)"></td>
</tr>
<%} %>

</table>
</center>
<br><br>
<div id="transportdet"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function prodpurchaset(produtid,price,availability,i,quantity){
	console.info(document.getElementById("quantity"+i).innerText);
	console.info(document.getElementById("count"+i).value);
	if(parseInt(document.getElementById("quantity"+i).innerText) >= parseInt(document.getElementById("count"+i).value)){
		 $.ajax({
	        type: 'POST',
	        url: '/Designers_elevation_sites/rentalproduct?produtid='+produtid+'&count='+document.getElementById("count"+i).value+'&price='+price+'&availability='+availability+'&quantity='+document.getElementById("quantity"+i).innerText,
			 success: function(resp){
				 document.getElementById("quantity"+i).innerHTML = document.getElementById("quantity"+i).innerText-document.getElementById("count"+i).value;
				 document.getElementById("transportdet").innerHTML = resp;
				 var count = document.getElementById("quantity"+i).innerText;
				 document.getElementById("count"+i).value = "";
				 if(count ==0){
				 	document.getElementById("count"+i).disabled  = true;
				 }
			 }
		});
	}else{ 
		alert("No Stock Available");
	}
}
</script>
</body>
</html>