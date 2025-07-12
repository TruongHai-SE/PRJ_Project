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
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body style="margin: 100px 30px 10px 30px">
        <!-- Include header -->
        <jsp:include page="header.jsp" />
       

        <c:if test="${not empty msg}">
            <div class="container" style="margin-top: 80px">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>⚠️ Notification:</strong> ${requestScope.msg}!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </div>
        </c:if>

        <div class="ad">
            <jsp:include page="advertisement.jsp" />
        </div>







        <!-- Bootstrap 5 JS (bundle gồm cả Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
