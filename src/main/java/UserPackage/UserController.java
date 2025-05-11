package UserPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;





public class UserController implements IUser {

	    private Connection con;
	    private PreparedStatement pstmt;
	    private ResultSet rs;
	    private Statement sta;
	    
    @Override
    public boolean registerUser(String name, String email, String password, String phone, String role) {
        boolean isSuccess = false;
        try {
            // DB connection
            con = DBConnection.getConnection();
           
            String sql = "INSERT INTO user (name, email, password, phone, role) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, role);

            
            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }
        return isSuccess;
    }
    
    
    public List<UserModel> getAllUsers() {
    	
        List<UserModel> users = new ArrayList<>();
        
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT id, name, email, phone, role FROM user";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	UserModel user = new UserModel();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }
    
    
    public UserModel getReportById(int id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserModel user = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT id, name, email, password, phone, role FROM user WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	user = new UserModel(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("role")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }
    
    
    public boolean deleteUser(int id) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            
            String sql = "DELETE FROM user WHERE id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;

               
                sta = con.createStatement();
                String countSql = "SELECT COUNT(*) FROM user";
                ResultSet countRs = sta.executeQuery(countSql);
                if (countRs.next()) {
                    int count = countRs.getInt(1);
                    if (count == 0) {
                        String resetSql = "ALTER TABLE user AUTO_INCREMENT = 1";
                        sta.executeUpdate(resetSql);
                    }
                }
                if (countRs != null) countRs.close();
                if (sta != null) sta.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    
    
    public int getTotalUserCount() {
        int count = 0;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM user";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }
    
    public boolean updateUser(int id, String name, String email, String password, String phone, String role) {
        boolean isSuccess = false;
        try {
            con = DBConnection.getConnection();
            String sql;

           
            if (password != null && !password.isEmpty()) {
                sql = "UPDATE user SET name = ?, email = ?, password = ?, phone = ?, role = ? WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, password);
                pstmt.setString(4, phone);
                pstmt.setString(5, role);
                pstmt.setInt(6, id);
            } else {
                sql = "UPDATE user SET name = ?, email = ?, phone = ?, role = ? WHERE id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, phone);
                pstmt.setString(4, role);
                pstmt.setInt(5, id);
            }

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                isSuccess = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    
}

