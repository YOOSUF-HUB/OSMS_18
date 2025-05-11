package UserPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserControl {

    private static boolean isSuccess;

    // Insert User Data
    public static boolean insertUserData(String user_name, String user_email, String user_password, String user_phone, String user_address) {
        isSuccess = false;
        Connection con = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            con = DBconnection.getConnection();

            // Step 1: Check if email exists
            String checkSql = "SELECT user_email FROM Users WHERE user_email = ?";
            checkStmt = con.prepareStatement(checkSql);
            checkStmt.setString(1, user_email);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Email already exists
                isSuccess = false;
            } else {
                // Step 2: Insert if not exists
                String insertSql = "INSERT INTO Users VALUES (0, ?, ?, ?, ?, ?)";
                insertStmt = con.prepareStatement(insertSql);
                insertStmt.setString(1, user_name);
                insertStmt.setString(2, user_email);
                insertStmt.setString(3, user_password);
                insertStmt.setString(4, user_phone);
                insertStmt.setString(5, user_address);

                isSuccess = insertStmt.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }


    // Login Validation
    public static List<UserModel> LoginValidate(String user_email, String user_password) {
        ArrayList<UserModel> user = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBconnection.getConnection();
            String sql = "SELECT * FROM Users WHERE user_email = ? AND user_password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_email);
            pstmt.setString(2, user_password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                int user_id = rs.getInt(1);
                String user_name = rs.getString(2);
                String email = rs.getString(3);
                String password = rs.getString(4);
                String user_phone = rs.getString(5);
                String user_address = rs.getString(6);

                UserModel u = new UserModel(user_id, user_name, email, password, user_phone, user_address);
                user.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return user;
    }
}
