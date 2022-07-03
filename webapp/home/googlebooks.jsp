<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="buko.utility.HitApi"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Explore Google Books</title>
<link rel="stylesheet" href="/buko/home/index.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/33f3254fcd.js"
	crossorigin="anonymous"></script>

</head>
<body style="background-color: #FAFAA7;">

	<%
//HttpServletRequest request= new HttpServletRequest();
String search = request.getParameter("search");
String html = HitApi.fetchResults(search);
%>
	<div class="container-fuild">

		<!-- header file -->
		<jsp:include page="/home/header.jsp"></jsp:include>
		<div class="row m-3">
			<div class="col-md-6">
				<h3>Search in Google Books</h3>
			</div>
			<div class="col-md-6">
				<form action="googlebooks">
					<div class="input-group m-auto">
						<input type="text" class="form-control" name="search"
							placeholder="Search something">
						<button class="input-group-text btn" type="submit"
							style="background-color: #148F77;">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>

			<div class="d-flex justify-content-around flex-wrap align-middle">
				<%=html %>
			</div>
		</div>



	</div>

	<jsp:include page="/home/footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>