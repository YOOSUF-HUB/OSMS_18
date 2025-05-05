package onlineStockManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class stockControl {
	//connect DC
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert Data function
	public static boolean insertData(String item_name, String item_model, String item_manufacturer ,int supplier_id, int quantity, int unit_cost, int selling_price, String date_added, String comments) {
		
		 boolean isSuccess = false;
		 try {
			 //db connection call
			 con = DBconnection.getConnection();
			 stmt = con.createStatement();
			 
			 //SQL Query
			 String sql = "INSERT INTO Stock_Items VALUES(0,'"+item_name+"','"+item_model+"', '"+item_manufacturer+"' , '"+supplier_id+"', '"+quantity+"', '"+unit_cost+"', '"+selling_price+"', '"+date_added+"', '"+comments+"')";
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
