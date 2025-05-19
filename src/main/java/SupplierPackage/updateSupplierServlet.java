package SupplierPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onlineStockManagement.stockControl;
import onlineStockManagement.stockModel;


@WebServlet("/updateSupplierServlet")
public class updateSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
		 ISupplierControl obj = new SupplierControl();
		 List<SupplierModel> supplier = obj.getById(supplier_id);

	        if (supplier != null) {
	            request.setAttribute("supplier", supplier);
	            request.getRequestDispatcher("SupplierManagement/update_supplier.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("error.jsp?message=Report not found");
	        }
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
		String supplier_name = request.getParameter("supplier_name");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String supplier_address = request.getParameter("supplier_address");
		String supplier_city = request.getParameter("supplier_city");
		String supplier_country = request.getParameter("supplier_country");
		String supplier_website = request.getParameter("supplier_website");
		String s_date_added = request.getParameter("s_date_added");
		
		
		ISupplierControl obj = new SupplierControl();
		boolean isTrue;
		isTrue = obj.UpdateSupplier(supplier_id, supplier_name, phone_number, email, supplier_address, supplier_city, supplier_country, supplier_website, s_date_added);
		
		
		if(isTrue == true) {
			List<SupplierModel> supplierDetails = obj.getById(supplier_id);
			request.setAttribute("supplierDetails", supplierDetails);
			
			
			String alertMessage = "Data Update Successfull";
			response.setContentType("text/html");
			response.getWriter().println("<script type='text/javascript'>");
			response.getWriter().println("window.location.href='GetAllSupplierServlet';");
			response.getWriter().println("</script>");


		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
