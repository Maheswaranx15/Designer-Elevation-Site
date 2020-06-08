

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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		          
		String a=request.getParameter("first-name");  
		String b=request.getParameter("last-name"); 
		String c=request.getParameter("age");  
		String d=request.getParameter("nationality");  
		String e=request.getParameter("phone"); 
		String f=request.getParameter("email"); 
		String g=request.getParameter("pass"); 
		String H=request.getParameter("address");  	          
		try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");  
		  
		PreparedStatement ps=con.prepareStatement("insert into register(firstname,lastname,age,nationality,phone,email,pass,address) values(?,?,?,?,?,?,?,?)");  
		  
		ps.setString(1,a);  
		ps.setString(2,b);  
		ps.setInt(3,Integer.parseInt(c.trim())); 
		ps.setString(4,d); 
		ps.setString(5,e); 
		ps.setString(6,f); 
		ps.setString(7,g); 
		ps.setString(8,H);  
		
		
		          
		int i=ps.executeUpdate();  
		if(i>0)  
		 
		    response.sendRedirect("Login.jsp");  
		          
		}catch (Exception e2) {
			e2.printStackTrace();
		}  
		          
		out.close();  
		}  
	
	}


