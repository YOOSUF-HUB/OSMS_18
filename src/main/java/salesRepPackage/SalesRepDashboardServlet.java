package salesRepPackage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orderPackage.IOrderController;
import orderPackage.OrderController;
import orderPackage.OrderModel;


@WebServlet("/SalesRepDashboardServlet")
public class SalesRepDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date currentDate = new Date();
		String currentDate2 = new SimpleDateFormat("yyyy-MM-dd").format(currentDate);
		request.setAttribute("currentDate2", currentDate2);
		
		IOrderController OrderController = new OrderController();
		
		List<OrderModel> allOrders = OrderController.getAllOrders();
		request.setAttribute("allOrders", allOrders);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("SalesRepDashboard.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
