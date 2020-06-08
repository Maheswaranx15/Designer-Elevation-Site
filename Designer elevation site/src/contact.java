

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class contact
 */
@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:mysql://localhost:3306/construction";
		String user = "root";
		String pass = "root";
    	response.setContentType("text/html");  
		Connection con = null;

		try{
			String a=request.getParameter("fname");  
			String b=request.getParameter("lname");  
			String c=request.getParameter("email");  
			String d=request.getParameter("subject");  
			String e=request.getParameter("website"); 
			String f=request.getParameter("msg"); 

			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(connectionURL, user, pass);
		    PreparedStatement ps = con.prepareStatement("insert into contact(fname,lname,email,subject,website,msg) values (?,?,?,?,?,?)");
		    ps.setString(1,a);  
		    ps.setString(2,b);  
		    ps.setString(3,c);  
		    ps.setString(4,d);
		    ps.setString(5,e);
		    ps.setString(6,f);
		    ps.executeUpdate();
		    HttpSession http = request.getSession();
		    http.setAttribute("msg", "Added Succesfully");
			response.sendRedirect("contact.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
