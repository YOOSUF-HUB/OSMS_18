package orderPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineStockManagement.IStockControl;
import onlineStockManagement.stockControl;
import onlineStockManagement.stockModel;


@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id =Integer.parseInt(request.getParameter("orderId"));
		List<OrderModel> orderList = OrderController.getOrderById(id);
		
		//fetch stock list
		IStockControl obj = new stockControl();
		List<stockModel> allStock = obj.getAllStock();
		request.setAttribute("allStock", allStock);
		
		if (orderList != null && !orderList.isEmpty()) {
		    OrderModel order = orderList.get(0); //  get the first (and expected only) 
		    request.setAttribute("order", order);
		    request.getRequestDispatcher("OrderManagement/updateOrder.jsp").forward(request, response);
		} else {
		    response.sendRedirect("error.jsp?message=Order not found");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int orderId = Integer.parseInt(request.getParameter("orderId"));
	    int qty = Integer.parseInt(request.getParameter("qty"));
	    float totalPrice = Float.parseFloat(request.getParameter("total_price"));

	    boolean result = OrderController.updateOrder(orderId, qty, totalPrice);

	    if (result) {
	        response.sendRedirect("GetAllOrdersServlet"); // go back to order list
	    } else {
	        response.sendRedirect("error.jsp?message=Failed to update order");
	    }
	}

}
