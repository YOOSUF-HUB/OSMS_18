package SupplierPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import onlineStockManagement.DBconnection;
import onlineStockManagement.stockModel;

public class SupplierControl {
	
	//connect DC
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert Data function
	public static boolean insertSupplierData(int supplier_id, String supplier_name, String phone_number, String email, String supplier_address, String supplier_city, String supplier_country, String supplier_website, String s_date_added) {
		
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
	
	
	
	
	//GetById
	public static List<SupplierModel> getById (int ID){
		
		int convertedID = ID;
		
		ArrayList <SupplierModel> supplier = new ArrayList<>();
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL query
			String sql = "SELECT * FROM supplier WHERE ID = '"+convertedID+"' ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int supplier_id = rs.getInt(1);
				String supplier_name = rs.getString(2);
				String phone_number = rs.getString(3);
				String email = rs.getString(4);
				String supplier_address = rs.getString(5);
				String supplier_city = rs.getString(6);
				String supplier_country = rs.getString(7);
				String supplier_website = rs.getString(8);
				String s_date_added = rs.getString(9);
				
				SupplierModel supply = new SupplierModel(supplier_id, supplier_name, phone_number, email, supplier_address, supplier_city, supplier_country, supplier_website, s_date_added);
				supplier.add(supply);
				
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return supplier;
	}
	
	
	//GetAllData
	public static List<SupplierModel> getAllSupplier(){
		
		ArrayList <SupplierModel> supplier = new ArrayList<>();
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL query
			String sql = "SELECT * FROM supplier";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int supplier_id = rs.getInt(1);
				String supplier_name = rs.getString(2);
				String phone_number = rs.getString(3);
				String email = rs.getString(4);
				String supplier_address = rs.getString(5);
				String supplier_city = rs.getString(6);
				String supplier_country = rs.getString(7);
				String supplier_website = rs.getString(8);
				String s_date_added = rs.getString(9);
				
				SupplierModel supply = new SupplierModel(supplier_id, supplier_name, phone_number, email, supplier_address, supplier_city, supplier_country, supplier_website, s_date_added);
				supplier.add(supply);
				
			}
			 
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return supplier;
		
		
	}
	
	
	
	//Update DATA Function
	public static boolean UpdateSupplier(int supplier_id, String supplier_name, String phone_number, String email, String supplier_address, String supplier_city, String supplier_country, String supplier_website, String s_date_added) {
		
		try {
			//DB connection
			con = DBconnection.getConnection();
			stmt = con.createStatement();
			 
			//SQL Query
			String sql = "UPDATE supplier SET supplier_name = '"+supplier_name+"', phone_number = '"+phone_number+"', email = '"+email+"', supplier_address = '"+supplier_address+"', supplier_city = '"+supplier_city+"' , supplier_country = '"+supplier_country+"' , supplier_website = '"+supplier_website+"'  , s_date_added = '"+s_date_added+"' " + "WHERE supplier_id = '"+supplier_id+"' ";
			
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
