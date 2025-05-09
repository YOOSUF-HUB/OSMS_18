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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/StockManagement/view_stock.jsp");
		dispatcher.forward(request, response);
	}
	
}
