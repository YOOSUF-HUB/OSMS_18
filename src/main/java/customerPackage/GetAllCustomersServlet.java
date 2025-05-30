package customerPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/GetAllCustomersServlet")
public class GetAllCustomersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		ICustomerController CustomerController = new CustomerController();
		
		List<CustomerModel> allCustomers = CustomerController.getAllCustomers();
		request.setAttribute("allCustomers", allCustomers);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/CustomerManagement/viewCustomer.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);

	}
}
