

import java.awt.Image;
import java.awt.List;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.awt.image.PixelGrabber;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
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
 * Servlet implementation class searchmodular
 */
@WebServlet("/searchmodular")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class searchmodular extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchmodular() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   final Part filePart = request.getPart("file");
		   InputStream inputStre = null; // input stream of the upload file
		   Blob image = null;
	       BufferedImage bImage = null;
	       Map map = null;
	       HttpSession ses = request.getSession();
	       String file = "";
		try {
			 if (filePart != null) {
				   file = getFilename(filePart);
				   String ext = file.substring(file.indexOf(".")+1,file.length());
				   System.out.println("ext"+ext);
				   if(!ext.equals("ogg")) {
				   inputStre = filePart.getInputStream();
		           bImage = ImageIO.read(inputStre);
		           if(bImage != null) {
		        	   System.out.println("bImage"+bImage);
		        	   ImageIO.write(bImage, "jpg", new File("E:\\backup\\Designers elevation sites\\WebContent\\imgcmp\\DES.jpg"));
		           }
		        }else {
		        	file = "video/"+file;
		        }
			 }
		    Class.forName("com.mysql.jdbc.Driver");  
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/construction","root","root");  
			PreparedStatement ps=con.prepareStatement("select * from admindetails where Category='"+request.getParameter("category")+"'");  		      
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) {
				if((bImage != null && processImage(rs.getString("image"))) || (checkText(rs.getString("Title"),request.getParameter("prod"))) || (file.length()>0 && file.equals(rs.getString("Video")))) {
					map = new HashMap<>();
					map.put("Cost", rs.getString("Cost"));
					map.put("Builder", rs.getString("Builder"));
					map.put("Styles", rs.getString("Styles"));
					map.put("Image",rs.getString("Image"));
					map.put("Audio", rs.getString("Audio"));
					map.put("Video", rs.getString("Video"));
				}
			}
			if(map == null) {
				ses.setAttribute("msg", "No Records Found");
			}
			if(request.getParameter("category").equals("Modular Kitchen")) {
				ses.setAttribute("moduler", map);
				response.sendRedirect("modularkitchen.jsp");
			}else if(request.getParameter("category").equals("Interior Design")) {
				ses.setAttribute("interior", map);
				response.sendRedirect("Interiordesign.jsp");
			}else if(request.getParameter("category").equals("Bedroom Design")) {
				ses.setAttribute("bedroom", map);
				response.sendRedirect("Bedroomdesign.jsp");
			}else if(request.getParameter("category").equals("Proper Design")) {
				ses.setAttribute("proper", map);
				response.sendRedirect("pod.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	 private static String getFilename(Part part) {
		    for (String cd : part.getHeader("content-disposition").split(";")) {
		      if (cd.trim().startsWith("filename")) {
		        String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
		        return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
		      }
		    }
		    return null;
		  }
	
	
	public boolean checkText(String res,String req) {
		try {
			System.out.println("req"+req);
			System.out.println("res"+res);
			if(req.length()>0 && req.contains(res)) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//Algorithm Part Start here
	public boolean processImage(String filename) {
		System.out.println("bImage>>"+filename);
		String file1 = "E:\\backup\\Designers elevation sites\\WebContent\\"+filename;
		String file2 = "E:\\backup\\Designers elevation sites\\WebContent\\imgcmp\\DES.jpg";

		int[] data1 = null;
		int[] data2 = null;
		//file1 - database file path
		//file2 - customer surfing file path
		try {
			
		BufferedImage biA = ImageIO.read(new File(file1));
        DataBuffer dbA = biA.getData().getDataBuffer();
        int sizeA = dbA.getSize();                      
        BufferedImage biB = ImageIO.read(new File(file2));
        DataBuffer dbB = biB.getData().getDataBuffer();
        int sizeB = dbB.getSize();
        
        PixelGrabber grab1 =
		new PixelGrabber(biA, 0, 0, -1, -1, false);
		PixelGrabber grab2 =
		new PixelGrabber(biB, 0, 0, -1, -1, false);
		if (grab1.grabPixels()) {
		int width = grab1.getWidth();
		int height = grab1.getHeight();
		data1 = new int[width * height];
		data1 = (int[]) grab1.getPixels();
		}
		if (grab2.grabPixels()) {
		int width = grab2.getWidth();
		int height = grab2.getHeight();
		data2 = new int[width * height];
		data2 = (int[]) grab2.getPixels();
		}
        if(sizeA == sizeB || java.util.Arrays.equals(data1, data2)) {
        	return true;
		}else {
	       return false;
	    }
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		} 
	//Algorithm Part Ends here

}
