package onlineStockManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReportPackage.IReportController;
import ReportPackage.ReportModel;
import ReportPackage.ReportServices;

@WebServlet("/updateStockServlet")
public class updateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int item_id = Integer.parseInt(request.getParameter("item_id"));
		 
		 IStockControl obj = new stockControl();
		 List<stockModel> stock = obj.getById(item_id);

		// If stock is found, forward it to update_stock.jsp
	        if (stock != null) {
	            request.setAttribute("stock", stock);
	            request.getRequestDispatcher("StockManagement/update_stock.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("error.jsp?message=Report not found");
	        }

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int item_id = Integer.parseInt(request.getParameter("item_id"));
		String item_name  = request.getParameter("item_name");
		String item_model  = request.getParameter("item_model");
		String item_manufacturer = request.getParameter("item_manufacturer");
		int quantity  = Integer.parseInt(request.getParameter("quantity"));  
		float unit_cost = Float.parseFloat(request.getParameter("unit_cost"));
		float selling_price = Float.parseFloat(request.getParameter("selling_price"));
		String date_added  = request.getParameter("date_added");
		String description = request.getParameter("description");
		
		IStockControl obj = new stockControl();
		
		boolean isTrue = obj.UpdateStock(item_id, item_name, item_model, item_manufacturer, quantity, unit_cost, selling_price, date_added, description);
		
		
		if(isTrue == true) {
			List<stockModel> stockDetails = obj.getById(item_id);
			
			
			request.setAttribute("stockDetails", stockDetails);
			
			// Set a success message in the session to send notification to the page
	        request.getSession().setAttribute("successMessage","Stock updated successfully");
			
			

			
			response.getWriter().println("<script> window.location.href = 'GetAllStockServlet' </script>");



		}
		else {
			response.sendRedirect("error.jsp?message=Failed to update report");
		}
		
	}

}
