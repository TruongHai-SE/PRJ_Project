<%-- 
    Document   : header
    Created on : 11-Jul-2025, 05:23:37
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html>
<html lang="vi">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .header {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 8px 16px;
        }

        .search-box {
            flex-grow: 1;
            display: flex;
            max-width: 600px;
        }

        .search-box input {
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
        }

        .search-box button {
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        .icon-link {
            color: #555;
            text-decoration: none;
            font-size: 0.9rem;
            text-align: center;
            margin-left: 20px;
        }

        .icon-link i {
            font-size: 1.2rem;
            display: block;
        }

        .flag-icon {
            width: 25px;
            height: 17px;
            border-radius: 3px;
            margin-right: 5px;
        }
    </style>



    <header class="header d-flex align-items-center justify-content-between fixed-top" style="padding: 8px 30px">
        <!-- Logo -->
        <div class="d-flex align-items-center">
            <a href="MainController">
               <img src="picture/FPT_EDUCATION.png" alt="Logo" style="height: 40px; margin-right: 15px;">
            </a>

            <div class="dropdown me-2">
                <button class="btn btn-light" data-bs-toggle="dropdown">
                    <i class="fas fa-th-large"></i>
                </button>          
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Danh mục 1</a></li>
                    <li><a class="dropdown-item" href="#">Danh mục 2</a></li>
                </ul>
            </div>

            <!-- Search -->
            <form action="MainController" method="post" class="search-box d-flex" style="margin: 0 150px">
                <input class="form-control" type="text" placeholder="Search" name="searchKey" value="${requestScope.searchKey}" style="width: 400px; margin-right: 10px">
                <button class="btn btn-danger" type="submit" name="action" value="search"><i class="fas fa-search"></i></button>
            </form>
        </div>

        <!-- Icons -->
        <div class="d-flex align-items-center">
            <a href="#" class="icon-link">
                <i class="fas fa-bell"></i>
                Notification
            </a>
            <a href="#" class="icon-link">
                <i class="fas fa-shopping-cart"></i>
                Cart
            </a>
            <a href="#" class="icon-link">
                <i class="fas fa-user"></i>
                Account
            </a>

        </div>
    </header>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>


