package buko.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buko.dbtask.DBConnection;

/**
 * Servlet implementation class Customers
 */
@WebServlet("/Customers")
public class Customers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = DBConnection.createConnection();
		PreparedStatement ps = null;
		String strsql="";
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(request.getParameterMap().containsKey("status")) {
			String status = request.getParameter("status");
			strsql = "UPDATE uploader SET status=? where id=?";
			try {
				ps = con.prepareStatement(strsql);
				ps.setString(1, status);
				ps.setInt(2, id);
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println("Status changed");
					response.sendRedirect("/buko/admin/allcustomers.jsp");
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}finally {
				try {
					ps.close();
					con.close();
				}  catch (SQLException se) {
					se.printStackTrace();
				}
				
			}
		}
		
		if(request.getParameterMap().containsKey("delete")) {
			strsql = "DELETE from uploader where id=?";
			try {
				ps = con.prepareStatement(strsql);
				ps.setInt(1, id);
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println("Customer DELETED");
					response.sendRedirect("/buko/admin/allcustomers.jsp");
				}
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					ps.close();
					con.close();
				}  catch (SQLException se) {
					se.printStackTrace();
				}
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
