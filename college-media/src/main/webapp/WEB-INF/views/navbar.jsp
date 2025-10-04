<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet"
	href='<c:url value="/resources/manual/CM.css" />'>

<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />'>
<script
	src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
<link rel="stylesheet"
	href='<c:url value="/resources/fontawesome/css/all.min.css" />'>
<script
	src='<c:url value="/resources/fontawesome/js/all.min.js"/>'></script>


<title>Insert title here</title>
</head>
<body>
<nav class=" navbar navbar-expand-lg bg-body-primary bg-dark ">
		<div class="container-fluid text-dark">
			<a class="navbar-brand" href="#"><i class="fa-solid fa-globe"></i>College-media</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="//">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="login"><i class="fa-solid fa-user mr-1"></i>Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register"><i class="fa-solid fa-address-book mr-2"></i>Sign up</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled"
						aria-disabled="true">Disabled</a></li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>