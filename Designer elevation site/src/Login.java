
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String n = request.getParameter("email");
		String p = request.getParameter("pass");
		System.out.println("username>>>" + n);
		System.out.println("pass>>>" + p);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from register  where email=? and pass=?");
			ps.setString(1, n);
			ps.setString(2, p);
			ResultSet rs = ps.executeQuery();
			HttpSession session = request.getSession();
			if (rs.next()) {
				session.setAttribute("name", n);
				response.sendRedirect("indexsuc.jsp");
			} else {
				out.print("<head><body><script>alert('Sorry username or password error')</script></body></html>");
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.close();
	}

}
