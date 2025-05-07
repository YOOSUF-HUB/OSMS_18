package ReportPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteReportServlet")
public class DeleteReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rId = Integer.parseInt(request.getParameter("rId"));
        IReportController reportController = new ReportServices();
        boolean isDeleted = reportController.deleteReport(rId);

        if (isDeleted) {
            response.sendRedirect("ViewReportsServlet");
        } else {
            response.sendRedirect("error.jsp?message=Failed to delete report");
        }
	}

}
