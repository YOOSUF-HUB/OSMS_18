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

	// Handles POST requests from stock insert form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Get form data from the request
		String item_name  = request.getParameter("item_name");
		String item_model  = request.getParameter("item_model");
		String item_manufacturer = request.getParameter("item_manufacturer");
		int quantity  = Integer.parseInt(request.getParameter("quantity"));  
		float unit_cost  = Integer.parseInt(request.getParameter("unit_cost"));
		float selling_price  = Integer.parseInt(request.getParameter("selling_price"));
		String date_added  = request.getParameter("date_added");
		String description = request.getParameter("description");

		// Create instance of the stock controller
		IStockControl obj = new stockControl();

		// Call insert method to add data to the database
		boolean isTrue = obj.insertData(item_name, item_model, item_manufacturer, quantity, unit_cost, selling_price, date_added, description);

		// Check if insert was successful
		if (isTrue == true) {
			// If successful, redirect to the servlet that shows all stock
			response.setContentType("text/html");
			response.getWriter().println("<script type='text/javascript'>");
			response.getWriter().println("window.location.href='GetAllStockServlet';");
			response.getWriter().println("</script>");
		} else {
			// If failed, forward to error page
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}
}
