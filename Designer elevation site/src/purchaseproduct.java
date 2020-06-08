
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
 * Servlet implementation class purchaseproduct
 */
@WebServlet("/purchaseproduct")
public class purchaseproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public purchaseproduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int productid = Integer.parseInt(request.getParameter("produtid"));
			System.out.println("select * from addshopdetails where productid=" + productid);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction", "root", "root");
			PreparedStatement ps = con
					.prepareStatement("update addshopdetails set Quantity=? where productid=" + productid);
			ps.setInt(1, Integer.parseInt(request.getParameter("quantity"))
					- Integer.parseInt(request.getParameter("count")));
			ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("select * from addshopdetails where productid=" + productid);
			ResultSet rs = ps1.executeQuery();
			HttpSession ses = request.getSession();
			if (rs.next()) {
				ses.setAttribute("Materials", rs.getString("Materials"));
				ses.setAttribute("noofcount", request.getParameter("count"));
				ses.setAttribute("brand", rs.getString("brand"));
				ses.setAttribute("purchasedate", new Date());
			}
			ses.setAttribute("totalprice", "" + Integer.parseInt(request.getParameter("price"))
					* Integer.parseInt(request.getParameter("count")));
			response.sendRedirect("shoppurchase.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
