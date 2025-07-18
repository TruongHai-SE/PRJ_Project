<%-- 
    Document   : update
    Created on : Jul 16, 2025, 10:58:47 AM
    Author     : HONG MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <title>Update Book</title>
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 700px;
                margin: auto;
            }
        </style>

    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <div class="form-container">
            <h3 class="text-primary mb-4"><i class="fas fa-edit">Update Book</i></h3>
            <form class="MainController" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${book.id}"/>

                <div class="mb-3">
                    <label class="form-lable">Title</label>
                    <input type="text" class="form-control" name="NewTitle" value="${title}"/>
                </div>

                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="NewAuthor" value="${author}"/>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">ISBN</label>
                    <input type="number" class="form-control" name="NewIsbn" value="${isbn}"/>
                    <c:if test="${isbnError != null}">
                        <div class="text-danger">${isbnError}</div>
                    </c:if>
                </div>

                <div class="mb-3">
                    <label class="">Category</label>
                    <input type="text" class="form-control" name="NewCategory" value="${category}"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Published Year</label>
                    <input type="number" class="form-control" name="NewPublished_year" value="${published_year}"/>
                    <c:if test="${copiesError  != null}">
                        <div class="text-danger">${copiesError}</div>
                    </c:if>
                </div>

                <div class="mb-3">
                    <label class="form-label">Total Copies</label>
                    <input type="number" class="form-control" name="NewTotal_copies" value="${total_copies}"/>
                    <c:if test="${copiesError  != null}">
                        <div class="text-danger">${copiesError}</div>
                    </c:if>
                </div>

                <div class="mb-3">
                    <label class="form-label">Available Copies</label>
                    <input type="number" class="form-control" name="NewAvailable_copies" value="${available_copies}"/>

                    <c:if test="${copiesError  != null}">
                        <div class="text-danger">${copiesError}</div>
                    </c:if>
                </div>

                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <select class="form-select" name="NewStatus">
                        <option value="active" ${status == 'active' ? 'selected' :''}>Active</option>
                        <option value="notActive" ${status == 'notActive' ? 'selected' :''}>Not Active</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Upload New Image (Optional)</label>
                    <input type="file" class="form-control" name="NewImage" accept="image/*">
                    <c:if test="${url != null}">
                        Current Book Image: <img src="${url}" alt="Current Book Image" style="max-width: 150px ; height: auto ; border: 1px solid ; border-radius: 5px ; padding: 5px"/>
                    </c:if>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea class="form-control" name="NewDescription" rows="3">${description}</textarea>
                </div>

                <div class="d-flex justify-content-between">
                    <a href="BookListController" class="btn btn-secondary"><i class="fas fa-arrow-left">Back</i></a>
                    <button type="submit" name="action" value="updateBook" class="btn btn-primary">
                        Update Book
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
