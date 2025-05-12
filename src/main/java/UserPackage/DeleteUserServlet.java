package UserPackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(idParam);
                IUser userController = new UserController();
                boolean isDeleted = userController.deleteUser(userId);

                if (isDeleted) {
                    
                    response.sendRedirect("ViewUsersServlet?message=User+deleted+successfully");
                } else {
                   
                    response.sendRedirect("ViewUsersServlet?error=Failed+to+delete+user");
                }

            } catch (NumberFormatException e) {
                
                response.sendRedirect("ViewUsersServlet?error=Invalid+user+ID");
            }
        } else {
          
            response.sendRedirect("ViewUsersServlet?error=User+ID+not+provided");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); 
    }
}