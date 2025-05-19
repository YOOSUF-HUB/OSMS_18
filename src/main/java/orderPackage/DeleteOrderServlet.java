package orderPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("orderId"));

		boolean isTrue;
		IOrderController OrderController = new OrderController();
		
		isTrue = OrderController.deleteOrder(id);

	

		if (isTrue == true) {

			response.sendRedirect("GetAllOrdersServlet?deleteSuccess=true");

		}else{

			List<OrderModel> customerDetails = OrderController.getOrderById(id);
			request.setAttribute("customerDetails", customerDetails);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("GetAllOrdersServlet?deleteSuccess=false");
			dis2.forward(request,response);

		}
	}

}
