package UserPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewUsersServlet")
public class ViewUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IUser userController = new UserController();
        List<UserModel> users = userController.getAllUsers();
        int totalUserCount = userController.getTotalUserCount(); 
        request.setAttribute("totalUsers", totalUserCount);
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/view_user.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
