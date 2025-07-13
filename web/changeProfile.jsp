<%-- 
    Document   : changeProfile
    Created on : Jul 11, 2025, 8:00:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body class="register-page">

        <jsp:include page="header.jsp" />

        <div class="wrapper">
            <form class="form-register" action="MainController" method="post">
                <h2>Change Profile</h2>

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

                <div class="input-field">
                    <input type="text" name="name" value="${sessionScope.loginedUser.name}" required>
                    <label>Enter new name</label>
                </div>

                <div class="input-field">
                    <input type="password" name="password" required>
                    <label>Enter new password</label>
                </div>

                <div class="input-field">
                    <input type="password" name="confirm" required>
                    <label>Confirm password</label>
                </div>

                <button class="btn btn-primary button" type="submit" name="action" value="ChangeProfile">Cập nhật</button>

                <div class="login">
                    <p><a href="index.jsp">Back to Home</a></p>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
