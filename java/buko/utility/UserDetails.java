package buko.utility;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import buko.dbtask.DBConnection;

public class UserDetails {
	
	public static int getUserId(String email)
	{
		Connection con=DBConnection.createConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {			
			String strsql="select * from uploader where email=?";
			ps=con.prepareStatement(strsql);
			ps.setString(1, email);
			rs=ps.executeQuery();			
			if(rs.next())
			{
				return rs.getInt("id");
			}
		} catch(SQLException se)
		{
			se.printStackTrace();
		} finally {
			try {
				ps.close();
				rs.close();
				con.close();
			} catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		return 0;
	}

}
