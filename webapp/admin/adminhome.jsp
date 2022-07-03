<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Dashboard</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>

<body>
	<%
String aid=(String)session.getAttribute("admin");

if(aid==null || session.isNew())
{
	request.setAttribute("message", "Unauthorized Access");
	RequestDispatcher rd=request.getRequestDispatcher("/Admin");
	rd.forward(request, response);
}
else{
	
	Connection con=DBConnection.createConnection();
	
	/*To get new users */
	String strsql1="select * from uploader order by date desc limit 5";
	PreparedStatement ps1=con.prepareStatement(strsql1);
	ResultSet rs1=ps1.executeQuery();
	
	/* To get new orders */
	String strsql2="select * from orders order by order_date desc limit 5";
	PreparedStatement ps2=con.prepareStatement(strsql2);
	ResultSet rs2=ps2.executeQuery();
	
	/* To get new products */
	String strsql3="select * from book_details order by publishdate desc limit 5";
	PreparedStatement ps3=con.prepareStatement(strsql3);
	ResultSet rs3=ps3.executeQuery();
	
	%>

	<jsp:include page="components/header.jsp"></jsp:include>
	<jsp:include page="components/navbar.jsp"></jsp:include>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Dashboard</h1>
		</div>
		</div>

		<div class="table-responsive w-75 float-end" id="section">
			<h2 id="title">Latest Users</h2>
			<table class='table table-striped table-sm'>
				<thead>
					<tr>
						<th scope='col'>User ID</th>
						<th scope='col'>User Name</th>
						<th scope='col'>Email</th>
						<th scope='col'>Gender</th>
						<th scope='col'>Registeration Date</th>
						<th scope='col'>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
			while(rs1.next())
			{ 
				int id = rs1.getInt("id");
				String section= "";
				String status = rs1.getString("status");
				switch(status){
				case "pending": section = "<form action='/buko/Customers'><input type='hidden' name='id' value="+id+"><select onchange='this.form.submit()' name='status'><option value='pending' selected>Pending</option><option value='approved'>Approved</option><option value='not approved'>Not Approved</option></select></form>";
								break;
				case "approved": section = "<form action='/buko/Customers'><input type='hidden' name='id' value="+id+"><select onchange='this.form.submit()' name='status'><option value='approved' selected>Approved</option><option value='not approved'>Not Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				case "not approved": section = "<form action='/buko/Customers'><input type='hidden' name='id' value="+id+"><select onchange='this.form.submit()' name='status'><option value='not approved' selected>Not Approved</option><option value='approved'>Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				}
			%>
					<tr>
						<th><%=rs1.getString("id") %></th>
						<th><%=rs1.getString("name") %></th>
						<th><%=rs1.getString("email") %></th>
						<th><%=rs1.getString("gender") %></th>
						<th><%=rs1.getDate("date") %></th>
						<th><%=section %></th>
					</tr>
					<%}
			%>
				</tbody>
			</table>
		</div>


		<div class="table-responsive w-75 float-end" id="section">
			<h2 id="title">Latest Orders</h2>
			<table class='table table-striped table-sm'>
				<thead>
					<tr>
						<th scope='col'>Order ID</th>
						<th scope='col'>User ID</th>
						<th scope='col'>Product ID</th>
						<th scope='col'>Order Date</th>
						<th scope='col'>Status</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
			while(rs2.next())
			{ 
				int oid = rs2.getInt("order_id");
				String section= "";
				String status = rs2.getString("status");
				switch(status){
				case "pending": section = "<form action='/buko/Orders'><input type='hidden' name='oid' value="+oid+"><select onchange='this.form.submit()' name='status'><option value='pending' selected>Pending</option><option value='approved'>Approved</option><option value='not approved'>Not Approved</option></select></form>";
								break;
				case "approved": section = "<form action='/buko/Orders'><input type='hidden' name='oid' value="+oid+"><select onchange='this.form.submit()' name='status'><option value='approved' selected>Approved</option><option value='not approved'>Not Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				case "not approved": section = "<form action='/buko/Orders'><input type='hidden' name='oid' value="+oid+"><select onchange='this.form.submit()' name='status'><option value='not approved' selected>Not Approved</option><option value='approved'>Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				}
			%>
					<tr>
						<th><%=rs2.getInt("order_id") %></th>
						<th><%=rs2.getInt("user_id") %></th>
						<th><%=rs2.getInt("book_id") %></th>
						<th><%=rs2.getDate("order_date") %></th>
						<th><%=section %></th>
					</tr>
					<%}
			%>
				</tbody>
			</table>
		</div>

		<div class="table-responsive w-75 float-end" id="section">
			<h2 id="title">Latest Books Added</h2>
			<table class='table table-striped table-sm'>
				<thead>
					<tr>
						<th scope='col'>Book ID</th>
						<th scope='col'>Name</th>
						<th scope='col'>Author</th>
						<th scope='col'>Publish Date</th>
						<th scope='col'>Status</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
			while(rs3.next())
			{ 
				int bid = rs3.getInt("book_id");
				String section= "";
				String status = rs3.getString("status");
				switch(status){
				case "pending": section = "<form action='/buko/Products'><input type='hidden' name='bid' value="+bid+"><select onchange='this.form.submit()' name='status'><option value='pending' selected>Pending</option><option value='approved'>Approved</option><option value='not approved'>Not Approved</option></select></form>";
								break;
				case "approved": section = "<form action='/buko/Products'><input type='hidden' name='bid' value="+bid+"><select onchange='this.form.submit()' name='status'><option value='approved' selected>Approved</option><option value='not approved'>Not Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				case "not approved": section = "<form action='/buko/Products'><input type='hidden' name='bid' value="+bid+"><select onchange='this.form.submit()' name='status'><option value='not approved' selected>Not Approved</option><option value='approved'>Approved</option><option value='pending'>Pending</option></select></form>";
				break;
				}
			%>
					<tr>
						<th><%=rs3.getInt("book_id") %></th>
						<th><%=rs3.getString("book_name") %></th>
						<th><%=rs3.getString("author") %></th>
						<th><%=rs3.getDate("publishdate") %></th>
						<th><%=section %></th>
					</tr>
					<%}
			%>
				</tbody>
			</table>
		</div>

	</main>
	</div>
	</div>
	<%} %>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script src="./assets/js/script.js"></script> -->
</body>

</html>


