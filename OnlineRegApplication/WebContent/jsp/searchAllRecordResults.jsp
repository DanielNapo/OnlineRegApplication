<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page  import = "java.util.List"%>  
<%@page  import = "java.util.ArrayList"%> 
<%@page import = "process.app.Applicant_Details" %> 
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
<title>Full Report For Registered Applicants</title>
</head>
<body>
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
		<p>Applicants Full Report</p>
	</div>
	<div style="text-align: center;font-family: sans-serif;font-weight: bold;color: #000080">
		<table align="center" style="text-align: left;" border="1px">
			<tr>
			<th>Record ID</th>
			<th>Full Name</th>
			<th>ID Number</th>
			</tr>
<%ArrayList<Applicant_Details> applicants = (ArrayList<Applicant_Details>)request.getAttribute("fullReport");
	for(int i=0;i<applicants.size();i++)
	{	Applicant_Details individual=(Applicant_Details)applicants.get(i);%>
	
			<tr>
			<td><%=individual.getRecordId() %></td>	
			<td><%=individual.getFullName() %></td>
			<td><%=individual.getIDNumber() %></td>
			</tr>
<%} %>
	</table>
</div>	
</body>
</html>
