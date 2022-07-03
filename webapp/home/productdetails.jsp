<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<%
  String id= request.getParameter("book_id");
   
   Connection con=DBConnection.createConnection();
   String strsql="select * from book_details where book_id=?";
   PreparedStatement ps=con.prepareStatement(strsql);
   ps.setString(1, id);
   ResultSet rs=ps.executeQuery();
   rs.next();
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=rs.getString("book_name") %></title>
<link rel="stylesheet" href="home/index.css">
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/33f3254fcd.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid bg-light">
		<!-- header file -->
		<jsp:include page="/home/header.jsp"></jsp:include>
		<!-- navbar file -->
		<jsp:include page="/home/navbar.jsp"></jsp:include>

		<div class="row">

			<div class="col-md-6">
				<img class="card-img-top img-fluid w-100 m-4"
					src="/buko/bookcovers/<%=rs.getString("image") %>" alt="Card image"
					style="height: 100vh;">
			</div>

			<div class="col-md-6">

				<div class="desc m-2">
					<h2><%=rs.getString("book_name") %></h2>
					<h4>
						by <a href="#"><%=rs.getString("author") %></a> (Author)
					</h4>
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
					<h3>
						<i class="fa fa-inr"></i></i><%=rs.getInt("price") %>
						<del>Original price</del>
						<span style="color: green;">(discount%off)</span>
					</h3>
					<p style="color: #873600;">Availibility</p>
					<label for="qnty">Quantity</label><select name="qnty">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">2</option>
						<option value="4">3</option>
						<option value="5">5</option>
					</select><br> <a
						href="/buko/Wishlist?bookid=<%=rs.getString("book_id") %>"
						class="btn btn-warning">Add to Wishlist</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="bookdownload.jsp?book_id=<%=rs.getString("book_id") %>"
						class="btn btn-danger">Download Now</a>
					<h3>Book Description</h3>
					<p><%=rs.getString("description") %></p>
				</div>

			</div>

		</div>

		<!-- footer file -->
		<jsp:include page="/home/footer.jsp"></jsp:include>

	</div>


	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>