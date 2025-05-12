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
            con = DBConnection.getConnection();
            String sql = "INSERT INTO user (name, email, password, phone, role) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, password); // TODO: Hash the password before storing!
            pstmt.setString(4, phone);
            pstmt.setString(5, role);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(); // Using a helper method for closing resources
        }
        return isSuccess;
    }

    @Override
    public UserModel authenticateUser(String email, String password) {
        UserModel user = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT id, name, email, password, role FROM user WHERE email = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               
                if (password.equals(rs.getString("password"))) { 
                    user = new UserModel();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                   
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return user;
    }

    @Override
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
            closeResources();
        }
        return users;
    }

    @Override
    public UserModel getUserById(int id) { 
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
        } finally {
            closeResources();
        }
        return user;
    }

    @Override
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
                closeResources(countRs, sta); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    @Override
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
            closeResources();
        }
        return count;
    }

    @Override
    public boolean updateUser(int id, String name, String email, String password, String phone, String role) {
        boolean isSuccess = false;
        try {
            con = DBConnection.getConnection();
            String sql;

            if (password != null && !password.isEmpty()) {
                sql = "UPDATE user SET name = ?, email = ?, password = ?, phone = ?, role = ? WHERE id = ?"; // TODO: Hash updated password
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
            closeResources();
        }
        return isSuccess;
    }

    private void closeResources() {
        closeResources(rs, pstmt, con, sta);
    }

    private void closeResources(ResultSet rs, Statement st) {
        closeResources(rs, null, null, st);
    }

    @SuppressWarnings("unused")
	private void closeResources(ResultSet rs, PreparedStatement ps, Connection c) {
        closeResources(rs, ps, c, null);
    }

    private void closeResources(ResultSet rs, PreparedStatement ps, Connection c, Statement st) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (c != null) c.close();
            if (st != null) st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}