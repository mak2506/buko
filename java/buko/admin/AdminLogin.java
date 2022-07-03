package buko.admin;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buko.dbtask.DBConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		String id=request.getParameter("id");
		String pass=request.getParameter("password");
		//System.out.println(id+" "+pass);
		
		Connection con=DBConnection.createConnection();//error
		
		String strsql="select * from admin where admin_id=? and admin_password=?";//error
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			ps=con.prepareStatement(strsql);
			ps.setString(1, id);
			ps.setString(2, pass);
			 rs=ps.executeQuery();
			// System.out.println("Done");				
			if(rs.next())
			{
				HttpSession hs=request.getSession();//this will create a session
				hs.setAttribute("admin", id);
				response.sendRedirect("/buko/admin/adminhome.jsp");
			}
			else { 
			  response.sendRedirect("/buko/Admin"); 
			  }		  
		}		
		catch(SQLException se)
		{
			se.printStackTrace();
		}	
		finally {
		if(ps!=null)
			try {
				ps.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	}

}
