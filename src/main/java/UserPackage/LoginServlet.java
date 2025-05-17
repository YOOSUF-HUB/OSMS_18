package UserPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("gmail");
        String password = request.getParameter("password");

        IUser userController = new UserController();
        UserModel user = userController.authenticateUser(email, password);

        if (user != null) {
            // Authentication successful
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUserId", user.getId());
            session.setAttribute("loggedInUsername", user.getName());
            session.setAttribute("loggedInUserRole", user.getRole());

            String userRole = user.getRole();

            switch (userRole) {
                case "stock manager":
                    response.sendRedirect("/StockManagerDashboard.jsp");
                    break;
                case "system admin":
                    response.sendRedirect(request.getContextPath() + "/ViewUsersServlet");
                    break;
                case "system auditor":
                    response.sendRedirect(request.getContextPath() + "/ViewReportsServlet");
                    break;
                case "salesrepresentative":
                    response.sendRedirect(request.getContextPath() + "/SalesRepDashboard.jsp");
                    break;
                default:
                    
                    response.sendRedirect(request.getContextPath() + "/ViewReportsServlet"); 
                    break;
            }

        } else {
            
            request.setAttribute("loginError", "Invalid email or password.");
            request.getRequestDispatcher("user/login.jsp").forward(request, response);
        }
    }
}