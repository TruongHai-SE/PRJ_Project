<%-- 
    Document   : tets
    Created on : 16-Jul-2025, 23:43:48
    Author     : xuann
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

        <title>Add New Book</title>

        <style>
            body {
                background-color: #f8f9fa;
                padding: 40px;
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
        <div class="form-container">
            <h3 class="text-primary mb-4"><i class="fas fa-book"></i> Add New Book</h3>
            <form action="MainController" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="${title}" required>
                </div>
                <div class="mb-3">
                    <label for="author" class="form-label">Author</label>
                    <input type="text" class="form-control" id="author" name="author" value="${author}" required>
                </div>
                <div class="mb-3">
                    <label for="isbn" class="form-label">ISBN</label>
                    <input type="text" class="form-control" id="isbn" name="isbn" value="${isbn}" required>
                    <c:if test="${isbnError != null}">
                        <div class="text-danger">${isbnError}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="category" class="form-label">Category</label>
                    <input type="text" class="form-control" id="category" name="category" value="${category}">
                </div>
                <div class="mb-3">
                    <label for="published_year" class="form-label">Published Year</label>
                    <input type="number" class="form-control" id="published_year" name="published_year" value="${published_year}">
                </div>
                <div class="mb-3">
                    <label for="total_copies" class="form-label">Total Copies</label>
                    <input type="number" class="form-control" id="total_copies" name="total_copies" value="${total_copies}">
                </div>
                <div class="mb-3">
                    <label for="available_copies" class="form-label">Available Copies</label>
                    <input type="number" class="form-control" id="available_copies" name="available_copies" value="${available_copies}">
                    <c:if test="${copiesError != null}">
                        <div class="text-danger">${copiesError}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status" name="status" value="${status}">
                        <option value="active">Active</option>
                        <option value="notActive">Not Active</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Upload Book Image</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/*">
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" value="${description}" rows="3"></textarea>
                </div>
                <div class="d-flex justify-content-between">
                    <a href="BookListController" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
                    <button type="submit" name="action" value="addBook" class="btn btn-success" >                       
                        <i class="fas fa-plus"></i> Add Book
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
</body>
</html>
