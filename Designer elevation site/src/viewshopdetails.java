

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
 * Servlet implementation class viewshopdetails
 */
@WebServlet("/viewshopdetails")
public class viewshopdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewshopdetails() {
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
			PreparedStatement ps=con.prepareStatement("select * from addshopdetails where Quantity!=0");  		      
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) {
					map = new HashMap<>();
					map.put("productid", rs.getString("productid"));
					map.put("Materials", rs.getString("Materials"));
					map.put("netprice", rs.getString("netprice"));
					map.put("Quantity", rs.getString("Quantity"));
					map.put("Discount", rs.getString("Discount"));
					map.put("totalprice", getTotal(rs.getInt("netprice"),rs.getInt("Discount")));
					map.put("brand", rs.getString("brand"));
					shop.add(map);
			}
			ses.setAttribute("shoplist", shop);
			response.sendRedirect("shopsucc.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public int getTotal(int price,int discount){
		return price-(price*discount/100);
	}

}
