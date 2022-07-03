<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*, buko.dbtask.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
.side_left {
	/* border: 2px solid black;*/
	float: left;
}

.side_right {
	/*border: 2px solid black;*/
	float: right;
}

.user {
	border-radius: 2vh;
	background: rgba(128, 243, 178, 0.7);
	border: 3px solid rgb(19, 199, 127);
	box-shadow: 3px 3px 3px black;
	font-size: 20px;
	font-weight: 500;
	font-family: 'Times New Roman', Times, serif;
	margin: 1vh;
}

#prof_img {
	padding: 2vh;
}

#prof_img img {
	margin: 3vh;
	border: 3px solid rgb(4, 128, 116);
	border-radius: 50%;
}

.user .name {
	color: rgb(4, 128, 116);
	font-weight: 600;
	font-size: 20px;
}

.acc_info {
	border-radius: 2vh;
	background: rgba(128, 243, 178, 0.7);
	border: 3px solid rgb(19, 199, 127);
	box-shadow: 3px 3px 3px black;
	font-size: 20px;
	font-weight: 500;
	font-family: 'Times New Roman', Times, serif;
	margin: 1vh;
	padding: 1vh;
}

.acc_info .list-group a:hover {
	background-color: aquamarine;
}

.sel_content {
	border: 4px solid rgb(19, 199, 127);
	margin: 1vh;
	border-radius: 2vh;
	box-shadow: 3px 3px 3px black;
}
</style>

</head>
<body style="background: rgb(236, 236, 236);">

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
	<%
String msg=(String)request.getAttribute("message");


Connection con=DBConnection.createConnection();
String strsql="select * from uploader where email=?";
PreparedStatement ps=con.prepareStatement(strsql);
ps.setString(1, cid);
ResultSet rs=ps.executeQuery();
rs.next();

String name=rs.getString("name");
int user_id=Integer.parseInt(rs.getString("id"));
%>
	<!-- HEADER -->
	<jsp:include page="/components/uploaderheader.jsp"></jsp:include>

	<!-- MAIN CONTENT -->
	<div class="container-fluid">
		<div class="row">
			<div class="side_left w-25">
				<!-- user profile -->
				<div class="user">
					<span id="prof_img"><img src="profile_icon.png"
						alt="profile" style="width: 10vh; height: 10vh;"></span><span>Hello,
						<span class="name"><%=name %></span>
					</span>
				</div>

				<!-- account info -->
				<jsp:include page="/components/navs.jsp"></jsp:include>
			</div>
			<div class="side_right w-75">
				<div class="sel_content m-auto p-4" style="min-height: 100%;">
					<h2 class="text-center">Add Book Details</h2>
					<form class="form" action="/buko/AddBook" method="post"
						enctype="multipart/form-data">
						<table class="table table-hover m-auto">
							<input type="hidden" name="user_id" id="user_id"
								value=<%=user_id %>>
							<tr>
								<th>Book Name</th>
								<td><input class="form-control" type="text" name="bookname"
									id="bookname" required></td>
							</tr>
							<tr>
								<th>Author</th>
								<td><input class="form-control" type="text" name="author"
									id="author" required></td>
							</tr>
							<tr>
								<th>Genre</th>
								<td><input class="form-control" type="text" name="genre"
									id="genre" required></td>
							</tr>
							<tr>
								<th>Book ISBN Number</th>
								<td><input class="form-control" type="number" name="isbn"
									id="isbn" required></td>
							</tr>
							<tr>
								<th>Book Description</th>
								<td><textarea class="form-control" name="description"
										id="description" cols="20" required></textarea></td>
							</tr>

							<tr>
								<th>Book Price</th>
								<td><input class="form-control" type="number" name="price"
									id="price" required></td>
							</tr>

							<tr>
								<th>Upload File</th>
								<td><input type="file" name="book" size="50" required></td>
							</tr>
							<tr>
								<th>Upload Book Cover</th>
								<td><input type="file" name="bookcover" size="50" required></td>
							</tr>
							<tr>
								<td></td>
								<%if(msg!=null){ %><td class="bg-info"><%=msg %></td>
								<% }  %>
							</tr>
							<tr>
								<th></th>
								<td><input type="submit" name="action" value="Submit Book"
									class="btn btn-success"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>


		<!-- FOOTER -->
		<jsp:include page="/components/uploaderfooter.jsp"></jsp:include>

		<%} %>

		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
			integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
			integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
			crossorigin="anonymous"></script>
</body>
</html>