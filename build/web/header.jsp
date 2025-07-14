<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Header</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .header {
                background-color: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 8px 30px;
                z-index: 1000;
                position: fixed;
                top: 0;
                width: 100%;
            }

            .search-box {
                flex-grow: 1;
                display: flex;
                max-width: 600px;
                margin: 0 150px;
            }

            .search-box input {
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
                width: 400px;
                margin-right: 10px;
                padding: 5px;
            }

            .search-box button {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
                padding: 5px 10px;
                background-color: #dc3545;
                border: none;
                color: white;
            }

            .icon-link {
                color: #555;
                text-decoration: none;
                font-size: 0.9rem;
                margin-left: 20px;
                display: flex;
                align-items: center;
                transition: color 0.3s;
            }

            .icon-link:hover {
                color: #000;
            }

            .icon-link i {
                font-size: 1.2rem;
                margin-right: 5px;
            }

            .dropdown-menu {
                min-width: 10rem;
                display: none;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }

            .dropdown-toggle {
                cursor: pointer;
            }

        </style>
    </head>

    <body>
        <header class="header d-flex align-items-center justify-content-between fixed-top">
            <!-- Logo -->
            <div class="d-flex align-items-center">
                <a href="MainController">
                    <img src="picture/FPT_EDUCATION.png" alt="Logo" style="height: 40px; margin-right: 15px;">
                </a>

                <div class="dropdown me-2">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Open Menu">
                        <i class="fas fa-th-large"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Danh mục 1</a></li>
                        <li><a class="dropdown-item" href="#">Danh mục 2</a></li>
                    </ul>
                </div>

                <!-- Search -->
                <form action="MainController" method="post" class="search-box d-flex">
                    <input class="form-control" type="text" placeholder="Search" name="searchKey" value="${requestScope.searchKey}">
                    <button class="btn btn-danger" type="submit" name="action" value="search"><i class="fas fa-search"></i></button>
                </form>
            </div>

            <!-- Icons -->
            <div class="d-flex align-items-center">
                <a href="#" class="icon-link" aria-label="Notifications">
                    <i class="fas fa-bell"></i>
                    Notification
                </a>
                <a href="#" class="icon-link" aria-label="Cart">
                    <i class="fas fa-shopping-cart"></i>
                    Cart
                </a>

                <c:if test="${empty sessionScope.loginedUser}">
                    <a href="login.jsp" class="icon-link" aria-label="Login">
                        <i class="fas fa-user"></i>
                        Login
                    </a>
                </c:if>

                <c:if test="${not empty sessionScope.loginedUser}">
                    <div class="dropdown">
                        <a href="#" class="icon-link dropdown-toggle" id="accountDropdown" data-bs-toggle="dropdown" aria-expanded="false" aria-label="User Menu">
                            <i class="fas fa-user"></i>
                            ${sessionScope.loginedUser.name}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="accountDropdown">
                            <li><a class="dropdown-item" href="MainController?action=ChangeProfile">Change Profile</a></li>
                            <li><a class="dropdown-item" href="MainController?action=BorrowHistory">Borrow History</a></li>
                            <li><a class="dropdown-item" href="MainController?action=Logout">Logout</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </header>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>