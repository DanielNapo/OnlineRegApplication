package process.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import link.app.Linkable;
import model.app.DBConnection;

/**
 * Servlet implementation class OnlineRegApplication
 */
@WebServlet("/OnlineRegApplication")
public class OnlineRegApplication extends HttpServlet implements Linkable{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnlineRegApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String viewPage = request.getParameter(VIEW);
		
		if(viewPage != ""){
			if(viewPage.equals(REGISTER_APPLICANT)){
				RequestDispatcher rd = null;
				rd = request.getRequestDispatcher(JSP_PATH+INITIALIZE_PAGE);
				rd.forward(request, response);
			}else{
				
				if(viewPage.equals(HOME)){
					
					RequestDispatcher rd = null;
					rd = request.getRequestDispatcher(JSP_PATH+HOME_PAGE);
					rd.forward(request, response);
				}else{
					
					if(viewPage.equals(SEARCH_APPLICANT)){
						
						RequestDispatcher rd = null;
						rd = request.getRequestDispatcher(JSP_PATH+SEARCHINITIALIZE_PAGE);
						rd.forward(request, response);
						
					}
					
				}
				
			}
			
		}else{
			RequestDispatcher rd = null;
			rd = request.getRequestDispatcher(JSP_PATH+UNAVAILABLE_PAGE);
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		short fullNameCount = 0;
		short idNumberCount = 0;
		short duplicateRecord = 0;
		short idNumberNotFoundCount = 0;
		String fullNameErrorMsg = "";
		String idNumberErrorMsg = "";
		String searchFullName = "";
		String searchIDNumber = "";
		String idNumberNotFoundErrorMsg = "";
		String duplicateRecordErrorMsg = "";
		
		String viewPage = request.getParameter(VIEW);
		String fullName = request.getParameter("fullName");
		String idNumber = request.getParameter("idnumber");
		
		System.out.println(idNumber);
		
		DBConnection myConnect = new DBConnection();
		
		Validation fieldsChecked = new Validation();
			
		Connection conn = null;
		
		String insertsql = "";
				
		if(viewPage != ""){
			try {
				if(viewPage.equals(REGISTER)){
					
					String checkFullName = fieldsChecked.validateFullName(fullName);
					String checkIdNumber = fieldsChecked.validateIDNumber(idNumber);
					
					System.out.println(checkFullName);
					System.out.println(checkIdNumber);
					
					if(checkFullName.equals(VALID) && checkIdNumber.equals(VALID)){
						
						conn = myConnect.getConnectionPool();
						
						PreparedStatement Stat = conn.prepareStatement("SELECT * FROM PersonalInfo WHERE ID_NUMBER = ?");
						
						Stat.setString(1, idNumber);
						
						/**Executing the query**/
						ResultSet rs = Stat.executeQuery();
						
						/**iterates over the result set...**/
						
						
						while (rs.next()) {
			                
			                 duplicateRecord++;
						}
						
						
						if(duplicateRecord > 0){
							
							duplicateRecordErrorMsg = "This record already exist, please use a different ID number!";
							
							RequestDispatcher rd = null;
							request.setAttribute("fullNameCount", fullNameCount);
							request.setAttribute("idNumberCount", idNumberCount);
							request.setAttribute("duplicateRecord", duplicateRecord);
							request.setAttribute("fullName", fullName);
							request.setAttribute("idNumber", idNumber);
							request.setAttribute("fullNameErrorMsg", fullNameErrorMsg);
							request.setAttribute("idNumberErrorMsg", idNumberErrorMsg);
							request.setAttribute("duplicateRecordErrorMsg", duplicateRecordErrorMsg);
												
							rd = request.getRequestDispatcher(JSP_PATH+MAIN_PAGE);
							rd.forward(request, response);
						}else{
							
							insertsql ="INSERT INTO PersonalInfo(FULL_NAME, ID_NUMBER)"
									+" VALUES('"+fullName+"', '"+idNumber+"')";
							
							PreparedStatement saveRecord;
							
							saveRecord = conn.prepareStatement(insertsql);
							
							saveRecord.executeUpdate();
						
							saveRecord.close();
							
							RequestDispatcher rd = null;
							request.setAttribute("fullName", fullName);
							request.setAttribute("idNumber", idNumber);
							rd = request.getRequestDispatcher(JSP_PATH+SUCC_PAGE);
							rd.forward(request, response);
							
						}
						
					}else{
						
						if(!checkFullName.equals(VALID)){
							fullNameCount++;
						}
						if(!checkIdNumber.equals(VALID)){
							idNumberCount++;
						}
						
						fullNameErrorMsg = fieldsChecked.validateFullName(fullName);
						idNumberErrorMsg = fieldsChecked.validateIDNumber(idNumber);
						
						RequestDispatcher rd = null;
						request.setAttribute("fullNameCount", fullNameCount);
						request.setAttribute("idNumberCount", idNumberCount);
						request.setAttribute("duplicateRecord", duplicateRecord);
						request.setAttribute("fullName", fullName);
						request.setAttribute("idNumber", idNumber);
						request.setAttribute("fullNameErrorMsg", fullNameErrorMsg);
						request.setAttribute("idNumberErrorMsg", idNumberErrorMsg);
						request.setAttribute("duplicateRecordErrorMsg", duplicateRecordErrorMsg);
						rd = request.getRequestDispatcher(JSP_PATH+MAIN_PAGE);
						rd.forward(request, response);
						
					}
								
				}else{
					
					if(viewPage.equals(SEARCH)){
						
						if(idNumber.equals("")){
							
							idNumberNotFoundErrorMsg = "Please enter the ID number!";
							
							RequestDispatcher rd = null;
							request.setAttribute("idNumberNotFoundCount", idNumberNotFoundCount);
							request.setAttribute("idNumber", idNumber);
							request.setAttribute("idNumberNotFoundErrorMsg", idNumberNotFoundErrorMsg);
												
							rd = request.getRequestDispatcher(JSP_PATH+SEARCHAPPLICANT_PAGE);
							rd.forward(request, response);
							
						}else{
							
							conn = myConnect.getConnectionPool();
							
							PreparedStatement Stat = conn.prepareStatement("SELECT * FROM PersonalInfo WHERE ID_NUMBER = ?");
							
							Stat.setString(1, idNumber);
							
							/**Executing the query**/
							ResultSet rs = Stat.executeQuery();
							
							/**iterates over the result set...**/
							
							
							while (rs.next()) {
								
								searchFullName = rs.getString("FULL_NAME");
								searchIDNumber = rs.getString("ID_NUMBER");
				                
								idNumberNotFoundCount++;
							}
							
							
							if(idNumberNotFoundCount == 0){
								
								idNumberNotFoundErrorMsg = "Record not found";
								
								RequestDispatcher rd = null;
								request.setAttribute("idNumberNotFoundCount", idNumberNotFoundCount);
								request.setAttribute("idNumber", idNumber);
								request.setAttribute("idNumberNotFoundErrorMsg", idNumberNotFoundErrorMsg);
													
								rd = request.getRequestDispatcher(JSP_PATH+SEARCHAPPLICANT_PAGE);
								rd.forward(request, response);
							}else{
								
								RequestDispatcher rd = null;
								request.setAttribute("fullName", searchFullName);
								request.setAttribute("idNumber", searchIDNumber);
								rd = request.getRequestDispatcher(JSP_PATH+SEARCHRESULTS_PAGE);
								rd.forward(request, response);
								
							}
							
						}
									
					}
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.getStackTrace();
			}
			
		}else{
			
			RequestDispatcher rd = null;
			rd = request.getRequestDispatcher(JSP_PATH+UNAVAILABLE_PAGE);
			rd.forward(request, response);
			
		}
	}

}
