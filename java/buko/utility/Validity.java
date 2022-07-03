package buko.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.cj.util.StringUtils;
import buko.dbtask.DBConnection;

public class Validity {

	public static boolean passwordMatch(String password, String confirmpassword)
	{
		if(password.equals(confirmpassword)) 
			return true;
		else 
			return false;		
	}
	
	public static boolean checkString(String val)
	{
		if(StringUtils.isStrictlyNumeric(val)) 
			return false;
		else 
			return true;	
	}
	
	public static boolean checkDuplicacy(String email)
	{
		Connection con =  DBConnection.createConnection();
		String strsql = "select * from uploader where email=?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(strsql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}
	
	public static boolean invalidPhone(String phone) {
		if(phone.length() != 10 && !(StringUtils.isStrictlyNumeric(phone))) 
			return true;
		else 
			return false;
	}
}
