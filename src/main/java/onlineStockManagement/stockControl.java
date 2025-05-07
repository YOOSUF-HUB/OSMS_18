package onlineStockManagement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class stockControl {
	//connect DC
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert Data function
	public static boolean insertData(String item_id, String item_model, String item_manufacturer ,int quantity, float unit_cost, float selling_price, String date_added, String description) {
		
		 boolean isSuccess = false;
		 try {
			 //DB connection call
			 con = DBconnection.getConnection();
			 stmt = con.createStatement();
			 
			 //SQL Query
			 String sql = "INSERT INTO Stock_Items VALUES(0,'"+item_id+"','"+item_model+"', '"+item_manufacturer+"' ,'"+quantity+"', '"+unit_cost+"', '"+selling_price+"', '"+date_added+"', '"+description+"')";
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
	
	//GetById
	public static List<stockModel> getById (int ID){
		
		int convertedID = ID;
		
		ArrayList <stockModel> stock = new ArrayList<>();
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL query
			String sql = "SELECT * FROM Stock_Items WHERE ID = '"+convertedID+"' ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int item_id = rs.getInt(1);
				String item_name = rs.getString(2);
				String item_model = rs.getString(3);
				String item_manufacturer = rs.getString(4);
				int quantity = rs.getInt(5);
				float unit_cost = rs.getFloat(6);
				float selling_price = rs.getFloat(7);
				String date_added = rs.getString(8);
				String description = rs.getString(9);
				
				stockModel stck = new stockModel(item_id, item_name, item_model, item_manufacturer,quantity,unit_cost, selling_price,date_added, description );
				stock.add(stck);
				
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return stock;
	}
	
	
	//GetAllData
	public static List<stockModel> getAllStock(){
		
		ArrayList <stockModel> stock = new ArrayList<>();
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL query
			String sql = "SELECT * FROM Stock_Items";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int item_id = rs.getInt(1);
				String item_name = rs.getString(2);
				String item_model = rs.getString(3);
				String item_manufacturer = rs.getString(4);
				int quantity = rs.getInt(5);
				float unit_cost = rs.getFloat(6);
				float selling_price = rs.getFloat(7);
				String date_added = rs.getString(8);
				String description = rs.getString(9);
				
				stockModel stck = new stockModel(item_id, item_name, item_model, item_manufacturer, quantity, unit_cost, selling_price, date_added, description);
				stock.add(stck);
				
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return stock;
		
		
	}
	
	
	
	//Update DATA Function
	public static boolean UpdateStock(int item_id, String item_name, String item_model, String item_manufacturer,int quantity, float unit_cost, float selling_price, String date_added, String description ) {
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			 
			//SQL Query
			String sql = "UPDATE Stock_Items SET item_name = '"+item_name+"', item_model = '"+item_model+"', item_manufacturer = '"+item_manufacturer+"', quantity = '"+quantity+"', unit_cost = '"+unit_cost+"' , selling_price = '"+selling_price+"' , date_added = '"+date_added+"'  , description = '"+description+"' " + "WHERE item_id = '"+item_id+"' ";
			
			int rs = stmt.executeUpdate(sql);
			
			 if(rs>0) {
				 isSuccess = true;
				 
			 }else { 
				 isSuccess = false;
			 }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
}
