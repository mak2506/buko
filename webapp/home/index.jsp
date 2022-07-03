<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buko</title>
<link rel="stylesheet" href="/buko/home/index.css">
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/33f3254fcd.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<%
//to fetch data to display on home page

//creating connection
 Connection con=DBConnection.createConnection();
String strsql="select * from book_details where status='approved'";
PreparedStatement ps=con.prepareStatement(strsql);
//getting data from database
ResultSet rs=ps.executeQuery();

%>

	<div class="container-fluid">
		<!-- header file -->
		<jsp:include page="/home/header.jsp"></jsp:include>
		<!-- navbar file -->
		<jsp:include page="/home/navbar.jsp"></jsp:include>
		<!-- carousal file -->
		<jsp:include page="carousal.jsp"></jsp:include>


		<div class="d-flex flex-wrap justify-content-around p-2">
			<%
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
					<a href="/buko/details?book_id=<%=rs.getString("book_id") %>"
						class="btn btn-primary">See Details</a>
				</div>
			</div>
			<%
    }
    %>
		</div>

		<!-- footer file -->
		<jsp:include page="/home/footer.jsp"></jsp:include>
	</div>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>