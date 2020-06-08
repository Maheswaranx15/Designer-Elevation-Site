

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
	public class Register extends HttpServlet {  
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response)  
		            throws ServletException, IOException {  
		  
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		          
		String n=request.getParameter("name");  
		String p=request.getParameter("email");  
		String e=request.getParameter("pass");  
		String c=request.getParameter("re_pass");  
		          
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/details","root","root");    
		  
		PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?)");  
		ps.setString(1,n);  
		ps.setString(2,p);  
		ps.setString(3,e);  
		ps.setString(4,c);  
		          
		int i=ps.executeUpdate();  
		if(i>0)
			
		out.print("You are successfully registered...");     
		}
		catch (Exception e2) {System.out.println(e2);}  
		          
		out.close();  
		}  
		  
		}  
