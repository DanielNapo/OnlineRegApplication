package process.app;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Applicant_Details {
		
	String recordID;
	String fullName;
	String idNumber;
	
	public void setRecordId(String recordId){
		
		this.recordID = recordId;
	}
	
	public void setFullName(String fName){
		
		this.fullName = fName;
	}
	
	public void setIDNumber(String idNum){
		
		this.idNumber = idNum;
	}
	
	public String getRecordId(){
		return recordID;
	}
	
	public String getFullName(){
		return fullName;
	}
	
	public String getIDNumber(){
		return idNumber;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		

	}

}
