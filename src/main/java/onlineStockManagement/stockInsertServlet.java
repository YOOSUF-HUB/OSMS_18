 package onlineStockManagement;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/stockInsertServlet")
public class stockInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_name  = request.getParameter("item_name");
		String item_model  = request.getParameter("item_model");
		String item_manufacturer = request.getParameter("item_manufacturer");
		int quantity  = Integer.parseInt(request.getParameter("quantity"));  
		float unit_cost  = Integer.parseInt(request.getParameter("unit_cost"));
		float selling_price  = Integer.parseInt(request.getParameter("selling_price"));
		String date_added  = request.getParameter("date_added");
		String description = request.getParameter("description");
		
		
		
		boolean isTrue;
		
		isTrue = stockControl.insertData(item_name, item_model, item_manufacturer , quantity, unit_cost, selling_price, date_added, description);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successfull";
			response.getWriter().println("<script> alert('"+alertMessage+"')window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

} 
