<%-- 
    Document   : account
    Created on : Jul 17, 2025, 11:28:49 PM
    Author     : HONG MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <title>Account List</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }
            .table-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 90%;
                margin: 10px auto;
            }
            .table thead th {
                background-color: #0b2a83;
                color: white;
                border: none;
            }
            .table tbody tr {
                transition: background-color 0.2s;
            }
            .table tbody tr:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <div class="container-fluid">
            <div class="table-container">
                <!-- header table -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-primary m-0">Account List</h3>
                    <form class="d-flex" action="MainController" method="get">
                        <input class="form-control me-2" type="search" name="email" placeholder="Search by email" aria-label="Search">
                        <button class="btn btn-primary" type="submit" name="action" value="searchByEmail"><i class="fas fa-search"></i></button>
                    </form>
                </div>

                <!--Account table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty accountList}">
                                    <c:forEach var="account" items="${accountList}">
                                        <tr>
                                            <td>${account.id}</td>
                                            <td>${account.name}</td>
                                            <td>${account.email}</td>
                                            <td>${account.password}</td>
                                            <td>${account.role}</td>
                                            <td>${account.status}</td>
                                            <td>
                                                <!-- action active/blocked -->
                                                <form action="MainController" method="post" style="display: inline">
                                                    <input type="hidden" name="action" value="toggleStatus"/>
                                                    <input type="hidden" name="accountID" value="${account.id}"/>
                                                    <input type="hidden" name="currentStatus" value="${account.status}"/>
                                                    <button type="submit" class="btn btn-sm ${account.status == 'active' ? 'btn-danger' : 'btn-success'}">
                                                        ${account.status == 'active' ? 'Blocked' : 'Active'}
                                                    </button>
                                                </form>
                                            </td>
                                            <td>
                                                <!-- Update -->
                                                <form action="MainController" method="get" style="display: inline">
                                                    <input type="hidden" name="action" value="updateAccount"/>
                                                    <input type="hidden" name="accountID" value="${account.id}"/>
                                                    <button type="submit" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></button>
                                                </form>
                                            </td>
                                            <td>
                                                <!-- Delete -->
                                                <form action="MainController" method="post" style="display: inline">
                                                    <input type="hidden" name="action" value="deleteAccount"/>
                                                    <input type="hidden" name="accountID" value="${account.id}"/>
                                                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="9" class="text-center text-danger">No account found!</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>

                    <c:if test="${isSearching == true}">
                        <div class="d-flex justify-content-between">
                            <a href="SearchByEmailController" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
                        </div>
                    </c:if>
                </div>
                <!-- Add Button -->
                <div class="text-end mt-3">
                    <a href="addAccount.jsp" class="btn btn-success">
                        <i class="fas fa-plus"></i> Add Account
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
