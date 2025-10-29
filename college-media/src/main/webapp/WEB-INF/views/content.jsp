<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.college.media.dao.services.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>College Media - Content Feed</title>

        <link rel="stylesheet" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/fontawesome/css/all.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>

        <script src='<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js"/>' defer></script> 

        <style>
            body {
                padding-top: 65px;
                background-color: #f8f9fa; /* Light gray background */
            }
            .profile-img {
                width: 80px;
                height: 80px;
                object-fit: cover;
            }
            /* Style for the fixed right sidebar card on large screens */
            @media (min-width: 992px) {
                .fixed-sidebar {
                    position: sticky;
                    top: 80px; /* Offset from the fixed navbar */
                }
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="#">
                    <i class="fas fa-graduation-cap me-2"></i> College Media
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav ms-auto">

                     

                        <li class="nav-item me-2">
                            <a class="btn btn-outline-light btn-sm mt-1" href="<c:url value="/post/new" />">
                                <i class="fas fa-plus-circle me-1"></i> New Post
                            </a>
                        </li>


                    </ul>
                </div>
                <li class="nav-item float-end">
                    <a class="btn btn-danger btn-sm mt-1" href="<c:url value="/logout" />">
                        <i class="fas fa-sign-out-alt me-1"></i> Logout
                    </a>
                </li>              
            </div>

        </nav>

        <div class="container mt-4">
            <div class="row g-4">

                <div class="col-lg-9 order-lg-1">
                    <h2 class="mb-4 text-primary fw-light">
                        <i class="fas fa-newspaper me-2"></i> Latest Posts
                    </h2>

                    <c:choose>
                        <c:when test="${not empty posts}">
                            <div class="d-flex flex-column gap-4">
                                <c:forEach var="post" items="${posts}">

                                    <div class="card shadow-lg border-0">

                                        <div class="card-header bg-light">
                                            <h4 class="card-title text-dark mb-1">${post.postTitle}</h4>
                                            <div class="d-flex justify-content-between align-items-center small text-muted">
                                                <span><i class="fas fa-user me-1"></i> By: ${post.user.name}</span>
                                                <span class="badge bg-light"><i class="fas fa-tag me-1"></i> ${post.category.categoryType}</span>
                                                <span class="badge bg-light"><i class="fas fa-thumbs-up me-1"></i>${Likes[post.postId]}</span>
                                            </div>
                                        </div>

                                        <c:if test="${not empty post.postImage}">
                                            <img src="<c:url value="/image/post/${post.postId}" />"
                                                 class="card-img-top" 
                                                 alt="${post.postTitle}'s Image" 
                                                 style="max-height: 300px; object-fit: cover;">
                                        </c:if>

                                        <div class="card-body">
                                            <p class="card-text">
                                                
                                                ${post.postContent.substring(0, post.postContent.length() > 200 ? 200 : post.postContent.length())}${post.postContent.length() > 200 ? '...' : ''}
                                            </p>
                                        </div>

                                        <div class="card-footer d-flex justify-content-between align-items-center">
                                            
                                            <a href="<c:url value="/post/${post.postId}" />" class="btn btn-primary">
                                                Read Full Post <i class="fas fa-arrow-right ms-1"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info text-center mt-5" role="alert">
                                <i class="fas fa-info-circle me-2"></i> No posts available yet.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div> <div class="col-lg-3 order-lg-2 d-none d-lg-block">
                    <div class="card shadow-sm fixed-sidebar">
                        <div class="card-header bg-primary text-white text-center">
                            <i class="fas fa-user-circle me-1"></i> User Profile
                        </div>
                        <div class="card-body text-center">
                            <img class="profile-img rounded-circle mb-3 border border-3 border-primary" 
                                 src="<c:url value="/image/user/${currentUser.id}" />"
                                 alt="${currentUser.name}'s Image">

                            <h5 class="card-title mb-1 text-primary">${currentUser.name}</h5>
                            <p class="card-text small text-muted">${currentUser.emailId}</p>

                            <hr>

                            <a href="#" class="btn btn-outline-primary btn-sm">
                                View Profile <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div> 
            </div> 
        </div> 
        
    </body>
</html>