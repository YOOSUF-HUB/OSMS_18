package SupplierPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/supplierInsertServlet")
public class supplierInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String supplier_name = request.getParameter("supplier_name");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String supplier_address = request.getParameter("supplier_address");
		String supplier_city = request.getParameter("supplier_city");
		String supplier_country = request.getParameter("supplier_country");
		String supplier_website = request.getParameter("supplier_website");
		String s_date_added = request.getParameter("s_date_added");
		
		boolean isTrue;
		
		isTrue = SupplierControl.insertSupplierData(supplier_name, phone_number, email , supplier_address, supplier_city, supplier_country, supplier_website, s_date_added);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successfull";
			//response.getWriter().println("<script> alert('"+alertMessage+"')window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			
			//response.getWriter().println("<script> alert('"+alertMessage+"')window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			//response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			response.setContentType("text/html");
			response.getWriter().println("<script type='text/javascript'>");
			//response.getWriter().println("alert('" + alertMessage + "');");
			response.getWriter().println("window.location.href='GetAllSupplerServlet';");
			response.getWriter().println("</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
 
		

	}

}


