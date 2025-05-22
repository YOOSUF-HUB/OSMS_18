package ReportPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateReportServlet")
public class UpdateReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // Retrieve the report ID from the request parameter
    	String rIdParam = request.getParameter("rId");
    	// Validate if the report ID parameter is provided and not empty
        if (rIdParam != null && !rIdParam.isEmpty()) {
            try {
                int rId = Integer.parseInt(rIdParam);
                IReportController reportController = new ReportServices();
                ReportModel report = reportController.getReportById(rId);

                if (report != null) {
                    request.setAttribute("report", report);
                    request.getRequestDispatcher("ReportManagement/updateReport.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp?message=Report not found with ID: " + rId);
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("error.jsp?message=Invalid Report ID format");
            }
        } else {
            response.sendRedirect("error.jsp?message=Report ID not provided");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Retrieve updated report details from request parameters
    	int rId = Integer.parseInt(request.getParameter("rId"));
        String rName = request.getParameter("rName");
        String rDate = request.getParameter("rDate"); 
        String rCategory = request.getParameter("rCategory");
        String rStatus = request.getParameter("rStatus");
        String rContentSummary = request.getParameter("rContentSummary");
        String rContent = request.getParameter("rContent");
        // Get session to retrieve logged-in user information
        HttpSession session = request.getSession();
        String rAuthor = (String) session.getAttribute("loggedInUsername");
        Integer loggedInUserId = (Integer) session.getAttribute("loggedInUserId");
        int userId = (loggedInUserId != null) ? loggedInUserId : -1;

        IReportController reportController = new ReportServices();
        ReportModel existingReport = reportController.getReportById(rId);
        String rFilePath = existingReport.getrFilePath(); 
        String rContentType = existingReport.getrContentType(); 

        boolean isUpdated = reportController.updateReport(rId, rName, rDate, rCategory, rAuthor, rStatus, rFilePath, rContentType, rContentSummary, rContent, userId);
        // Check if the update operation was successful
        if (isUpdated) {
            String alertmsg = "Report Updated Successfully";
            response.getWriter().println("<script> alert('" + alertmsg + "'); window.location.href = 'ViewReportsServlet' </script>");
        } else {
            response.sendRedirect("error.jsp?message=Failed to update report");
        }
    }
}
