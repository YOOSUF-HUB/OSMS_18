package customerPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("customerId"));
	
		
		boolean isTrue;
		
		isTrue = CustomerController.deleteCustomer(id);
	
		if (isTrue == true) {
			
			response.sendRedirect("GetAllCustomersServlet?deleteSuccess=true");
		}
		else {
			
			List<CustomerModel> customerDetails = CustomerController.getCustomerById(id);
			request.setAttribute("customerDetails", customerDetails);
			RequestDispatcher dis2 = request.getRequestDispatcher("GetAllCustomersServlet?deleteSuccess=false");
			dis2.forward(request,response);
		}
	}

}
