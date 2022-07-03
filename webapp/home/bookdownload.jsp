<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<%
String cid=(String)session.getAttribute("userkey");

if(cid==null || session.isNew())
{
	request.setAttribute("message", "Unauthorised Access");
	RequestDispatcher rd=request.getRequestDispatcher("/uploader/uploaderlogin.jsp");
	rd.forward(request, response);
}
else{	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Download Book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>

	<%
		String id= request.getParameter("book_id");

		 Connection con1=DBConnection.createConnection();
		String strsql="select * from uploader where email=?";
		PreparedStatement ps=con1.prepareStatement(strsql);
		ps.setString(1, cid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		
		String sql="select * from book_details where book_id=?";
		ps=con1.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs2=ps.executeQuery();
		rs2.next(); 
		
		String user_id=rs.getString("id"); 
		
%>
	<div class="container-fluid bg-light">
		<!-- header file -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- navbar file -->
		<jsp:include page="navbar.jsp"></jsp:include>

		<div class="row">

			<div class="col-md-4">
				<img class="card-img-top img-fluid w-100 m-4"
					src="/buko/bookcovers/<%=rs2.getString("image") %>"
					alt="Card image" style="height: 40vh;">
			</div>

			<div class="col-md-8">
				<div class="order-details m-2">
					<h2 class="text-center">Order Details</h2>
					<form class="form" action="/buko/DownloadFile" method="post">
						<table class="table table-hover m-auto">
							<input type="hidden" name="user_id" id="user_id"
								value=<%=user_id %>>
							<input type="hidden" name="book_id" id="book_id" value=<%=id %>>
							<tr>
								<th>User Name</th>
								<td><input class="form-control" type="text" name="username"
									id="username" value=<%=rs.getString("name") %> disabled></td>
							</tr>
							<tr>
								<th>Email</th>
								<td><input class="form-control" type="email" name="email"
									id="email" value=<%=rs.getString("email") %> disabled></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center"><b>Order info</b></td>
							</tr>
							<tr>
								<th>Book Name</th>
								<td><input class="form-control" type="text" name="bname"
									id="bname" value=<%=rs2.getString("book_name") %> disabled>
									<input type="hidden" name="filename" id="filename"
									value=<%=rs2.getString("file") %>> <input
									type="hidden" name="price" id="price"
									value=<%=rs2.getString("price") %>></td>
							</tr>
							<tr>
								<th>Price</th>
								<td><input class="form-control" type="text" name="bprice"
									id="bprice" value=<%=rs2.getString("price") %> disabled></td>
							</tr>

							<tr>
								<th></th>
								<td><input type="submit" name="action"
									value="Confirm and Proceed" class="btn btn-success"></td>
							</tr>
						</table>
					</form>

				</div>
			</div>

		</div>

		<!-- footer file -->
		<jsp:include page="footer.jsp"></jsp:include>

	</div>

	<script>
console.log("Hello");
console.log(document.getElementById("bprice").value);
console.log(document.getElementById("bname").value);
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
<%
}
%>
