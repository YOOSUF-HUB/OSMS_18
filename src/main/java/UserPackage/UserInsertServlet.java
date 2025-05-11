package UserPackage;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UserInsertServlet")
public class UserInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        String user_password = request.getParameter("user_password");
        String user_phone = request.getParameter("user_phone");
        String user_address = request.getParameter("user_address");

        boolean status = UserControl.insertUserData(user_name, user_email, user_password, user_phone, user_address);

        if (status) {
            // Registration successful
            request.setAttribute("regStatus", "success");
            RequestDispatcher dis = request.getRequestDispatcher("UserManagement/Login.jsp");
            dis.forward(request, response);
        } else {
            // Email already exists or insert failed
            request.setAttribute("regStatus", "duplicate");
            RequestDispatcher dis = request.getRequestDispatcher("UserManagement/UserRegister.jsp");
            dis.forward(request, response);
        }
    }
}
