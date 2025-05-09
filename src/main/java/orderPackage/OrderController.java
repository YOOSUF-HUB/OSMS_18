package orderPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import onlineStockManagement.DBconnection;

public class OrderController {
	
	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
		
		
		
	//insert data function
	public static boolean insertdata (int item_id, int quantity, int id) {
		
		isSuccess = false;
		
		try {
			//do connection call
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL 
			String sql = "INSERT INTO Orders VALUES(0,'"+item_id+"','"+quantity+"','"+id+"')";
			
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
					isSuccess = true;
			}
			else {
				isSuccess = false;
			}
				
		}
		catch(Exception e){
			e.printStackTrace();
				
		}
		
		
		return isSuccess;
		
	}

}
