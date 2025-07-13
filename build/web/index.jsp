<%-- 
    Document   : index
    Created on : 18-Jun-2025, 05:30:47
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body style="margin: 100px 30px 10px 30px">
        
        <jsp:include page="header.jsp" />

        
        <c:if test="${not empty msg}">
            <div class="container" style="margin-top: 80px">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>⚠️ Notification:</strong> ${requestScope.msg}!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </c:if>

        
        <div class="container text-center mt-4">
            <c:choose>
                <c:when test="${not empty sessionScope.loginedUser}">
                    <h2>Welcome, ${sessionScope.loginedUser.name}!</h2>
                    <p>Your email: ${sessionScope.loginedUser.email}</p>
                </c:when>
                <c:otherwise>
                    <h2>Welcome to our library system!</h2>
                    <p>Please <a href="login.jsp">login</a> to access more features.</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Advertisement -->
        <div class="ad mt-5">
            <jsp:include page="advertisement.jsp" />
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
