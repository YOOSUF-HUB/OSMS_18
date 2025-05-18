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

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
       request.getRequestDispatcher("/user/login.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("gmail");
        String password = request.getParameter("password");

        IUser userController = new UserController();
        UserModel user = userController.authenticateUser(email, password);

        if (user != null) {
           
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUserId", user.getId());
            session.setAttribute("loggedInUsername", user.getName());
            session.setAttribute("loggedInUserRole", user.getRole());
            session.setAttribute("user", user); 

            String userRole = user.getRole();

            switch (userRole) {
                case "Stock manager":
                    response.sendRedirect(request.getContextPath() + "/StockOrderManagement/StockManagerDashboard.jsp"); 
                    break;
                case "system admin":
                    response.sendRedirect(request.getContextPath() + "/user/adminDashboard.jsp"); 
                    break;
                case "system auditor":
                    response.sendRedirect(request.getContextPath() + "/ReportManagement/systemauditor.jsp");  
                    break;
                case "sales representative":
                    response.sendRedirect(request.getContextPath() + "/SalesRepDashboard.jsp");    
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/Homepage.jsp"); 
                    break;
            }

        } else {
            request.setAttribute("loginError", "Invalid email or password.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        }
    }
}
