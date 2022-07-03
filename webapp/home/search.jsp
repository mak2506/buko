<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/33f3254fcd.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- header file -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- navbar file -->
		<jsp:include page="navbar.jsp"></jsp:include>
		<div class="d-flex flex-wrap justify-content-around p-2">
			<%
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
	
	    while(rs.next())
	    {
	    	%>
			<div class="card m-2" style="width: 22%">
				<img class="card-img-top img-fluid w-100"
					src="/buko/bookcovers/<%=rs.getString("image") %>" alt="Card image"
					style="height: 40vh;">
				<div class="card-body">
					<h4 class="card-title"><%=rs.getString("book_name") %></h4>
					<p class="card-text">
						<span><%=rs.getString("price") %></span>
					</p>
					<a
						href="/buko/home/productdetails.jsp?book_id=<%=rs.getString("book_id") %>"
						class="btn btn-primary">See Details</a>
				</div>
			</div>
			<%
	    }
	    %>
		</div>
		<%
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

%>

		<!-- footer file -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>