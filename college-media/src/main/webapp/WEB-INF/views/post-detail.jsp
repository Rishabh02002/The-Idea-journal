<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${post.postTitle} | College Media</title>

        <link rel="stylesheet" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/fontawesome/css/all.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>

        <script src='<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js"/>' defer></script> 
        <script src='<c:url value="/resources/fontawesome/js/all.min.js"/>' defer></script>

        <style>
            body {
                padding-top: 65px;
                background-color: #f8f9fa; /* Light gray background */
            }
            .post-image {
                max-height: 450px; 
                object-fit: cover;
            }
            .content-text {
               white-space: pre-wrap;
                line-height: 1.8;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
            <div class="container-fluid">
               <a class="navbar-brand fs-4 fw-bold" href="<c:url value="/"/>">
                    <i class="fas fa-lightbulb me-2 text-warning"></i> The Idea Journal
                </a>

                <div class="navbar-nav">
                    <a class="btn btn-outline-light" href="<c:url value="/content"/>">
                        <i class="fas fa-arrow-left me-1"></i> Back to Feed
                    </a>
                </div>
            </div>
        </nav>

        <div class="container my-5">
            <div class="row justify-content-center">

                <div class="col-lg-10 col-xl-8">

                    <div class="card shadow-lg border-0">

                        <div class="card-header bg-white p-4">
                            <h1 class="card-title text-primary mb-2">${post.postTitle}</h1>

                            <div class="d-flex flex-wrap align-items-center small text-muted">
                                <span class="me-3">
                                    <i class="fas fa-user-edit me-1"></i> By: <span class="fw-bold">${post.user.name}</span>
                                </span>
                                <span class="me-3">
                                    <i class="fas fa-folder me-1"></i> Category: 
                                    <span class="badge bg-light">${post.category.categoryType}</span>
                                </span>
                            </div>
                        </div>

                        <c:if test="${not empty post.postImage}">
                            <img src="<c:url value="/image/post/${post.postId}" />"
                                 class="card-img-top post-image w-100" 
                                 alt="${post.postTitle}'s Image">
                        </c:if>

                        <div class="card-body p-4">
                            <p class="card-text content-text lead">
                                ${post.postContent}
                            </p>
                        </div>

                        <div class="card-footer d-flex justify-content-between align-items-center bg-light p-3">

                            <c:choose>
                                <c:when test="${not empty like}">
                                    <div class="d-flex justify-content-between align-items-center small text-muted"><i class="fa-solid fa-heart"></i>${liked}</div>

                                </c:when>
                                <c:otherwise>
                                    <h5 class="mb-0 text-light">
                                        <a class="btn btn-primary" href="/likes/post/${post.postId}">Rate<i class="fa-regular fa-heart"></i>  </a>
                                    </h5>

                                </c:otherwise>
                            </c:choose>



                            <a href="<c:url value="/content"/>" class="btn btn-outline-primary">
                                <i class="fas fa-arrow-left me-1"></i> Return to Feed
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>