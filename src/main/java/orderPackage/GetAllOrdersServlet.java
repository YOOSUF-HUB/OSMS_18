package orderPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetAllOrdersServlet")
public class GetAllOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IOrderController OrderController = new OrderController();
		
		List<OrderModel> allOrders = OrderController.getAllOrders();
		request.setAttribute("allOrders", allOrders);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/OrderManagement/viewOrder.jsp");
		dispatcher.forward(request, response);
	
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
