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



//package onlineStockManagement;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class DBconnection {
//
//    private static DBconnection instance;
//    private static Connection con;
//    
//    private static final String url = "jdbc:mysql://localhost:3306/OnlineStockManagementSystem";
//    private static final String user = "root";
//    private static final String pass = "pass";
//
//    // Private constructor prevents instantiation from other classes
//    private DBconnection() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection(url, user, pass);
//        } catch (Exception e) {
//            System.out.println("Database not connected: " + e.getMessage());
//        }
//    }
//
//    // Public method to provide access to the instance
//    public static DBconnection getInstance() {
//        if (instance == null) {
//            instance = new DBconnection();
//        }
//        return instance;
//    }
//
//    public Connection getConnection() {
//        return con;
//    }
//}
//package onlineStockManagement;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class DBconnection {
//
//    private static String url = "jdbc:mysql://localhost:3306/OnlineStockManagementSystem";
//    private static String user = "root";
//    private static String pass = "pass";
//    private static Connection con;
//
//    public static Connection getConnection() {
//        try {
//            if (con == null || con.isClosed()) {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                con = DriverManager.getConnection(url, user, pass);
//            }
//        } catch (Exception e) {
//            System.out.println("Database not connected");
//            e.printStackTrace();
//        }
//        return con;
//    }
//}

