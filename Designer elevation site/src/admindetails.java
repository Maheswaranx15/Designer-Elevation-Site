
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class admindetails
 */
@WebServlet("/admindetails")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class admindetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public admindetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String connectionURL = "jdbc:mysql://localhost:3306/construction";
		String user = "root";
		String pass = "root";
		response.setContentType("text/html");
		

		String a = request.getParameter("category");
		String b = request.getParameter("Title");
		String c = request.getParameter("Cost");
		String d = request.getParameter("Builder");
		String[] e = request.getParameterValues("Material");
		String[] f = request.getParameterValues("Styles");
		String mat = null;String title = "";
		for (int i = 0; i < e.length; i++) {
			mat += e[i] + ",";
		}
		mat = mat.replaceAll("null", "");
		mat = mat.substring(0, mat.lastIndexOf(","));
		String sty = null;
		for (int i = 0; i < f.length; i++) {
			sty += f[i] + ",";
		}
		sty = sty.replaceAll("null", "");
		sty = sty.substring(0, sty.lastIndexOf(","));
		final Part filePart = request.getPart("file");
		final Part filePart1 = request.getPart("audio");
		final Part filePart2 = request.getPart("video");

		System.out.println(a + "<><>" + b + "<><>" + c + "<><>" + d + "<><>" + "<><>" + mat);
		InputStream inputStream = null; // input stream of the upload file
		InputStream inputStream1 = null; // input stream of the upload file
		InputStream inputStream2 = null; // input stream of the upload file
		BufferedImage bImage = null;

		if (filePart != null) {
			inputStream = filePart.getInputStream();
			bImage = ImageIO.read(inputStream);
			ImageIO.write(bImage, "jpg", new File(
					"E:\\backup\\Designers elevation sites\\WebContent\\img\\"
							+ b + ".jpg"));
		}
		if (filePart1 != null) {
			inputStream1 = filePart1.getInputStream();
			fileWrite(inputStream1, b, "audio", ".mp3");
		}
		if (filePart2 != null) {
			inputStream2 = filePart2.getInputStream();
			fileWrite(inputStream2, b, "video", ".ogg");
		}

		Connection con = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionURL, user, pass);

			PreparedStatement ps = con.prepareStatement("insert into admindetails values (?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, c);
			ps.setString(4, d);
			ps.setString(5, mat);
			ps.setString(6, "img/" + b + ".jpg");
			ps.setString(7, "audio/" + b + ".mp3");
			ps.setString(8, "video/" + b + ".ogg");
			ps.setString(9, String.valueOf(getCurrentDatetime()));
			ps.setString(10, sty);
			ps.executeUpdate();
			HttpSession http = request.getSession();
			PreparedStatement ps1=con.prepareStatement("select * from admindetails");  		      
			ResultSet rs=ps1.executeQuery();
			while(rs.next()) {
				if(title.length() >0)
					title = title+","+rs.getString("Title");
				else
					title = rs.getString("Title");
			}
			http.setAttribute("Title", title);
			http.setAttribute("msg", "Added Succesfully");
			response.sendRedirect("adminsuce.jsp");

		} catch (Exception i) {
			i.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception i) {
					i.printStackTrace();
				}
			}

		}
	}

	public Timestamp getCurrentDatetime() {
		Date date = new Date();
		long time = date.getTime();
		Timestamp ts = new Timestamp(time);
		return ts;
	}

	public void fileWrite(InputStream inputStream, String fileName, String Category, String ext) {
		int bytesRead = 0;
		byte[] buffer = new byte[4 * 1024];
		try {
			FileOutputStream fout = new FileOutputStream(new File(
					"E:\\backup\\Designers elevation sites\\WebContent\\"+ Category + "\\" + fileName + ext));
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				fout.write(buffer, 0, bytesRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
