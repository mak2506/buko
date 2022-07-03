<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#logo {
	text-decoration: none;
	color: #F9A825;
	font-size: 10vh;
	font-family: forte;
	text-shadow: 2px 2px #784212;
}

body {
	background-color: #76D7C4;
}
</style>
</head>
<body>
	<div class="conatiner-fluid">

		<a class="btn btn-danger m-3" href="/buko">Back To Home</a>
		<div class="text-center">
			<a href="/buko" id="logo">BUKO</a>
		</div>
		<div class="bg-light w-50 m-auto rounded-3 shadow p-4">
			<h1 class="text-center"
				style="color: #17A589; text-shadow: 2px 2px 2px grey;">Admin
				Sign IN</h1>
			<form method="post" action="/buko/AdminLogin">
				<table class="table">
					<tbody>
						<tr>
							<th class="text-center"><label>User ID</label></th>
							<th><input type="text" id="id" name="id"
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
		</div>

		<!-- Latest compiled JavaScript -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>