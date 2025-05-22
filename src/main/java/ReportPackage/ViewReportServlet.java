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
// logic to view one report if the view button is clicked in the jsp page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String rIdParam = request.getParameter("rId");
        if (rIdParam != null && !rIdParam.isEmpty()) {
            try {
                int rId = Integer.parseInt(rIdParam);
                IReportController reportController = new ReportServices();
                ReportModel report = reportController.getReportById(rId);

                if (report != null) {
                    request.setAttribute("report", report);
                    request.getRequestDispatcher("ReportManagement/reportDetails.jsp").forward(request, response);
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
}