<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/33f3254fcd.js"
	crossorigin="anonymous"></script>

<style>
.header {
	height: 13vh;
	/*position: sticky;*/
	background: linear-gradient(#148F77, #1ABC9C);
	margin-bottom: 2vh;
}

.navbar-style {
	box-shadow: 0 1px 3px black;
}
/*
.navbar-header{
    border: 2px solid white;

}
*/
#logo {
	text-decoration: none;
	color: #F9A825;
	font-size: 6vh;
	font-family: forte;
	text-shadow: 2px 2px #784212;
}

.icon {
	/*border: 2px solid white;*/
	margin-right: 7vh;
}

.icon-bar {
	background: black;
}

#icon li a {
	color: black;
	font-size: 4vh;
}

#icon li a:hover {
	background-color: #17A589;
}

#icon li a:visited {
	background-color: #17A589;
}
</style>

</head>
<body>

	<div class="container-fluid">
		<div class="row header">
			<nav class="navbar navbar-style">
				<div class="navbar-header mx-4">
					<a href="/buko" id="logo">BUKO</a>
				</div>
				<div class="icon">
					<ul class="nav navbar-nav navbar-right" id="icon">
						<li><a href="cart.htm"><span class="fa">&#xf07a;</span></a></li>
					</ul>
				</div>
			</nav>
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