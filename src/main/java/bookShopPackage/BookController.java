package bookShopPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookController {
	
	//connectDB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	//Insert Data Function
	public static boolean insertData(String name, String price, String category, String quantity, String description){
		
		boolean isSuccess = false;
		 try {
			 //DB connection call
			 con = DBConnection.getConnection();
			 stmt = con.createStatement();
			 
			 
			 //SQL Query
			 String sql = "INSERT INTO book values(0,'"+name+"', '"+price+"','"+category+"','"+quantity+"','"+description+"')";
			 int rs = stmt.executeUpdate(sql);
			 if(rs>0) {
				 isSuccess = true;
			 }
			 else {
				 isSuccess = false;
			 }
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 
		 return isSuccess;
		
	}
	
	//GetByID
	
	public static List<BookModel> getById(String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<BookModel> book = new ArrayList<>();
		
		try {
			//DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			
			String sql = "SELECT * FROM book WHERE id '"+convertedID+"' ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String price = rs.getString(3);
				String category = rs.getString(4);
				String quantity = rs.getString(5);
				String description = rs.getString(6);
				
				BookModel bk = new BookModel(id,name,price,category,quantity,description);
				book.add(bk);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return book;
	}
	
	//GetAllBook
	
	public static List<BookModel> getAllBook(){
		
		ArrayList<BookModel> book = new ArrayList<>();
		
		try {
			//DB Connection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			
			String sql = "SELECT * FROM book ";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String price = rs.getString(3);
				String category = rs.getString(4);
				String quantity = rs.getString(5);
				String description = rs.getString(6);
				
				BookModel bk = new BookModel(id,name,price,category,quantity,description);
				book.add(bk);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return book;
		
		 
	}

}
