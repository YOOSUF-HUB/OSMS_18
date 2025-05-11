package orderPackage;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customerPackage.CustomerController;
import customerPackage.CustomerModel;
import onlineStockManagement.stockControl;
import onlineStockManagement.stockModel;


@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetch customer list
		List<CustomerModel> allCustomers = CustomerController.getAllCustomers();
		request.setAttribute ("allCustomers", allCustomers);
		
		//fetch stock list
		List<stockModel> allStock = stockControl.getAllStock();
		request.setAttribute("allStock", allStock);

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("OrderManagement/addOrder.jsp");
		dispatcher.forward(request, response);
		
		
		
	}
	
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cusIDstr = request.getParameter("cusID");
		String itemIDstr = request.getParameter("itemID");
		String qtystr = request.getParameter("qty");
		
		//changing string to int 
		int cusId = Integer.parseInt(cusIDstr);
		int itemId = Integer.parseInt(itemIDstr);
		int quantity = Integer.parseInt(qtystr);
        Date orderDate = new Date(System.currentTimeMillis()); // Get current date as java.sql.Date

		
		// Insert the order into the database
        boolean isTrue = OrderController.insertdata(itemId, quantity, orderDate, cusId);
        
        
		if (isTrue == true) {
			
			// Redirect to GetAllOrdersServlet after successful insertion
            response.sendRedirect("GetAllOrdersServlet");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
			dis2.forward(request,response);
		}
		
		
	}
	
	

}
