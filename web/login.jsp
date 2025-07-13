<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="style.css">
</head>
<body class="register-page">
    <jsp:include page="header.jsp" />

    <div class="wrapper mt-5 pt-5">
        <form class="form-register" action="MainController" method="post">
            <h2>Login</h2>

            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.ERROR}
                </div>
            </c:if>

            <div class="input-field">
                <input type="text" name="email" required>
                <label>Enter your email</label>
            </div>

            <div class="input-field">
                <input type="password" name="password" required>
                <label>Enter your password</label>
            </div>

            <div class="forget">
                <label for="remember">
                    <input type="checkbox" id="remember"> Remember me
                </label>
                <a href="#">Forgot password?</a>
            </div>

            <button class="btn btn-primary button" type="submit" name="action" value="Login">Login</button>

            <div class="login">
                <p>Have no account? <a href="register.jsp">Register</a></p>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
