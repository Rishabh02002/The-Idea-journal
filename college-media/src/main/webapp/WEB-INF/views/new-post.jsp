<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Write a New Blog Post</title>

        <link href='<c:url value="/resources/bootstrap/css/bootstrap.min.css" />' rel="stylesheet" >

        <link rel="stylesheet" href='<c:url value="/resources/fontawesome/css/all.min.css" />'>

        <link rel="stylesheet" href='<c:url value="/resources/manual/CM.css" />'>

        <script src='<c:url value="/resources/bootstrap/js/bootstrap.bundle.min.js" />' defer></script>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <div class="container my-5">
            <h1 class="text-center mb-4 text-primary">
                <i class="fas fa-feather-alt me-2"></i> Write a New Post
            </h1>

            <div class="card shadow-lg border-0 mx-auto" style="max-width: 800px;">
                <div class="card-header bg-primary text-white text-center h4 py-3">
                    <i class="fas fa-pen-nib me-2"></i> Post Details
                </div>
                <div class="card-body p-4">

                    <form action="/post/new" method="POST" enctype="multipart/form-data" name="post">

                        <div class="mb-3">
                            <label for="postTitle" class="form-label fw-bold">Post Title:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-heading"></i></span>
                                <input type="text" id="postTitle" name="postTitle" required class="form-control" placeholder="A catchy title for your post" value="${post.postTitle}"/>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="category" class="form-label fw-bold">Category:</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-folder"></i></span>
                                    <%-- Replaced form:select path="category.categoryId" with standard HTML select --%>
                                <select id="category" name="category.categoryId" class="form-select" required>
                                    <option value="0" label="-- Select Category --" 
                                            <c:if test="${post.category.categoryId == 0 || post.category.categoryId == null}">selected</c:if>
                                                />
                                    <%-- Using JSTL c:forEach to loop through categories --%>
                                    <c:forEach items="${categories}" var="cat">
                                        <option value="${cat.categoryId}"
                                                <c:if test="${post.category.categoryId == cat.categoryId}">selected</c:if>>
                                            ${cat.categoryType}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <label for="postImage" class="form-label fw-bold">Post Picture:</label>

                        <div class="input-group">



                            <span class="input-group-text"><i class="fa-solid fa-camera"></i></span>
                            <input class="form-control" type="file" id="postImage" name="postImage" placeholder="Select a post Image">

                        </div>
                        <div class="mb-4">
                            <label for="postContent" class="form-label fw-bold">Content:</label>
                            <div class="input-group">
                                <span class="input-group-text align-self-start mt-2"><i class="fas fa-paragraph"></i></span>
                                    <%-- Replaced form:textarea path="postContent" with standard HTML textarea --%>
                                <textarea id="postContent" name="postContent" rows="10" class="form-control" required placeholder="Write your amazing content here...">${post.postContent}</textarea>
                            </div>
                        </div>

                        <div class="d-grid gap-2 mb-3">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-paper-plane me-2"></i> Publish Post
                            </button>
                        </div>

                        <div class="text-center">
                            <a href="<c:url value="/content"/>" class="btn btn-outline-secondary">
                                <i class="fas fa-times-circle me-1"></i> Cancel
                            </a>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>