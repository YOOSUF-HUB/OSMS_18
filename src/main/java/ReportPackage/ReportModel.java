package ReportPackage;

public class ReportModel {

	private int rId;
	private String rName;
	private String rDate;
	private String rContent;
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	
	public ReportModel(int rId, String rName, String rDate, String rContent) {
		
		this.rId = rId;
		this.rName = rName;
		this.rDate = rDate;
		this.rContent = rContent;
	}
	
	public String toString() {
		return "ReportModel [rId=" + rId + ", rName=" + rName + ", rDate=" + rDate + ", rContent=" + rContent + "]";
	}
}
