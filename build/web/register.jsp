<%-- 
    Document   : index
    Created on : 17-Jun-2025, 14:10:36
    Author     : xuann
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="style.css">
    </head>

    <body class="register-page">


        <div class="wrapper">
            <form class="form-register" action="MainController"  method="post">
                <h2>Register</h2>
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
                    <input type="password" name ="confirm" required>
                    <label>Confirm your password</label>
                </div>
                <button class="btn btn-primary button" type="submit" name="action" value="register">Register</button>
                <div class="login">
                    <p>Have an account? <a href="login.jsp">Login</a></p>
                </div>
            </form>
        </div>


    </body>
</html>
