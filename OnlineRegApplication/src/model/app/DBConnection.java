package model.app;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.naming.NamingException;

public class DBConnection {
	
	public Connection getConnectionPool()
	{
		Connection conn = null;
		
		try{
			
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/ONLINE_REG_APP");
		conn = (Connection) ds.getConnection();
				
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		
		return conn;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub


	}

}
