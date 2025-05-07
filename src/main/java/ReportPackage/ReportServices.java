package ReportPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;




public class ReportServices implements IReportController{

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement sta = null;
	
	@Override
	public boolean createReport(String rName , String rDate , String rContent) {
		
		isSuccess = false;
		
		try {
			con = DataBaseReport.getConnection();
			sta = con.createStatement();
			
			String sql = "insert into financialreport (rName , rDate , rContent) values ('"+ rName +"', '"+ rDate +"', '"+ rContent +"')";    
			int rs = sta.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return isSuccess;
	}
	
	@Override
    public List<ReportModel> viewReports() {
        List<ReportModel> reportList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DataBaseReport.getConnection();
            String sql = "SELECT rId, rName, rDate FROM financialreport";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ReportModel report = new ReportModel(
                        rs.getInt("rId"),
                        rs.getString("rName"),
                        rs.getString("rDate"),
                        "" 
                );
                reportList.add(report);
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
        return reportList;
    }
	
	
    public ReportModel getReportById(int rId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReportModel report = null;

        try {
            con = DataBaseReport.getConnection();
            String sql = "SELECT rId, rName, rDate, rContent FROM FinancialReport WHERE rId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                report = new ReportModel(
                        rs.getInt("rId"),
                        rs.getString("rName"),
                        rs.getString("rDate"),
                        rs.getString("rContent")
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
        return report;
    }
    
    
   
    public boolean updateReport(int rId, String rName, String rDate, String rContent) {
        isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DataBaseReport.getConnection();
            String sql = "UPDATE financialreport SET rName = ?, rDate = ?, rContent = ? WHERE rId = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, rName);
            pstmt.setString(2, rDate);
            pstmt.setString(3, rContent);
            pstmt.setInt(4, rId);
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
    
	public boolean deleteReport(int rId) {

	    boolean isSuccess = false;

	    try {
	        con = DataBaseReport.getConnection();
	        sta = con.createStatement();

	        String sql = "delete from financialreport where rId = '" + rId + "'";
	        int rs = sta.executeUpdate(sql);

	        if (rs > 0) {
	            isSuccess = true;

	            // Check if all records are deleted and reset auto-increment
	            String countSql = "SELECT COUNT(*) FROM financialreport";
	            ResultSet countRs = sta.executeQuery(countSql);
	            countRs.next();
	            int count = countRs.getInt(1);

	            if (count == 0) {
	                String resetSql = "ALTER TABLE financialreport AUTO_INCREMENT = 1";
	                sta.executeUpdate(resetSql);
	            }

	        } else {
	            isSuccess = false;
	        }

	    } catch (Exception e) {
	        System.out.println(e.getMessage());
	    }
	    return isSuccess;
	}
}

    


