package UserPackage;

import org.apache.commons.codec.digest.DigestUtils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String error = (String) session.getAttribute("loginError");
        if (error != null) {
            request.setAttribute("loginError", error);
            session.removeAttribute("loginError"); // Clear after showing once
        }
        request.getRequestDispatcher("/user/login.jsp").forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("gmail");
        String password = request.getParameter("password");
        
        String hashedPassword = DigestUtils.sha256Hex(password);

        IUser userController = new UserController();
        UserModel user = userController.authenticateUser(email, hashedPassword);
        if (user != null) {
           
            HttpSession session = request.getSession();
            session.setAttribute("loggedInUserId", user.getId());
            session.setAttribute("loggedInUsername", user.getName());
            session.setAttribute("loggedInUserRole", user.getRole());
            session.setAttribute("user", user); 

            String userRole = user.getRole();

            switch (userRole) {
                case "stock manager":
                    response.sendRedirect(request.getContextPath() + "/StockManagerDashboard.jsp"); 
                    break;
                case "system admin":
                    response.sendRedirect(request.getContextPath() + "/user/adminDashboard.jsp"); 
                    break;
                case "system auditor":
                    response.sendRedirect(request.getContextPath() + "/ReportManagement/systemauditor.jsp");  
                    break;
                case "sales representative":
                    response.sendRedirect(request.getContextPath() + "/SalesRepDashboardServlet");    
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/Homepage.jsp"); 
                    break;
            }

        } else {
//            request.setAttribute("loginError", "Invalid email or password.");
//            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
            
            HttpSession session = request.getSession();
            session.setAttribute("loginError", "Invalid email or password.");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
        }
    }
}
