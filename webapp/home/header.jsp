<!-- header section -->
	<nav class="navbar navbar-expand-sm" id="header" >
		<div class="container">
			<a class="navbar-brand" href="/buko" id="logo">BUKO</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link text-white"
						href="/buko/uploader/uploaderhome.jsp"><i class="fa fa-user"
							aria-hidden="true"></i></a></li>
					<li class="nav-item"><a class="nav-link text-white" id='lgin'
						href="/buko/login">Login</a></li>
					<li class="nav-item" id="lgout" style="opacity: 0; display: none;">
						<a class="nav-link text-white" href="/buko/Logout">Logout</a></a>
					</li>
				</ul>
				<form class="d-flex" action="/buko/search">
					<input class="form-control me-2" type="text" name="key"
						placeholder="Search">
					<button class="btn btn-primary" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<!--  header section end -->

	<%
	// to check whether any session is on or not if yes then display logout button
	String cid = (String) session.getAttribute("userkey");
	if (cid != null) {
	%>
	<script>
		function update() {
			let lgin = document.getElementById("lgin");
			lgin.setAttribute("style", "opacity: 0; display: none;");
			let lgout = document.getElementById("lgout");
			lgout.setAttribute("style", "opacity: 1; display:inline;");
		}
		update();
	</script>
	<%
	}
	%>
