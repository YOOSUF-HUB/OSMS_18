package StockOrderManagement;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SupplierPackage.ISupplierControl;
import SupplierPackage.SupplierControl;
import SupplierPackage.SupplierModel;

@WebServlet("/StockOrderUpdateServlet")
public class StockOrderUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int order_id = Integer.parseInt(request.getParameter("order_id"));
        IStockOrderControl objs = new StockOrderControl();
        List<StockOrderModel> stockOrder = objs.getOrderById(order_id);
        request.setAttribute("stockOrder", stockOrder);
        
        ISupplierControl obj = new SupplierControl();
 
        List<SupplierModel> allSupplier = obj.getAllSupplier();
        request.setAttribute("allSupplier", allSupplier);

        RequestDispatcher dis = request.getRequestDispatcher("/StockOrderManagement/update_stockorder.jsp");
        dis.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int order_id = Integer.parseInt(request.getParameter("order_id"));
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

        IStockOrderControl objs = new StockOrderControl();

        boolean isTrue = objs.UpdateStockOrder(order_id, order_date, quantity_ordered, unit_price, total_price, order_status, expected_delivery_date, payment_status, notes, received_date, invoice_number, supplier_id);

        if (isTrue == true) {
        	
        	List<StockOrderModel> StockOrderDetails = objs.getOrderById(order_id);
        	request.setAttribute("StockOrderDetails", StockOrderDetails);
        	
            String alertMessage = "Report Updated Successfully";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href = 'StockOrdersServlet'</script>");
        } else {
            response.sendRedirect("error.jsp?message=Failed to update report");
        }
    }
}