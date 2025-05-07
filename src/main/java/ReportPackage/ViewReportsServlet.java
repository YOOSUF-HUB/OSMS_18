package ReportPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewReportsServlet")
public class ViewReportsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IReportController reportController = new ReportServices(); 
        List<ReportModel> reportList = reportController.viewReports(); 

        if (reportList != null) { 
            request.setAttribute("reportList", reportList);
            request.getRequestDispatcher("ReportManagement/ViewReports.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp?message=Failed to retrieve reports"); //send error to jsp
        }
    }
}

