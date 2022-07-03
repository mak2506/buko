<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
/* footer section */
.footer {
	height: 200px;;
	background: linear-gradient(#1ABC9C, #148F77);
	margin-top: 2vh;
}

.foot {
	display: flex;
	height: 120px;
	justify-content: center;
}

a {
	text-decoration: none;
}

.footer-op {
	width: 20%;
	text-align: center;
	display: inline-block;
}

.footer-op ul {
	list-style-type: none;
}

.footer-op ul .cap {
	color: #eef8f7;
	text-shadow: 2px 2px 2px black;
	font-size: 20px;
	font-family: Georgia, 'Times New Roman', Times, serif;
}

.footer-op ul li a {
	font-family: Georgia, 'Times New Roman', Times, serif;
	color: #9df0c5;
}

.footer-op ul li a:hover {
	color: #57e49b;
}

.rule {
	border-top: 2px solid #117A65;
}
</style>

</head>
<body>

	<footer class="container-fluid footer">
		<div class="foot">
			<div class="footer-op">
				<ul>
					<p class="cap">Policy</p>
					<li><a href="#">Terms of Use</a></li>
					<li><a href="#">Return Policy</a></li>
					<li><a href="#">Security</a></li>
					<li><a href="#">Privacy</a></li>
				</ul>
			</div>
			<div class="footer-op">
				<ul>
					<p class="cap">About</p>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>

				</ul>
			</div>
			<div class="footer-op">
				<ul>
					<p class="cap">Help</p>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Shipping</a></li>
					<li><a href="#">Payments</a></li>
					<li><a href="#">Cancellation and Return</a></li>
				</ul>
			</div>
		</div>

		</div>
	</footer>

</body>
</html>