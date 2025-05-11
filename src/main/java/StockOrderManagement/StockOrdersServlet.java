package StockOrderManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/StockOrdersServlet")
public class StockOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<StockOrderModel> orders = StockOrderControl.getAllStockOrders();
		request.setAttribute("orders", orders);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("StockOrderManagement/View_StockOrders.jsp");
		dispatcher.forward(request, response);
		
	}



}
