package ReportPackage;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateReportServlet")
public class CreateReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String rName = request.getParameter("rName");
        String rDateStr = request.getParameter("rDate");
        String rContent = request.getParameter("rContent");

        IReportController obj = new ReportServices();
        
        boolean isTrue;
		   
		   isTrue = obj.createReport(rName , rDateStr , rContent);
		   
		   if(isTrue == true) {
			   String alertmsg = "Data Inserted Successfully";
			   response.getWriter().println("<script> alert('"+alertmsg+"'); window.location.href = 'ViewReportsServlet' </script>");
		   }else {
			   RequestDispatcher dis1 = request.getRequestDispatcher("wrong.jsp");
			   dis1.forward(request, response);
		   }
    }
}