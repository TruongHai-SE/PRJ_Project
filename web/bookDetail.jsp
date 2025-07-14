<%-- 
    Document   : bookDetail
    Created on : 23-Jun-2025, 04:15:27
    Author     : xuann
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${book.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
        <c:if test="${not empty requestScope.ERROR}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${requestScope.ERROR}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.msg}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${requestScope.msg}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="${book.url}" alt="${book.title}" class="book-img img-fluid" />
            </div>
            <div class="col-md-8">
                <h1 class="book-title">${book.title}</h1>
                <p><span class="book-label">Tác giả:</span> ${book.author}</p>
                <p><span class="book-label">Thể loại:</span> ${book.category}</p>
                <p><span class="book-label">Năm xuất bản:</span> ${book.published_year}</p>
                <p><span class="book-label">ISBN:</span> ${book.isbn}</p>
                <p><span class="book-label">Số lượng:</span> ${book.total_copies} bản</p>
                <p><span class="book-label">Còn lại:</span> ${book.available_copies} bản</p>
                <p><span class="book-label">Trạng thái:</span> ${book.status}</p>
                <c:if test="${not empty sessionScope.loginedUser}">
                    <c:if test="${book.available_copies > 0}">
                        <form action="MainController" method="post">
                            <input type="hidden" name="bookId" value="${book.id}">
                            <input type="submit" name="action" value="Borrow" class="btn btn-primary">
                        </form>
                    </c:if>
                    <c:if test="${book.available_copies <= 0}">
                        <button class="btn btn-secondary" disabled>Không có sách</button>
                    </c:if>
                </c:if>
                <c:if test="${empty sessionScope.loginedUser}">
                    <p><a href="login.jsp" class="btn btn-primary">Đăng nhập để mượn sách</a></p>
                </c:if>
            </div>
        </div>
        <div class="row book-desc">
            <div class="col-12">
                <h4>Mô tả nội dung</h4>
                <p>${book.description}</p>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>