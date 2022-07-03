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
Connection con=DBConnection.createConnection();
String strsql="select * from uploader where email=?";
PreparedStatement ps=con.prepareStatement(strsql);
ps.setString(1, cid);
ResultSet rs=ps.executeQuery();
rs.next();

String name=rs.getString("name");
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
				<div class="sel_content m-auto" style="min-height: 100%;">
					<div class="detail">
						<form>
							<table class="table table-hover m-auto">
								<tr>
									<th>Name</th>
									<td><input type="text" value=<%=rs.getString("name") %>
										disabled="true" class="form-control"></td>
								</tr>
								<tr>
									<th>Email</th>
									<td><input type="email" value=<%=rs.getString("email") %>
										disabled="true" class="form-control"></td>
								</tr>
								<tr>
									<th>Phone</th>
									<td><input type="text"
										value=<%=rs.getString("phonenumber") %> disabled="true"
										class="form-control"></td>
								</tr>
								<tr>
									<th>Gender</th>
									<td><input type="text" value=<%=rs.getString("gender") %>
										disabled="true" class="form-control"></td>
								</tr>
								<tr>
									<td></td>
									<td>
										<button class="btn btn-success w-25" id="edit">Edit</button>
										<button class="btn btn-danger w-25" id="update"
											style="display: none">Update</button>
									</td>
								</tr>

							</table>
						</form>

					</div>
				</div>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/buko/jquery/edit.js"></script>
</body>
</html>