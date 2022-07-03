<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buko Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #76D7C4;
}

#logo {
	text-decoration: none;
	color: #F9A825;
	font-size: 10vh;
	font-family: forte;
	text-shadow: 2px 2px #784212;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<%
		String msg = (String) request.getAttribute("message");
		%>
		<a class="btn btn-danger m-3" href="/buko">Back To Home</a>
		<div class="text-center">
			<a href="/buko" id="logo">BUKO</a>
		</div>
		<div class="bg-light w-50 m-auto rounded-3 shadow p-4">
			<h1 class="text-center"
				style="color: #17A589; text-shadow: 2px 2px 2px grey;">Sign IN</h1>
			<form method="post" action="/buko/UploaderLogin">
				<table class="table">
					<tbody>
						<tr>
							<th class="text-center"><label>User Email</label></th>
							<th><input type="email" id="email" name="email"
								class="w-100 p-2 rounded" required></th>
						</tr>
						<tr>
							<th class="text-center"><label>Password</label></th>
							<th><input type="password" id="password" name="password"
								class="w-100 p-2 rounded" required></th>

						</tr>
						<tr>
							<th colspan="2"><button type="submit"
									class="btn w-100 shadow text-white"
									style="background-color: #17A589;">
									<b>Login</b>
								</button></th>

						</tr>
					</tbody>
				</table>
				<%
				if (msg != null) {
				%>
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>Login Error!</strong>
					<%=msg%>
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				}
				%>
			</form>

			<div class="mt-4 text-center">
				<p>
					Have no account? <a href="uploaderregisteration.jsp">Register
						Here</a>
				</p>
			</div>

		</div>

	</div>

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
