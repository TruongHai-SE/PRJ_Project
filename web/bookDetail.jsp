<%-- 
    Document   : bookDetail
    Created on : 23-Jun-2025, 04:15:27
    Author     : xuann
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${book.title}</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .book-img {
            max-width: 100%;
            border: 1px solid #ccc;
            padding: 5px;
        }
        .book-title {
            font-size: 26px;
            font-weight: bold;
        }
        .book-label {
            font-weight: bold;
        }
        .book-desc {
            margin-top: 30px;
            line-height: 1.8;
        }
    </style>
</head>
<body style="margin-top: 100px">
    <jsp:include page="header.jsp" />
<div class="container mt-5">
    <div class="row">
        <!-- Ảnh sách -->
        <div class="col-md-4 text-center">
            <img src="${book.url}" alt="${book.title}" class="book-img img-fluid" />
        </div>

        <!-- Thông tin sách -->
        <div class="col-md-8">
            <h1 class="book-title">${book.title}</h1>
            <p><span class="book-label">Tác giả:</span> ${book.author}</p>
            <p><span class="book-label">Thể loại:</span> ${book.category}</p>
            <p><span class="book-label">Năm xuất bản:</span> ${book.published_year}</p>
            <p><span class="book-label">ISBN:</span> ${book.isbn}</p>
            <p><span class="book-label">Số lượng:</span> ${book.total_copies} bản</p>
            <p><span class="book-label">Còn lại:</span> ${book.available_copies} bản</p>
            <p><span class="book-label">Trạng thái:</span> ${book.status}</p>

           
             
            <button class="btn btn-danger">Add to Cart</button> 
        </div>
    </div>

    <!-- Mô tả sách -->
    <div class="row book-desc">
        <div class="col-12">
            <h4>Mô tả nội dung</h4>
            <p>${book.description}</p>
        </div>
    </div>
</div>

<!-- Bootstrap JS (tuỳ chọn nếu cần dropdown/modal) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
