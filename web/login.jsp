<%-- 
    Document   : login
    Created on : 10-Jul-2025, 19:49:38
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="register-page">
        <!-- Include header -->
        <jsp:include page="header.jsp" />


        <div class="wrapper">
            <form class="form-register" action="MainController"  method="post">
                <h2>Login</h2>
                <div class="input-field">
                    <input type="text" name="name" required>
                    <label>Enter your Username</label>
                </div>
                <div class="input-field">
                    <input type="password" name="password" required>
                    <label>Enter your password</label>
                </div>
                <div class="forget">
                    <label for="remember">
                        <input type="checkbox" id="remember">
                        <span>Remember me</span>
                    </label>
                    <a href="#">Forgot password?</a>
                </div>
                <button class="btn btn-primary button" type="submit" name="action" value="Login">Login</button>
                <div class="login">
                    <p>Have no an account? <a href="register.jsp">Register</a></p>
                </div>
            </form>
        </div>


    </body>
</html>
