<%-- 
    Document   : borrowHistory
    Created on : Jul 14, 2025, 7:41:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Book Borrow History</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body style="margin-top: 100px">
        <jsp:include page="header.jsp" />

        <div class="container mt-5">
            <h2>Book Borrow History</h2>
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

            <c:if test="${not empty requestScope.borrowHistory}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên sách</th>
                            <th>Ngày mượn</th>
                            <th>Hạn trả</th>
                            <th>Ngày trả</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="record" items="${requestScope.borrowHistory}" varStatus="loop">
                            <tr>
                                <td>${loop.count}</td>
                                <td>${record.bookTitle}</td>
                                <td>${record.borrowDate}</td>
                                <td>${record.dueDate}</td>
                                <td>${record.returnDate}</td>
                                <td>${record.status}</td>
                                <td>
                                    <c:if test="${record.status == 'borrowed'}">
                                        <form action="MainController" method="post">
                                            <input type="hidden" name="bookId" value="${record.bookId}">
                                            <input type="submit" name="action" value="Return" class="btn btn-primary">
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty requestScope.borrowHistory}">
                <p>You haven't borrowed any books yet. Would you like to <a href="index.jsp">browse some books</a>?</p>
            </c:if>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>