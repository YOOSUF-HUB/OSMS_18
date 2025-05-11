package UserPackage;

import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");
		
		try {
			List<UserModel> userlogin = UserControl.LoginValidate(user_email, user_password);
			if(userlogin != null && !userlogin.isEmpty()) {
				String alertMessage = "Login Sucessfull";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='UserManagement/Profile.jsp'</script>");
			} else {
				String alertMessage = "Invalid Credential. Please try Again";
				response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='UserManagement/Login.jsp'</script>");
			}
			request.setAttribute("userlogin", userlogin);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
