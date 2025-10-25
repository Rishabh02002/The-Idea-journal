<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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



        <style>
            /* Reusing the card style from index.jsp */
            .card-auth {
                border: none;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s;
            }
            .card-auth:hover {
                transform: translateY(-3px);
            }
            .form-control:focus, .form-select:focus {
                border-color: #0072ff; /* Primary color focus */
                box-shadow: 0 0 0 0.25rem rgba(0, 114, 255, 0.25);
            }
            .register-title {
                color: #0072ff; /* Matching the blue gradient theme */
                font-weight: 700;
            }
            .btn-primary {
                background-color: #0072ff;
                border-color: #0072ff;
            }
            .btn-primary:hover {
                background-color: #005bb5;
                border-color: #005bb5;
            }
        </style>



    </head>
    <body class="bg-primary">
        <jsp:include page="navbar.jsp" />
        <!--register form -->


        <!--form -->

        <!-- REGISTRATION CARD CONTAINER -->
        <div class="container mt-5 mb-5">
            <div class="row justify-content-center">
                <!-- Increased width slightly for better form layout -->
                <div class="col-sm-8 col-md-6 col-lg-5 card card-auth p-0">

                    <div class="card-header p-3 text-center bg-white border-bottom-0">
                        <i class="fa-solid fa-address-book fa-2x register-title mb-1"></i>
                        <h4 class="register-title mb-0">Join The Idea Journal</h4>
                    </div>

                    <div class="card-body pt-0 px-4 pb-4">
                        <%-- Display error message if registration failed --%>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i> ${error}
                            </div>
                        </c:if>

                        <form method="POST" action="/register" class="row g-3" enctype="multipart/form-data">

                            <div class="col-12">
                                <label for="name" class="form-label">Name:</label>
                                <input name="name" id="name" required="true" class="form-control" />
                            </div>

                            <div class="col-12">
                                <label for="emailId" class="form-label">Email ID:</label>
                                <input name="emailId" id="emailId" type="email"
                                       required="true" class="form-control" />
                            </div>

                            <div class="col-12">
                                <label for="password" class="form-label">Password:</label>
                                <input name="password" id="password" type="password"
                                       required="true" class="form-control" />
                            </div>

                            <div class="col-12">
                                <label for="gender" class="form-label">Gender:</label>
                                <select name="gender" id="gender" class="form-select">
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="col-12 mb-3">
                                <label for="profilePic" class="form-label">Profile Picture (PNG, JPG)</label>
                                <!-- The input type is correctly set to 'file' -->
                                <input type="file" name="profilePic" id="profilePic" class="form-control" />
                                <div class="form-text">Your profile picture will be saved as binary data.</div>
                            </div>

                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">
                                    <i class="fas fa-user-plus me-2"></i> Register Account
                                </button>
                            </div>
                        </form>
                    </div>

                    <div class="card-footer bg-white text-center border-top-0 pt-0 pb-3">
                        <p class="mb-0 text-muted">
                            Already have an account? 
                            <a href="<c:url value="/login"/>" class="text-primary fw-bold">Login here</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>