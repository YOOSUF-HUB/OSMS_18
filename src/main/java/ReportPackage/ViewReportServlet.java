package ReportPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewReportServlet")
public class ViewReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	int rId = Integer.parseInt(request.getParameter("rId"));
        IReportController reportController = new ReportServices();
        ReportModel report = reportController.getReportById(rId);

        if (report != null) {
            request.setAttribute("report", report);
            request.getRequestDispatcher("ReportManagement/reportDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp?message=Report not found");
        }
    }
}
