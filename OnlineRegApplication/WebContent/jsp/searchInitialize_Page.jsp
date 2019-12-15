<% 

/**Initializing Error message variables**/
String idNumberNotFoundErrorMsg = "";

/**Initializing Oracle deployment page**/
String jsp_path = "/jsp/";
String targetPage = "searchApplicant.jsp";

/**Initializing variables to be used as flags**/
short idNumberNotFoundCount = 0;
String idNumber = "";

/**Passing values to the Oracle page**/
RequestDispatcher rd = null;
request.setAttribute("idNumberNotFoundCount", idNumberNotFoundCount);
request.setAttribute("idNumber", idNumber);
request.setAttribute("idNumberNotFoundErrorMsg", idNumberNotFoundErrorMsg);
rd = request.getRequestDispatcher(jsp_path+targetPage);
rd.forward(request, response);


%>