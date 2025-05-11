package UserPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        IUser obj = new UserController();
        
        boolean isTrue;
		   
		   isTrue = obj.registerUser(name, email, password, phone , role);
		   
		   if(isTrue == true) {
			   String alertmsg = "Data Inserted Successfully";
			   response.getWriter().println("<script> alert('"+alertmsg+"'); window.location.href = 'ViewUsersServlet' </script>");
		   }else {
			   RequestDispatcher dis1 = request.getRequestDispatcher("wrong.jsp");
			   dis1.forward(request, response);
		   }
	}

}
