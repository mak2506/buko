package buko.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import buko.dbtask.DBConnection;

public class BookValidity {

	public static boolean checkDuplicacy(int pid)
	{
		Connection con =  DBConnection.createConnection();
		String strsql = "select * from wishlist where product_id=?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(strsql);
			ps.setInt(1, pid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;	
	}
	

	
}
