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
		int item_id = Integer.parseInt(request.getParameter("item_id")); //fetch item_id which is to be deleted
		boolean isTrue;
		IStockControl obj = new stockControl(); //creating obj object
		isTrue = obj.DeleteStock(item_id); //call the delete method and execute the delete
		if(isTrue == true) {
			
			request.getSession().setAttribute("deleteMessage","Stock Deleted successfully"); //sending session for delete notification

			response.getWriter().println("<script>window.location.href='GetAllStockServlet'</script>");
		}
		else {
			
			List<stockModel> stockDetails = obj.getById(item_id);
			request.setAttribute("stockDetails", stockDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/StockManagement/WrongStock.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
