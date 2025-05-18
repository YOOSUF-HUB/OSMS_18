package ReportPackage;


import java.util.List;
import onlineStockManagement.DBconnection;

public interface IReportController {
    boolean createReport(String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent, int userId);
    List<ReportModel> viewReports();
    ReportModel getReportById(int rId);
    boolean updateReport(int rId, String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent, int userId);
    boolean deleteReport(int rId);
}