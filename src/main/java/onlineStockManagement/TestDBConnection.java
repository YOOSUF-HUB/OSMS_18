package onlineStockManagement;

import java.sql.Connection;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            Connection con = DBconnection.getInstance().getConnection();
            if (con != null && !con.isClosed()) {
                System.out.println("DB Connection SUCCESS");
            } else {
                System.out.println("DB Connection FAILED");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
