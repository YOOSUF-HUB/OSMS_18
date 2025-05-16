package SupplierPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
		boolean isTrue;
		isTrue = SupplierControl.DeleteSupplier(supplier_id);
		if(isTrue == true) {
			String alertMessage = "Data Deleted Successfully";
			response.getWriter().println("<script>('"+alertMessage+"');" + " window.location.href='GetAllSupplierServlet'</script>");
		}
		else {
			
			List<SupplierModel> supplierDetails = SupplierControl.getById(supplier_id);
			request.setAttribute("supplierDetails", supplierDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("SupplierManagement/wrongsupplier.jsp");
			dispatcher.forward(request, response);
		}
	}

}
