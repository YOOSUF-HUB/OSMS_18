package bookShopPackage;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String description = request.getParameter("description");

        boolean isInserted = BookController.insertData(name, price, category, quantity, description);

        if (isInserted) {
            String alertmsg = "Data Inserted Successfully";
            response.getWriter().println("<script> alert('"+alertmsg+"'); window.location.href='bookGetAllServlet'</script>");
            
            
        } else {
            request.setAttribute("error", "Data insertion failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}
