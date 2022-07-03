package buko.uploader;

import java.io.IOException;
import java.sql.*;

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
 * Servlet implementation class UploaderLogin
 */
@WebServlet("/UploaderLogin")
public class UploaderLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploaderLogin() {
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
		// getting details from form data
				String email = request.getParameter("email");
				String pass = request.getParameter("password");

				// setting connection and searching right person from db
				Connection con = DBConnection.createConnection();
				String strsql = "select * from uploader where email=? and password=? and status='approved'";
				PreparedStatement ps = null;
				ResultSet rs = null;
				try {
					ps = con.prepareStatement(strsql);
					ps.setString(1, email);
					ps.setString(2, pass);
					rs = ps.executeQuery();
					if (rs.next()) {
						// to create session
						HttpSession hs = request.getSession();
						hs.setAttribute("userkey", email);
						// sending valid user to user's dashboard
						response.sendRedirect("/buko/uploader/uploaderhome.jsp");
					} else {
						request.setAttribute("message", Message.LOGIN_ERROR_MESSAGE);
						RequestDispatcher rd = request.getRequestDispatcher("/uploader/uploaderlogin.jsp");
						rd.forward(request, response);
					}
				} catch (SQLException se) {
					se.printStackTrace();
				} finally {
					if (ps != null)
						try {
							ps.close();
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					if (rs != null)
						try {
							rs.close();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

				}
	}

}
