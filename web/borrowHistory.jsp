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
                        <c:forEach var="record" items="${borrowHistory}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${record.bookTitle}</td>

                                <c:if test="${record.status == 'pending'}">
                                    <td colspan="3" class="text-center text-muted">Đang xử lý...</td>
                                </c:if>

                                <c:if test="${record.status != 'pending'}">
                                    <td>${record.borrowDate}</td>
                                    <td>${record.dueDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty record.returnDate}">
                                                ${record.returnDate}
                                            </c:when>
                                            <c:otherwise>---</c:otherwise>
                                        </c:choose>
                                    </td>
                                </c:if>                                
                                <td>${record.status}</td>
                                <td>
                                    <c:if test="${record.status == 'borrowed'}">
                                        <form action="MainController" method="post">
                                            <input type="hidden" name="bookId" value="${record.bookId}" />
                                            <button type="submit" name="action" value="Return" class="btn btn-primary">Return</button>
                                        </form>
                                    </c:if>
                                    <c:choose>
                                        <c:when test="${record.status == 'pending' && record.requestType == 'borrow'}">
                                            <span class="text-warning fw-bold">Chờ duyệt đơn mượn</span>
                                        </c:when>
                                        <c:when test="${record.status == 'pending' && record.requestType == 'return'}">
                                            <span class="text-warning fw-bold">Chờ duyệt đơn trả</span>
                                        </c:when>
                                    </c:choose>
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