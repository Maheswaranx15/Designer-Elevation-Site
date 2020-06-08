
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Agencies
 */
@WebServlet("/Agencies")
public class Agencies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Agencies() {
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
		System.out.println("welcome");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = null;
		String phone = null;
		String email = null;
		String address = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction", "root", "root");
			PreparedStatement ps = con.prepareStatement("select name,phone,email,address from booking WHERE agency='"
					+ request.getParameter("agency") + "'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				String host = "", user = "", pass = "";

				host = "smtp.gmail.com"; // "smtp.gmail.com";

				user = "boobalan.shiash@gmail.com"; // "YourEmailId@gmail.com" // email id to send the emails

				pass = "Balan@98"; // Your gmail password

				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

				String to = rs.getString("email");// out going email id

				String from = "boobalan.shiash@gmail.com"; // Email id of the recipient

				String subject1 = "Client Details";

				String msg1 = "Dear " + rs.getString("name") + ", Kindly find the below client details";

				msg1 = msg1 + "\n Client Name : " + request.getParameter("name") + " \n Client Phone : "
						+ request.getParameter("phone") + " \n Client Email : " + request.getParameter("email")
						+ " \n Client Address : " + request.getParameter("address") + "";

				boolean sessionDebug = true;

				java.util.Properties props = System.getProperties();
				props.put("mail.host", host);
				props.put("mail.transport.protocol.", "smtp");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.", "true");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.socketFactory.fallback", "false");
				props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
				Session mailSession = Session.getDefaultInstance(props, null);
				mailSession.setDebug(sessionDebug);
				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from));
				InternetAddress[] add = { new InternetAddress(to) };
				msg.setRecipients(Message.RecipientType.TO, add);
				msg.setSubject(subject1);
				msg.setText(msg1); // use setText if you want to send text
				Transport transport = mailSession.getTransport("smtp");
				transport.connect(host, user, pass);
				try {
					transport.sendMessage(msg, msg.getAllRecipients());
				} catch (Exception err) {
					out.println("message not successfully sended"); // assume it’s a fail
				}
				transport.close();
				HttpSession ses = request.getSession();
				ses.setAttribute("msgsuc", "Mail sent successfully");
				response.sendRedirect("MailSent.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
