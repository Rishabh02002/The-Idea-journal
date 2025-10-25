<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Write a New Blog Post</title>

        <link href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' rel="stylesheet" >

        <link rel="stylesheet" href='<c:url value="/resources/fontawesome/css/all.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>

        <script src='<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js" />' defer></script>

        <title>Insert title here</title>
    </head>
    <body>
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

    </body>
</html>