package ReportPackage;

import java.util.List;

public interface IReportController {

	public boolean createReport(String rName , String rDate , String rContent);
	 public List<ReportModel> viewReports();
	 public ReportModel getReportById(int rId);
	 public boolean updateReport(int rId, String rName, String rDate, String rContent);
	 public boolean deleteReport(int rId);
}
