<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import=" java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
       String id=request.getParameter("id");
       String driverName="com.mysql.cj.jdbc.Driver";
       String connectionUrl = "jdbc:mysql://localhost:3306/";
       
       String dbName="bukodb";
       String userId="root";
       String password="root";
       try{
    	   Class.forName(driverName);
       }catch(ClassNotFoundException e) {
       e.printStackTrace();
       }
       Connection connection=null;
       Statement statement = null;
       ResultSet resultSet=null;
       %>
<h2 align="center">
	<font> <strong>Hello Admin this is table for the
			uploader detail </strong></font>
</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>

	</tr>
	<tr bgcolor="yellow">
		<td><b>id</b></td>
		<td><b>name</b></td>
		<td><b>password</b></td>
		<td><b>email</b></td>
		<td><b>gender</b></td>
		<td><b>phonenumber</b></td>

	</tr>
	<%
       try{
    	   connection = DriverManager.getConnection(connectionUrl+dbName,id,password);
    	   statement=connection.createStatement();
    	   String sql="Select * FROM uploader";
    	   resultSet=statement.executeQuery(sql);
    	   while(resultSet.next()){
    		   %>

	}
	<tr bgcolor="#DEB887">
		<td><%=resultSet.getString("id") %></td>
		<td><%=resultSet.getString("name")%></td>
		<td><%=resultSet.getString("password")%></td>
		<td><%=resultSet.getString("email")%></td>
		<td><%=resultSet.getString("gender")%></td>
		<td><%=resultSet.getString("phonenumber")%></td>

	</tr>

	<% 
       }
       connection.close();
       }
       catch(Exception e) {
    	   e.printStackTrace();
    	   
       }
       %>
</table>


</html>