package UserPackage;

import java.sql.*;


public class DBconnection {

    private static String url = "jdbc:mysql://localhost:3306/OnlineStockManagementSystem";
    private static String user = "root";
    private static String pass = "yoosuf123@";
    private static Connection con = null;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) { 
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pass);
            }
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database: " + e.getMessage());
            con = null; 
        }
        return con;
    }
}