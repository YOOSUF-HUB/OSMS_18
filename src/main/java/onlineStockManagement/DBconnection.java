//package onlineStockManagement;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class DBconnection {
//
//	
//	private static String url="jdbc:mysql://localhost:3306/OnlineStockManagementSystem";
//	private static String user="root";
//	private static String pass="pass";
//	private static Connection con;
//	
//	public static Connection getConnection () {
//		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection(url, user, pass);
//			
//		}catch(Exception e) {
//			System.out.println("Database not connected");
//		}
//		return con;
//	}
//	
//}
//	
	
package onlineStockManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
    private static DBconnection instance;
    private Connection connection;

    private String url = "jdbc:mysql://localhost:3306/OnlineStockManagementSystem";
    private String username = "root";
    private String password = "pass";

    private DBconnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            throw new SQLException("Database Driver not found", ex);
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public static DBconnection getInstance() throws SQLException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new DBconnection();
        }
        return instance;
    }
}


