package buko.services;
import buko.utility.*;
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
import javax.servlet.http.HttpSession;

import buko.dbtask.DBConnection;

/**
 * Servlet implementation class Wishlist
 */
@WebServlet("/Wishlist")
public class Wishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Wishlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		String cid=(String)hs.getAttribute("userkey");
		if(cid==null || hs.isNew())
		{
			response.sendRedirect("/buko/uploader/uploaderlogin.jsp");
		} else {
			int bid= Integer.parseInt(request.getParameter("bookid"));
			int uid = UserDetails.getUserId(cid);
			if(!BookValidity.checkDuplicacy(bid)) {
				System.out.println("Book not already present");
				//System.out.println(bid);
				Connection con=DBConnection.createConnection();
				String sql = "insert into wishlist (user_id, product_id) values (?, ?) ";
				PreparedStatement ps=null;
				ResultSet rs=null;
				try {
					ps=con.prepareStatement(sql);
					ps.setInt(1, uid);
					ps.setInt(2, bid);
					int status = ps.executeUpdate();
					if (status > 0)
						response.sendRedirect("/buko/home/productdetails.jsp?book_id="+bid);
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
			} else {
				System.out.println("Book already present");
				response.sendRedirect("/buko/home/productdetails.jsp?book_id="+bid);
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
