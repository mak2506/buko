package buko.dbtask;
import java.sql.*;
//import java.util.ResourceBundle;
public class DBConnection {
	private static Connection connection;
	 private static PreparedStatement ps;
	 private static ResultSet rs;
	 //private static ResourceBundle rb;
	 
	 public static ResultSet getData(String sql)
	 {
		 try {
			 connection=createConnection();
			 ps=connection.prepareStatement(sql);
			 rs=ps.executeQuery();
					
		 }
		 catch(SQLException se)
		 {
			 se.printStackTrace();
		 }
		 return rs;
	 }
	
	
	public static Connection createConnection()
	{
		/*
		 * rb=ResourceBundle.getBundle("buko/dbtask/dbinfo"); String
		 * database_Id=rb.getString("db.id"); String
		 * database_Pass=rb.getString("db.password"); String
		 * database_Url=rb.getString("db.url");
		 * System.out.println(database_Id+" "+database_Pass +database_Url);
		 */
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/bukodb","root","root");
		//connection=DriverManager.getConnection(database_Url,database_Id,database_Pass);
		
		}
		catch(SQLException | ClassNotFoundException cse)
		{
			cse.printStackTrace();
			
		}
		return connection;
		
	}
}
