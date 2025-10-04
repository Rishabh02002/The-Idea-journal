<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>

<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />'>
<script src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
<link rel="stylesheet"
	href='<c:url value="/resources/fontawesome/css/all.min.css" />'>
<script src='<c:url value="/resources/fontawesome/js/all.min.js"/>'></script>


<title>login</title>
</head>
<body class="bg-primary">
	<jsp:include page="navbar.jsp" />
	<!--form -->

	<div class="container mt-5">
		<div class="row">
			<div class=" col-sm-4 offset-sm-4 card">
				<div class="card-header mt-2"><i class="fa-solid fa-user mr-1"></i>Login</div>
				<div class="card-body">

					<form>
						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
							<div id="emailHelp" class="form-text">We'll never share
								your email with anyone else.</div>
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control"
								id="exampleInputPassword1">
						</div>
						
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>

				</div>
				<div class="card-footer"></div>
			</div>
		</div>
	</div>


</body>
</html>