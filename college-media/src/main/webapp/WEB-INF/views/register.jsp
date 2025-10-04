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


<title>register</title>
</head>
<body class="bg-primary">
	<jsp:include page="navbar.jsp" />
	<!--register form -->


	<!--form -->

	<div class="container mt-3">
		<div class="row">
			<div class=" col-sm-4 offset-sm-4 card">
				<div class="card-header mt-2">
					<i class="fa-solid fa-address-book mr-2"></i>Register
				</div>
				<div class="card-body">

					<form>


						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Name </label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								name="Name">
						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Email
								address</label> <input type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="email">
						</div>
						<div class="mb-3">
							<label for="exampleInputPassword1" class="form-label">Create
								Password</label> <input type="password" class="form-control"
								id="exampleInputPassword1" name="password">
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label">Upload your DP</label> <input
								class="form-control" type="file" id="formFile" name="profilePic">
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