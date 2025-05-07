package onlineStockManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteStockServlet")
public class DeleteStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int item_id = Integer.parseInt(request.getParameter("item_id"));
		boolean isTrue;
		isTrue = stockControl.DeleteStock(item_id);
		if(isTrue == true) {
			String alertMessage = "Data Deleted Successfully";
			response.getWriter().println("<script>('"+alertMessage+"');" + " window.location.href='GetAllStockServlet'</script>");
		}
		else {
			
			List<stockModel> stockDetails = stockControl.getById(item_id);
			request.setAttribute("stockDetails", stockDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
