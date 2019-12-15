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
<title>Search Applicant</title>
</head>
<body>
<%

String idNumberNotFoundErrorMsg = (String)request.getAttribute("idNumberNotFoundErrorMsg");
String idNumber = (String)request.getAttribute("idNumber");
short idNumberNotFoundCount = (Short)request.getAttribute("idNumberNotFoundCount");

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
		<p>Please use applicant ID number to search</p>
	</div>
	<br>
<form autocomplete="off" action="OnlineRegApplication?view=search" method="post">
<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #000080">
	<table align="center" style="text-align: left;">
			<tr>
				<th>ID Number</th>
				<th><input style="background-color:navy;color:white" type="text" width=820px name="idnumber"></th>
				<th>
				<%if(idNumberNotFoundCount>0){ %>
				<div style="font-family: tahoma;font-size:12px;font-weight: normal;color: Red"><%=idNumberNotFoundErrorMsg %></div>
				<%}else{ %>
				<div style="font-family: tahoma;font-size:12px;font-weight: normal;color: Red"><%=idNumberNotFoundErrorMsg %></div>
				<%} %>
				</th>
			</tr>
			
	</table>
	<br>
		<br>
		<br>
		<input type="submit"  value="Search" style="height: 25px; width: 100px">
</div>
</form>	

</body>
</html>