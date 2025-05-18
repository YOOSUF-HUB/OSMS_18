package ReportPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReportServices implements IReportController {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private boolean isSuccess;

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean createReport(String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent, int userId) {
        isSuccess = false;
        try {
            con = DataBaseReport.getConnection();
            String sql = "INSERT INTO financialreport (rName, rDate, rCategory, rAuthor, rStatus, rFilePath, rContentType, rContentSummary, rContent, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rName);
            pstmt.setString(2, rDate);
            pstmt.setString(3, rCategory);
            pstmt.setString(4, rAuthor);
            pstmt.setString(5, rStatus);
            pstmt.setString(6, rFilePath);
            pstmt.setString(7, rContentType);
            pstmt.setString(8, rContentSummary);
            pstmt.setString(9, rContent);
            pstmt.setInt(10, userId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    @Override
    public List<ReportModel> viewReports() {
        List<ReportModel> reports = new ArrayList<>();
        try {
            con = DataBaseReport.getConnection();
            String sql = "SELECT r.*, u.name AS author_name FROM financialreport r JOIN user u ON r.user_id = u.id";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReportModel report = new ReportModel();
                report.setrId(rs.getInt("rId"));
                report.setrName(rs.getString("rName"));
                report.setrDate(rs.getString("rDate")); 
                report.setrCategory(rs.getString("rCategory"));
                report.setrAuthor(rs.getString("author_name"));
                report.setrStatus(rs.getString("rStatus"));
                report.setrFilePath(rs.getString("rFilePath"));
                report.setrContentType(rs.getString("rContentType"));
                report.setrContentSummary(rs.getString("rContentSummary"));
                report.setrContent(rs.getString("rContent"));
                report.setUserId(rs.getInt("user_id"));
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return reports;
    }

   
    public ReportModel getReportById(int rId) {
        ReportModel report = null;
        try {
            con = DataBaseReport.getConnection();
            String sql = "SELECT r.*, u.name AS author_name FROM financialreport r JOIN user u ON r.user_id = u.id WHERE r.rId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                report = new ReportModel();
                report.setrId(rs.getInt("rId"));
                report.setrName(rs.getString("rName"));
                report.setrDate(rs.getString("rDate")); 
                report.setrCategory(rs.getString("rCategory"));
                report.setrAuthor(rs.getString("author_name"));
                report.setrStatus(rs.getString("rStatus"));
                report.setrFilePath(rs.getString("rFilePath"));
                report.setrContentType(rs.getString("rContentType"));
                report.setrContentSummary(rs.getString("rContentSummary"));
                report.setrContent(rs.getString("rContent"));
                report.setUserId(rs.getInt("user_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return report;
    }

    @Override
    public boolean updateReport(int rId, String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent, int userId) {
        isSuccess = false;
        try {
            con = DataBaseReport.getConnection();
            String sql = "UPDATE financialreport SET rName = ?, rDate = ?, rCategory = ?, rAuthor = ?, rStatus = ?, rFilePath = ?, rContentType = ?, rContentSummary = ?, rContent = ?, user_id = ? WHERE rId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rName);
            pstmt.setString(2, rDate); 
            pstmt.setString(3, rCategory);
            pstmt.setString(4, rAuthor);
            pstmt.setString(5, rStatus);
            pstmt.setString(6, rFilePath);
            pstmt.setString(7, rContentType);
            pstmt.setString(8, rContentSummary);
            pstmt.setString(9, rContent);
            pstmt.setInt(10, userId);
            pstmt.setInt(11, rId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    public boolean deleteReport(int rId) {
        boolean isSuccess = false;
        Statement sta = null;
        ResultSet countRs = null;
        try {
            con = DataBaseReport.getConnection();
            sta = con.createStatement();

            
            String countSql = "SELECT COUNT(*) FROM financialreport";
            countRs = sta.executeQuery(countSql);
            int initialCount = 0;
            if (countRs.next()) {
                initialCount = countRs.getInt(1);
            }

            String sql = "DELETE FROM financialreport WHERE rId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rId);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
            }

          
            if (initialCount == 1) {
                 String resetSql = "ALTER TABLE financialreport AUTO_INCREMENT = 1";
                 sta.executeUpdate(resetSql);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (countRs != null)
                    countRs.close();
                if (sta != null)
                    sta.close();
                if (pstmt != null)
                    pstmt.close();
                if (con != null)
                    con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

}
