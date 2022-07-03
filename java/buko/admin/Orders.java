package buko.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buko.dbtask.DBConnection;

/**
 * Servlet implementation class Orders
 */
@WebServlet("/Orders")
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Orders() {
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
		int oid = Integer.parseInt(request.getParameter("oid"));
		if(request.getParameterMap().containsKey("status")) {
			String status = request.getParameter("status");
			strsql = "UPDATE orders SET status=? where order_id=?";
			try {
				ps = con.prepareStatement(strsql);
				ps.setString(1, status);
				ps.setInt(2, oid);
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println("Status changed");
					response.sendRedirect("/buko/admin/allorders.jsp");
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
			strsql = "DELETE from orders where order_id=?";
			try {
				ps = con.prepareStatement(strsql);
				ps.setInt(1, oid);
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println("ORDER DELETED");
					response.sendRedirect("/buko/admin/allorders.jsp");
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
