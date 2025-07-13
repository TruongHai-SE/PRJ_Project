<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/forms.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="wrapper">
        <form class="form-register" action="MainController" method="post">
            <h2>Login</h2>
            <div class="input-field">
                <input type="text" name="email" placeholder=" " required>
                <label>Enter your email</label>
            </div>
            <div class="input-field">
                <input type="password" name="password" placeholder=" " required>
                <label>Enter your password</label>
            </div>
            <div class="forget">
                <label>
                    <input type="checkbox" id="remember" name="remember"> Remember me
                </label>
                <a href="#">Forget Password?</a>
            </div>
            <button class="button" type="submit" name="action" value="Login">Login</button>
            <div class="login">
                <p>Have no account? <a href="register.jsp">Register</a></p>
            </div>
            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.ERROR}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>