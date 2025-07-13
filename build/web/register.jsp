<%-- 
    Document   : register
    Created on : 17-Jun-2025, 14:10:36
    Author     : xuann
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
    </head>

    <body class="register-page">
        <jsp:include page="header.jsp" />

        <div class="wrapper">
            <form class="form-register" action="MainController" method="post">
                <h2>Register</h2>

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
                    <input type="text" name="email" required>
                    <label>Enter your Email</label>
                </div>

                <div class="input-field">
                    <input type="text" name="name" required>
                    <label>Enter your Username</label>
                </div>

                <div class="input-field">
                    <input type="password" name="password" required>
                    <label>Enter your password</label>
                </div>

                <div class="input-field">
                    <input type="password" name="confirm" required>
                    <label>Confirm your password</label>
                </div>

                <button class="btn btn-primary button" type="submit" name="action" value="register">Register</button>


                <div class="login">
                    <p>Have an account? <a href="login.jsp">Login</a></p>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
