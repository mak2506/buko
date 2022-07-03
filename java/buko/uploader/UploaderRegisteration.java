package buko.uploader;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import buko.utility.Validity;
import buko.dbtask.*;
import buko.utility.Message;

/**
 * Servlet implementation class UploaderRegisteration
 */
@WebServlet("/UploaderRegisteration")
public class UploaderRegisteration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploaderRegisteration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		 if (request.getParameterMap().containsKey("name")) {
			 String name = request.getParameter("name");
					if (!Validity.checkString(name)) 
						pw.println("Username is invalid");
		    }
		 
		 if (request.getParameterMap().containsKey("email")) {
			 String email = request.getParameter("email");
					if (Validity.checkDuplicacy(email)) 
						pw.println("Email already exists!!");	
		 }
		 
		 if (request.getParameterMap().containsKey("password") && request.getParameterMap().containsKey("confirmpassword")) {
			 String password = request.getParameter("password");
			String confirmpassword = request.getParameter("confirmpassword");
				if(password != "" && confirmpassword != "")
				{
					if (!Validity.passwordMatch(password, confirmpassword)) 
						pw.println("Passwords not matched!!");
				} else {
					pw.println("Password required!!");
				}
		 }
		 
		 if (request.getParameterMap().containsKey("phone")) {
			 String phone = request.getParameter("phone");
					if (Validity.invalidPhone(phone)) {
						pw.println("Invalid phone number!!");
					}	
		 }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		
		Connection con = DBConnection.createConnection();
		String strinsert = "insert into uploader (name, password, email, gender, phonenumber, date, status) values (?,?,?,?,?,?, ?)";
		java.util.Date d = new java.util.Date();
		java.sql.Date sql_date = new java.sql.Date(d.getTime());
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(strinsert);
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, gender);
			ps.setString(5, phone);
			ps.setDate(6, sql_date);
			ps.setString(7, "pending");
			int status = ps.executeUpdate();
			if (status > 0) {
				System.out.println("Registeration done");
				response.sendRedirect("/buko/uploader/uploaderlogin.jsp");
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();

			} catch (SQLException se) {
				se.printStackTrace();

			}

		}
	}

}
