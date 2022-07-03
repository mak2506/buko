package buko.book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import buko.dbtask.DBConnection;
import buko.utility.Message;


/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String key = request.getParameter("key"); 
		String sql = "SELECT * FROM book_details WHERE book_name REGEXP ? OR author REGEXP ? OR genre REGEXP ?";
		Connection con = DBConnection.createConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, key);
			ps.setString(2, key);
			ps.setString(3, key);
			rs=ps.executeQuery();
			 if (rs.next())
			    {
				  request.setAttribute("result", rs.next());
					RequestDispatcher rd = request.getRequestDispatcher("/home/search.jsp");
					rd.forward(request, response);
			    }
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
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
