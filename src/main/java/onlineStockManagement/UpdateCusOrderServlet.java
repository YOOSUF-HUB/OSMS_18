package onlineStockManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderPackage.OrderController;
import orderPackage.OrderModel;


@WebServlet("/UpdateCusOrderServlet")
public class UpdateCusOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id =Integer.parseInt(request.getParameter("orderId"));
		List<OrderModel> orderList = OrderController.getOrderById(id);
		
		
		List<stockModel> allStock = stockControl.getAllStock();
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
	    int orderId = Integer.parseInt(request.getParameter("orderId"));
	    String itemname = request.getParameter("itemname");
	    int qty = Integer.parseInt(request.getParameter("qty"));
	    float totalPrice = Float.parseFloat(request.getParameter("total_price"));
	    String odate = request.getParameter("odate");
	    String ostatus = request.getParameter("ostatus");
	    String bname = request.getParameter("bname");
	    String city = request.getParameter("city");


	    boolean result = OrderController.updateCusOrder(orderId, itemname, qty, totalPrice, odate, ostatus, bname, city);

	    if (result) {
	        response.sendRedirect("StockCusOrderViewServlet");
	    } else {
	        response.sendRedirect("error.jsp?message=Failed to update order");
	    }
	}

}
