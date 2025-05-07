package onlineStockManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateStockServlet")
public class updateStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
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
		
		 
		boolean isTrue;
		isTrue = stockControl.UpdateStock(item_id, item_name, item_model, item_manufacturer, quantity, unit_cost, selling_price, date_added, description);
		
		
		if(isTrue == true) {
			List<stockModel> stockDetails = stockControl.getById(item_id);
			request.setAttribute("stockDetails", stockDetails);
			
			
			String alertMessage = "Data Update Successfull";
			//response.getWriter().println("<script> alert('"+alertMessage+"')window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			//response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='/Online-stock-management-system/src/main/java/onlineStockManagement/GetAllStockServlet'</script>");
			response.setContentType("text/html");
			response.getWriter().println("<script type='text/javascript'>");
			//response.getWriter().println("alert('" + alertMessage + "');");
			response.getWriter().println("window.location.href='GetAllStockServlet';");
			response.getWriter().println("</script>");


		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}
