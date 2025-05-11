package StockOrderManagement;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/StockOrderInsertServlet")
public class StockOrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String order_date = request.getParameter("order_date");
		int quantity_ordered = Integer.parseInt(request.getParameter("quantity_ordered"));
		float unit_price = Float.parseFloat(request.getParameter("unit_price"));
		float total_price = Float.parseFloat(request.getParameter("total_price"));
		String order_status = request.getParameter("order_status");
		String expected_delivery_date = request.getParameter("expected_delivery_date");
		String payment_status = request.getParameter("payment_status");
		String notes = request.getParameter("notes");
		String received_date = request.getParameter("received_date");
		String invoice_number = request.getParameter("invoice_number");
		int supplier_id = Integer.parseInt(request.getParameter("supplier_id"));
				
		
		
		boolean isTrue;
		
		isTrue = StockOrderControl.insertStockOrder(order_date,quantity_ordered,unit_price,total_price,order_status,expected_delivery_date,payment_status,notes,received_date,invoice_number,supplier_id);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successfull";

			response.setContentType("text/html");
			response.getWriter().println("<script type='text/javascript'>");
			response.getWriter().println("window.location.href='StockOrdersServlet';");
			response.getWriter().println("</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}

	}

}
