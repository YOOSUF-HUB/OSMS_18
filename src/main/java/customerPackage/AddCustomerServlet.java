package customerPackage;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cname = request.getParameter("cname");
		String bname = request.getParameter("bname");
		String email = request.getParameter("email");
		String number = request.getParameter("pnumber");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zip = request.getParameter("zip");
		

		boolean isTrue;
		ICustomerController CustomerController = new CustomerController();
		
		isTrue = CustomerController.addCustomer(cname, bname, email, number, address, city, country, zip);
	
		if (isTrue == true) {
			
			response.sendRedirect("GetAllCustomersServlet?addCustomerSuccess=true");
		}
		else {
			response.sendRedirect("addCustomer.jsp?addCustomerSuccess=false");
		}
		
		
		
	}

}