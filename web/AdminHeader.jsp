<%-- 
    Document   : AdminHeader
    Created on : Jul 17, 2025, 7:42:21 PM
    Author     : HONG MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <title>Admin Header</title>
        <style>
            .navbar-custom {
                background-color: #03296B;
            }
            .navbar-custom .nav-link,
            .navbar-custom .navbar-brand {
                color: white;
            }
            .navbar-custom .nav-link:hover {
                color: #ffc107;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">ADMIN SYSTEM</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="AdminDashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="SystemConfigListController">System Config</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="BookListController">BookList</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AccountListController">Accounts</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
