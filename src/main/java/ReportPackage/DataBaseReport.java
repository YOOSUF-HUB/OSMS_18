package ReportPackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseReport {

	private static String url="jdbc:mysql://localhost:3306/onlineStockManagement";
	private static String user="root";
	private static String pass="yoosuf123@";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass);
			
		}catch(Exception e) {
			System.out.println("Database not connected");
		}
		
		return con;
	}
	
}
