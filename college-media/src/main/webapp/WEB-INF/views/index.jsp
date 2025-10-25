<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>college-media</title>
<!-- Bootstrap CSS -->

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

        
        
        
        
        
         <style>
        /* Custom Styles for Impression */
        .full-height {
            min-height: calc(100vh - 56px); /* Full viewport height minus navbar height */
        }
        .left-panel {
            background: linear-gradient(135deg, #0072ff 0%, #00c6ff 100%); /* Blue gradient */
            color: white;
            padding: 60px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .left-panel h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .left-panel p {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .card-auth {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card-auth:hover {
            transform: translateY(-5px);
        }
        .card-register {
            background-color: #f8f9fa;
        }
    </style>
        
        

</head>
<body class="bg-dark">

	 <!-- 1. NAVIGATION BAR -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand fs-4 fw-bold" href="<c:url value="/"/>">
                <i class="fas fa-lightbulb me-2 text-warning"></i> The Idea Journal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <!-- 2. MAIN SPLIT CONTENT AREA -->
    <main class="container-fluid">
        <div class="row full-height">
            
            <!-- LEFT SIDE: IT/Marketing Impression -->
            <div class="col-lg-7 left-panel">
                <i class="fas fa-code fa-5x mb-4"></i>
                <h1>Code Your Thoughts into Reality.</h1>
                <p>
                    The Idea Journal is your dedicated space for documenting breakthroughs, 
                    sharing expertise, and connecting with innovators. Start building your portfolio today.
                </p>
                <div class="mt-4">
                    <span class="badge bg-primary me-2"><i class="fas fa-edit"></i> Write</span>
                    <span class="badge bg-light text-dark me-2"><i class="fas fa-share-alt"></i> Share</span>
                    <span class="badge bg-info"><i class="fas fa-heart"></i> Connect</span>
                </div>
            </div>
            
            <!-- RIGHT SIDE: Login/Register Cards -->
            <div class="col-lg-5 d-flex flex-column justify-content-center align-items-center p-5">
                
                <h2 class="mb-4 text-center">Join the Community</h2>
                
                <!-- LOGIN CARD -->
                <div class="card card-auth text-center mb-4 w-100" style="max-width: 400px;">
                    <div class="card-body p-4">
                        <i class="fas fa-sign-in-alt fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">Access Your Account</h5>
                        <p class="card-text text-muted">Continue sharing your brilliant ideas.</p>
                        <a href="<c:url value="/login"/>" class="btn btn-primary w-100 mt-2">
                            <i class="fas fa-lock me-2"></i> Log In
                        </a>
                    </div>
                </div>

                <!-- REGISTER CARD -->
                <div class="card card-auth card-register text-center w-100" style="max-width: 400px;">
                    <div class="card-body p-4">
                        <i class="fas fa-user-plus fa-3x text-success mb-3"></i>
                        <h5 class="card-title">New to the Journal?</h5>
                        <p class="card-text text-muted">It only takes a minute to get started.</p>
                        <a href="<c:url value="/register"/>" class="btn btn-success w-100 mt-2">
                            <i class="fas fa-clipboard-list me-2"></i> Register Now
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </main>

    <!-- Bootstrap JS CDN (Required for responsive navbar toggle) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	
</body>

</html>