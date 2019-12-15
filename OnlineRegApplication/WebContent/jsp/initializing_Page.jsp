<%
	/**Initializing Error message variables**/
	String fullNameErrorMsg = "";
	String idNumberErrorMsg = "";
	String duplicateRecordErrorMsg = "";
	
	/**Initializing Oracle deployment page**/
	String jsp_path = "/jsp/";
	String targetPage = "main.jsp";
	
	/**Initializing variables to be used as flags**/
	short fullNameCount = 0;
	short idNumberCount = 0;
	short duplicateRecord = 0;
	String fullName = "";
	String idNumber = "";
	
	/**Passing values to the Oracle page**/
	RequestDispatcher rd = null;
	request.setAttribute("fullNameCount", fullNameCount);
	request.setAttribute("idNumberCount", idNumberCount);
	request.setAttribute("duplicateRecord", duplicateRecord);
	request.setAttribute("fullName", fullName);
	request.setAttribute("idNumber", idNumber);
	request.setAttribute("idNumberErrorMsg", idNumberErrorMsg);	
	request.setAttribute("fullNameErrorMsg", fullNameErrorMsg);
	request.setAttribute("duplicateRecordErrorMsg", duplicateRecordErrorMsg);
	rd = request.getRequestDispatcher(jsp_path+targetPage);
	rd.forward(request, response);

%>