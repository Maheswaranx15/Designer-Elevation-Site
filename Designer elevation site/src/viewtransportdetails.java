

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class viewtransportdetails
 */
@WebServlet("/viewtransportdetails")
public class viewtransportdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewtransportdetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession();
		Map map = null;
		List shop = new ArrayList();
		try{
		    Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");  
			PreparedStatement ps=con.prepareStatement("select * from addtransportdetails where quantity!=0");  		      
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) {
					map = new HashMap<>();
					map.put("productid", rs.getString("productid"));
					map.put("equipment", rs.getString("equipment"));
					map.put("description", rs.getString("description"));
					map.put("location", rs.getString("location"));
					map.put("duration", rs.getString("duration"));
					map.put("serialno", rs.getString("serialno"));
					map.put("rate", rs.getString("rate"));
					map.put("availability", rs.getString("availability"));
					map.put("quantity", rs.getString("quantity"));
					shop.add(map);
			}
			ses.setAttribute("transportlist", shop);
			response.sendRedirect("transportsucc.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
