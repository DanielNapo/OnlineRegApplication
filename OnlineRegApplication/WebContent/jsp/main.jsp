<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.button {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 8px 16px 8px 16px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
window.onload = function() {
	  var input = document.getElementById("fNames").focus();
}
</script>
<title>Online Reg Application</title>
</head>
<body>
<%

String fullNameErrorMsg = (String)request.getAttribute("fullNameErrorMsg");
String idNumberErrorMsg = (String)request.getAttribute("idNumberErrorMsg");
String duplicateRecordErrorMsg = (String)request.getAttribute("duplicateRecordErrorMsg");
String fullName = (String)request.getAttribute("fullName");
String idNumber = (String)request.getAttribute("idNumber");
short fullNameCount = (Short)request.getAttribute("fullNameCount");
short idNumberCount = (Short)request.getAttribute("idNumberCount");
short duplicateRecord = (Short)request.getAttribute("duplicateRecord");

%>
	<br>
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #000000">
	
		<table align="center" style="text-align: left;">

			<tr><th><a class="button" href="<%=request.getContextPath()%>/OnlineRegApplication?view=home">Home</a></th></tr>
			
		</table>
	
	</div>
	<br>
	<br>
	<br>
	<br>
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #FF7F50">
		<h1>Online Registration Application</h1>
	</div>
	<br>
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #228B22">
		<p>Please fill in your details below</p>
	</div>
	<br>
	<br>
<form autocomplete="off" action="OnlineRegApplication?view=register" method="post">
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #000080">
				<%if(duplicateRecord>0){ %>
				<div style="font-family: tahoma;font-size:12px;font-weight: normal;color: Red"><%=duplicateRecordErrorMsg %></div>
				<%} %>
				<br>
		<table align="center" style="text-align: left;">
			<tr>
				<th>Full Name</th>
				<th><input id="fNames" style="background-color:navy;color:white" type="text" value="<%=fullName %>" width=820px name="fullName"></th>
				<th>
				<%if(fullNameCount>0){ %>
				<div style="font-family: tahoma;font-size:12px;font-weight: normal;color: Red"><%=fullNameErrorMsg %></div>
				<%} %>
				</th>
			</tr>
			
			<tr>
				<th>ID Number</th>
				<th><input style="background-color:navy;color:white" type="text" value="<%=idNumber %>" width=820px name="idnumber"></th>
				<th>
				<%if(idNumberCount>0){ %>
				<div style="font-family: tahoma;font-size:12px;font-weight: normal;color: Red"><%=idNumberErrorMsg %></div>
				<%} %>
				</th>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<input type="submit"  value="Register" style="height: 25px; width: 100px">
	</div>
</form>
</body>
</html>