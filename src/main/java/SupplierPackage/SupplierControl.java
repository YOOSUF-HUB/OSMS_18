package SupplierPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import onlineStockManagement.DBconnection;

public class SupplierControl {
	
	//connect DC
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert Data function
	public static boolean insertSupplierData(String supplier_name, String phone_number, String email, String supplier_address, String supplier_city, String supplier_country, String supplier_website, String s_date_added) {
		
		 boolean isSuccess = false;
		 try {
			 //DB connection call
			 con = DBconnection.getConnection();
			 stmt = con.createStatement();
			 
			 //SQL Query
			 String sql = "INSERT INTO supplier VALUES(0,'"+supplier_name+"', '"+phone_number+"' ,'"+email+"', '"+supplier_address+"', '"+supplier_city+"', '"+supplier_country+"', '"+supplier_website+"', '"+s_date_added+"')";
			 int rs = stmt.executeUpdate(sql);
			 if(rs>0) {
				 isSuccess = true;
				 
			 }else {
				 isSuccess = false;
			 }
		 }catch(Exception e ){
			 e.printStackTrace();
		 }
		 return isSuccess;
		
	}

}
