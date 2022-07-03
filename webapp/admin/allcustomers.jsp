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
<title>Admin- All Customers</title>
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
	String strsql="select * from uploader";
	PreparedStatement ps=con.prepareStatement(strsql);
	ResultSet rs=ps.executeQuery();
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
			<h2 id="title">All Customers</h2>
			<table class='table table-striped table-sm'>
				<thead>
					<tr>
						<th scope='col'>ID</th>
						<th scope='col'>Name</th>
						<th scope='col'>Email</th>
						<th scope='col'>Gender</th>
						<th scope='col'>Registeration Date</th>
						<th scope='col'>Status</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
			while(rs.next())
			{
				int id = rs.getInt("id");
				String section= "";
				String status = rs.getString("status");
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
						<th><%=rs.getInt("id") %></th>
						<th><%=rs.getString("name") %></th>
						<th><%=rs.getString("email") %></th>
						<th><%=rs.getString("gender") %></th>
						<th><%=rs.getDate("date") %></th>
						<th><%=section %></th>
						<td><form action="/buko/Customers">
								<input type="hidden" name="id" value=<%=rs.getInt("id") %>>
								<button type="submit" class="btn btn-danger" name="delete">Remove</button>
							</form></td>
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


