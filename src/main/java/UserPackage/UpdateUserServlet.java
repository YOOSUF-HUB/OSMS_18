package UserPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        IUser userController = new UserController();

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(idParam);
                UserModel user = userController.getReportById(userId);

                if (user != null) {
                    request.setAttribute("user", user);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("user/editUser.jsp"); 
                    dispatcher.forward(request, response);
                } else {
                    response.sendRedirect("ViewUsersServlet?error=User+not+found");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("ViewUsersServlet?error=Invalid+user+ID");
            }
        } else {
            response.sendRedirect("ViewUsersServlet?error=User+ID+missing");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        IUser userController = new UserController();

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(idParam);
                boolean isUpdated = userController.updateUser(userId, name, email, password, phone, role);

                if (isUpdated) {
                    response.getWriter().println("<script> alert('User Updated Successfully'); window.location.href = 'ViewUsersServlet' </script>");
                } else {
                    response.sendRedirect("ViewUsersServlet?error=Failed+to+update+user");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("ViewUsersServlet?error=Invalid+user+ID");
            }
        } else {
            response.sendRedirect("ViewUsersServlet?error=User+ID+not+provided");
        }
    }
}