

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession http = request.getSession();
		String title = "";
		try {
			if(request.getParameter("user").equals("admin") && request.getParameter("pass").equals("admin")) {
			 	Class.forName("com.mysql.jdbc.Driver");  
			    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");  
				PreparedStatement ps=con.prepareStatement("select * from admindetails");  		      
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					if(title.length() >0)
						title = title+","+rs.getString("Title");
					else
						title = rs.getString("Title");
				}
				http.setAttribute("Title", title);
				http.setAttribute("msg", "Login Successfully");
				response.sendRedirect("Admin.jsp");
			}else {
				http.setAttribute("msg", "Invalid Login");
				response.sendRedirect("Adminlogin.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
