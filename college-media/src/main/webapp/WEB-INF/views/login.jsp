<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>
        <link rel="stylesheet" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' rel="stylesheet" >

        <script src='<c:url value="/resources/bootstrap/js/bootstrap.min.js" />' integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script> <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet"
              href='<c:url value="/resources/fontawesome/css/all.min.css" />'>
        <script src='<c:url value="/resources/fontawesome/js/all.min.js"/>'></script>

        <style>
            .card-auth {
                border: none;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s;
            }
            .card-auth:hover {
                transform: translateY(-3px);
            }
            .form-control:focus {
                border-color: #0072ff; /* Primary color focus */
                box-shadow: 0 0 0 0.25rem rgba(0, 114, 255, 0.25);
            }
            .login-title {
                color: #0072ff; /* Matching the blue gradient theme */
                font-weight: 700;
            }
        </style>
        <title>login</title>
    </head>
    <body class="bg-primary">
        <jsp:include page="navbar.jsp" />
        <!--form -->

        <!-- LOGIN CARD CONTAINER -->
        <div class="container mt-5">
            <div class="row">
                 <div class="col-sm-6 col-md-5 col-lg-4 offset-sm-3 offset-md-4 offset-lg-4 card card-auth p-0">

                    <div class="card-header p-3 text-center bg-white border-bottom-0">
                        <i class="fa-solid fa-user fa-2x login-title mb-1"></i>
                        <h4 class="login-title mb-0">User Login</h4>
                    </div>

                    <div class="card-body pt-0 px-4 pb-4">
                        <%-- Display error message if authentication failed --%>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i> ${error}
                            </div>
                        </c:if>

                        <%-- Display success message from registration redirect --%>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success" role="alert">
                                <i class="fas fa-check-circle me-2"></i> ${message}
                            </div>
                        </c:if>

                        <form action="<c:url value="/login"/>" method="POST">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email ID</label>
                                <input class="form-control" type="email" id="email" name="email" required>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label">Password</label> 
                                <input class="form-control" type="password" id="password" name="password" required>
                            </div>

                            <button class="btn btn-primary w-100 py-2 fw-bold" type="submit">
                                <i class="fas fa-sign-in-alt me-2"></i> Log In to Journal
                            </button>
                        </form>
                    </div>

                    <div class="card-footer bg-white text-center border-top-0 pt-0">
                        <p class="mb-0 text-muted">
                            Don't have an account? 
                            <a href="<c:url value="/register"/>" class="text-primary fw-bold">Register here</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>