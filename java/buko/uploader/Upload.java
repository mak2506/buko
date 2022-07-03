package buko.uploader;

import java.io.IOException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		Part part=request.getPart("file");
		String filename=part.getSubmittedFileName();
		//System.out.print(filename);
		
		InputStream is=part.getInputStream();
		byte []data = new byte[is.available()];
		is.read(data);
		String path= "C:/Users/pc/Desktop/BookStore/buko/src/main/webapp/images/"+filename;
		//System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(data);
		fos.close();
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		pw.println("<img src="+path+"'>");
	}

}
