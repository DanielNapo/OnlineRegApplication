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
<title>Registered Record</title>
</head>
<body>
<%

String fullName = (String)request.getAttribute("fullName");
String idNumber = (String)request.getAttribute("idNumber");

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
		<p>You have successfully registered the below applicant</p>
	</div>
	<br>
	<br>
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #000000">
		<table align="center" style="text-align: left;" border="1px">
			<tr>
				<th>Full Name</th>
				<th>ID Number</th>
			</tr>	
			<tr>
				<td><%=fullName %></td>
				<td><%=idNumber %></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
	</div>

</body>
</html>