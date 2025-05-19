package StockOrderManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteStockOrderServlet")
public class DeleteStockOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		boolean isTrue;
		
		IStockOrderControl obj = new StockOrderControl();
		isTrue = obj.DeleteStockOrder(order_id);
		if(isTrue == true) {
			String alertMessage = "Data Deleted Successfully";
			response.getWriter().println("<script>('"+alertMessage+"');" + " window.location.href='StockOrdersServlet'</script>");
			
		}else {
			List<StockOrderModel> StockOrderDetails = obj.getOrderById(order_id);
			request.setAttribute("StockOrderDetails", StockOrderDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
			dispatcher.forward(request, response);
		}


	}

}
