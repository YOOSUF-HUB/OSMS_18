package onlineStockManagement;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderPackage.IOrderController;
import orderPackage.OrderController;
import orderPackage.OrderModel;


@WebServlet("/UpdateCusOrderServlet")
public class UpdateCusOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id =Integer.parseInt(request.getParameter("orderId"));
		IOrderController OrderController = new OrderController();
		
		List<OrderModel> orderList = OrderController.getOrderById(id);
		
		List<OrderModel> allOrders = OrderController.getAllOrders();
		request.setAttribute("allOrders", allOrders);

		IStockControl obj = new stockControl();
		List<stockModel> allStock = obj.getAllStock();
		request.setAttribute("allStock", allStock);
		
		if (orderList != null && !orderList.isEmpty()) {
		    OrderModel order = orderList.get(0);
		    request.setAttribute("order", order);
		    request.getRequestDispatcher("/StockManagement/UpdateCusOrder.jsp").forward(request, response);
		} else {
		    response.sendRedirect("error.jsp?message=Order not found");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String orderIdParam = request.getParameter("order_id");
	        String orderStatus = request.getParameter("order_status");
	        String qtyParam = request.getParameter("qty");


	        if (orderIdParam == null || orderIdParam.isEmpty() || orderStatus == null || orderStatus.isEmpty() ||qtyParam == null || qtyParam.isEmpty()) {
	            response.sendRedirect("error.jsp?message=Missing required form fields");
	            return;
	        }

	        int orderId = Integer.parseInt(orderIdParam);
	        int qty = Integer.parseInt(qtyParam);

	        IOrderController OrderController = new OrderController();
	        boolean result = OrderController.updateOrderStatus(orderId, orderStatus, qty);

	        if (result) {
	            response.sendRedirect("StockCusOrderViewServlet");
	        } else {
	            response.sendRedirect("error.jsp?message=Failed to update order status");
	        }
	    } catch (NumberFormatException e) {
	        response.sendRedirect("error.jsp?message=Invalid number format in form fields");
	    } catch (Exception e) {
	        response.sendRedirect("error.jsp?message=Unexpected error occurred");
	    }
	}





}
