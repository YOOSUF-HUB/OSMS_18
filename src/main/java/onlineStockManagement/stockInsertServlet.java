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
		int supplier_id  = Integer.parseInt(request.getParameter("supplier_id"));
		int quantity  = Integer.parseInt(request.getParameter("quantity"));  
		int unit_cost  = Integer.parseInt(request.getParameter("unit_cost"));
		int selling_price  = Integer.parseInt(request.getParameter("selling_price"));
		String date_added  = request.getParameter("date_added");
		String comments = request.getParameter("comments");
		
		
		
		boolean isTrue;
		
		isTrue = stockControl.insertData(item_name, item_model, item_manufacturer ,supplier_id, quantity, unit_cost, selling_price, date_added, comments);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successfull";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='done.jsp'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}

} 
