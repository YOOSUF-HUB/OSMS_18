package ReportPackage;



public class ReportModel {
    private int rId;
    private String rName;
    private String rDate;
    private String rCategory;
    private String rAuthor;
    private String rStatus;
    private String rFilePath;
    private String rContentType;
    private String rContentSummary;
    private String rContent;
    private int userId; 

   

    public ReportModel() {
    }

    public ReportModel(int rId, String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent, int userId) {
        this.rId = rId;
        this.rName = rName;
        this.rDate = rDate;
        this.rCategory = rCategory;
        this.rAuthor = rAuthor;
        this.rStatus = rStatus;
        this.rFilePath = rFilePath;
        this.rContentType = rContentType;
        this.rContentSummary = rContentSummary;
        this.rContent = rContent;
        this.userId = userId;
    }

    public ReportModel(int rId, String rName, String rDate, String rCategory, String rAuthor, String rStatus, String rFilePath, String rContentType, String rContentSummary, String rContent) {
        this.rId = rId;
        this.rName = rName;
        this.rDate = rDate;
        this.rCategory = rCategory;
        this.rAuthor = rAuthor;
        this.rStatus = rStatus;
        this.rFilePath = rFilePath;
        this.rContentType = rContentType;
        this.rContentSummary = rContentSummary;
        this.rContent = rContent;
    }

   
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

   
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

    public String getrCategory() {
        return rCategory;
    }

    public void setrCategory(String rCategory) {
        this.rCategory = rCategory;
    }

    public String getrAuthor() {
        return rAuthor;
    }

    public void setrAuthor(String rAuthor) {
        this.rAuthor = rAuthor;
    }

    public String getrStatus() {
        return rStatus;
    }

    public void setrStatus(String rStatus) {
        this.rStatus = rStatus;
    }

    public String getrFilePath() {
        return rFilePath;
    }

    public void setrFilePath(String rFilePath) {
        this.rFilePath = rFilePath;
    }

    public String getrContentType() {
        return rContentType;
    }

    public void setrContentType(String rContentType) {
        this.rContentType = rContentType;
    }

    public String getrContentSummary() {
        return rContentSummary;
    }

    public void setrContentSummary(String rContentSummary) {
        this.rContentSummary = rContentSummary;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent;
    }
}