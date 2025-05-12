package onlineStockManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetAllStockServlet")
public class GetAllStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		List<stockModel> allStocks = stockControl.getAllStock();
		request.setAttribute("allStocks", allStocks);
		
		// Check optional "view" parameter to decide where to forward
		String view = request.getParameter("view");

		String page;
		if ("sales".equalsIgnoreCase(view)) {
			page = "/OrderManagement/products.jsp"; // JSP for Sales Rep
		} else {
			page = "/StockManagement/view_stock.jsp"; // Default: Stock Management view
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
        rd.forward(request, response);
	}
	
}
