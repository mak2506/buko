package buko.book;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buko.dbtask.DBConnection;

/**
 * Servlet implementation class DownloadFile
 */
@WebServlet("/DownloadFile")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid=request.getParameter("user_id");
		String bid=request.getParameter("book_id");
		String price=request.getParameter("price");
		String filename=request.getParameter("filename");
		//System.out.println(price+" "+uid+" "+bid+" "+filename);
		Connection con=DBConnection.createConnection();
		String strinsert="insert into orders (user_id, book_id, price, order_date, status) values (?,?,?,?, ?)";
		 java.util.Date d=new java.util.Date();
		 java.sql.Date sql_date=new java.sql.Date(d.getTime());
		 PreparedStatement ps=null;
		 try {	
			 ps=con.prepareStatement(strinsert);
			 ps.setString(1,uid);
			 ps.setString(2,bid);
			 ps.setString(3,price);
			 ps.setDate(4, sql_date);
			 ps.setString(5, "pending");
			 int status=ps.executeUpdate();
			 if(status>0)
			 {
				 		String path="C:/Users/Mansi Kumari/Desktop/Projects/buko/buko/src/main/webapp/pdf_files/";				 		
				 		File downloadFile = new File(path+filename);
				 		FileInputStream fis = new FileInputStream(downloadFile);
				 		ServletContext context= getServletContext();
				 		String mime=context.getMimeType(path+filename);		
				 		response.setContentType(mime);
				 		response.setContentLength((int)downloadFile.length());
				 		 OutputStream os = response.getOutputStream();
				 		 byte []buffer=new byte[4096];
				 		 int byteRead = -1;
				 		 while((byteRead=fis.read(buffer)) != -1)
				 		 {
				 			 os.write(buffer, 0, byteRead);
				 		 }
				 		 fis.close();
				 		 os.close();
				 		//System.out.println(mime);
			 }
				 			 
		 	}
		 	catch(SQLException se)
		 	{
			 se.printStackTrace();
		 	}
		 	finally {
			 try {
				 if(ps!=null)
					 ps.close();
				 
			 }
			 catch(SQLException se)
			 {
				 se.printStackTrace();
				 
			 }
			 
		 }
	}

}
