

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class rentalproduct
 */
@WebServlet("/rentalproduct")
public class rentalproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rentalproduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
				int productid = Integer.parseInt(request.getParameter("produtid"));
			    Class.forName("com.mysql.jdbc.Driver");  
			    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");  
				PreparedStatement ps=con.prepareStatement("update addtransportdetails set quantity=?,availability=? where productid="+productid);  	
				ps.setInt(1, Integer.parseInt(request.getParameter("quantity"))-Integer.parseInt(request.getParameter("count")));
				if(Integer.parseInt(request.getParameter("quantity"))-Integer.parseInt(request.getParameter("count")) <=0) {
					ps.setString(2, "No");
				}else {
					ps.setString(2, "Yes");
				}
				ps.executeUpdate(); 
				PreparedStatement ps1=con.prepareStatement("select * from addtransportdetails where productid="+productid);  		      
				ResultSet rs=ps1.executeQuery(); 
				HttpSession ses = request.getSession();
				if(rs.next()) {
					ses.setAttribute("equipment", rs.getString("equipment"));
					ses.setAttribute("noofcount", request.getParameter("count"));
					ses.setAttribute("location", rs.getString("location"));
					ses.setAttribute("duration", rs.getString("duration"));
					ses.setAttribute("serialno", rs.getString("serialno"));
					ses.setAttribute("purchasedate", new Date());
				}
				ses.setAttribute("rentalprice", ""+Integer.parseInt(request.getParameter("price"))*Integer.parseInt(request.getParameter("count")));
				response.sendRedirect("transportpurchase.jsp");

		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
