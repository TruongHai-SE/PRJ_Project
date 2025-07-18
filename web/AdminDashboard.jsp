<%-- 
    Document   : admin
    Created on : Jul 14, 2025, 10:39:27 PM
    Author     : HONG MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="css/header.css"/>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8fafc;
                margin: 0;
                height: 100%;
            }
            .container-fluid{
                height: 100%;
                margin: 0;
            }
            .full-height-row {
                height: 100%;
                margin: 0;
            }
            .sidebar {
                background-color: #0b2a83;
                color: white;
                height: 100%;
                padding-top: 20px;
                min-height: 100vh;
            }

            .sidebar h4 {
                text-align: center;
                padding-bottom: 10px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            }

            .sidebar a {
                color: white;
                display: block;
                padding: 12px 20px;
                text-decoration: none;
                transition: background 0.2s;
            }

            .sidebar a:hover {
                background-color: #2563eb;
            }

            .header-bar {
                background-color: #e9ecef;
                padding: 15px 20px;
                margin-bottom: 20px;
                border-radius: 6px;
            }

            .search-box {
                display: flex;
                max-width: 600px;
            }

            .search-box input {
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
                width: 400px;
                padding: 6px 10px;
            }

            .search-box button {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
                padding: 6px 15px;
                background-color: #0b2a83;
                border: none;
                color: white;
                margin-left: 10px;
            }

            .search-box i {
                color: white;
            }

            .content-area {
                min-height: 90vh;
            }

            .main_content{
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row full-height-row">
                <!--Side bar-->
                <div class="sidebar col-md-3 col-lg-2 ">
                    <h4>ADMIN SYSTEM</h4>
                    <a href="AdminDashboard.jsp">DashBoard</a>
                    <a href="MainController?action=systemConfig">System Config</a>
                    <a href="MainController?action=booklist">BookList</a>
                    <a href="MainController?action=accountList">Accounts</a>
                    <a href="MainController?action=Logout">Logout</a>
                </div>

                <!-- Main content -->
                <div class="main_content col-md-9 col-lg-10">
                    <!-- Header -->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <!-- Search -->
                        <form action="MainController" method="post" class="search-box d-flex">
                            <input class="form-control" type="text" placeholder="Search for ..." name="searchKey" value="">
                            <button class="btn btn-danger" type="submit" name="action" value="search"><i class="fas fa-search"></i></button>
                        </form>

                        <!-- Notification + User -->
                        <div class="d-flex align-items-center">
                            <!-- Notification bell -->
                            <a href="#" class="btn btn-light position-relative me-3">
                                <i class="fas fa-bell"></i>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    3
                                    <span class="visually-hidden">unread messages</span>
                                </span>
                            </a>

                            <!-- User info -->
                            <c:if test="${not empty sessionScope.loginedUser}">
                                <div>
                                    <a href="#" class="icon-link dropdown-toggle" id="accountDropdown" data-bs-toggle="dropdown" aria-expanded="false" aria-label="User Menu">
                                        <i class="fas fa-user"></i>
                                        ${sessionScope.loginedUser.name}
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Dynamic content -->

                </div>
            </div>
        </div>

    </body>
</html>
