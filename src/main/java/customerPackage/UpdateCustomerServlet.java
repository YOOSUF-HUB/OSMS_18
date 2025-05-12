package customerPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("customerId"));
		List<CustomerModel> customerList = CustomerController.getCustomerById(id);

		if (customerList != null && !customerList.isEmpty()) {
		    CustomerModel customer = customerList.get(0); //  get the first (and expected only) customer
		    request.setAttribute("customer", customer);
		    request.getRequestDispatcher("CustomerManagement/updateCustomer.jsp").forward(request, response);
		} else {
		    response.sendRedirect("error.jsp?message=Customer not found");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("customerId"));
		String cname = request.getParameter("cname");
		String bname = request.getParameter("bname");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String province = request.getParameter("province");
		String zip = request.getParameter("zip");
		
		boolean isTrue;
		
		isTrue = CustomerController.updateCustomer(id,cname, bname, email, number, address, city, province, zip);
	
		if (isTrue == true) {
			
			
			List<CustomerModel> customerDetails = CustomerController.getCustomerById(id);
			request.setAttribute("customerDetails", customerDetails);
			String alertMessage = "Data Updated successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='GetAllCustomersServlet' </script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
			dis2.forward(request,response);
		}
		

	}

}
