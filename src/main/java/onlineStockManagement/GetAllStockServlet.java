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
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IStockControl obj = new stockControl();
	    List<stockModel> allStocks = obj.getAllStock(); //calling method to fetching all data from the table
	    request.setAttribute("allStocks", allStocks);
	    
	    


	    String view = request.getParameter("view"); //creating a view so that salesrep actor can view the available stock in the system dynamically
	    String page;

	    if ("sales".equalsIgnoreCase(view)) {
	        page = "/OrderManagement/products.jsp";
	    } else {
	        page = "/StockManagement/view_stock.jsp";
	    }

	    RequestDispatcher rd = request.getRequestDispatcher(page);
	    rd.forward(request, response);
	}

	
}


