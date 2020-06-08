import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession http = request.getSession();
		try {
			if(request.getParameter("user").equals("admin") && request.getParameter("pass").equals("admin")) {
				http.setAttribute("msg", "Login Successfully");
				response.sendRedirect("Admin.html");
			}else {
				http.setAttribute("msg", "Invalid Login");
				response.sendRedirect("Admin_Login.html");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
