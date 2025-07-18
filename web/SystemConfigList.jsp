<%-- 
    Document   : SystemConfig
    Created on : Jul 17, 2025, 8:20:58 PM
    Author     : HONG MINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <title>System Config List</title>
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
            .action-btn {
                padding: 4px 10px;
                font-size: 14px;
            }
            .action-btn.update {
                background-color: #ffc107;
                color: white;
                border: none;
            }
            .action-btn.delete {
                background-color: #dc3545;
                color: white;
                border: none;
            }
            .action-btn:hover {
                opacity: 0.9;
            }
            .update-form{
                display: inline;
            }
        </style>
    </head>

    <body>
        <%@include file="AdminHeader.jsp"%>
        <div class="container-fluid">
            <div class="table-container">
                <h3 class="mb-4 text-primary">Book List</h3>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Config Key</th>
                                <th>Config Value</th>
                                <th>Description</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="systemConfig" items="${systemConfigList}">
                                <tr>
                                    <td>${systemConfig.id}</td>
                                    <td>${systemConfig.config_key}</td>
                                    <td>${systemConfig.config_value}</td>
                                    <td>${systemConfig.description}</td>
                                    <td>
                                        <form action="MainController" method="get" class="update-form">
                                            <input type="hidden" name="id" value="${systemConfig.id}" />
                                            <button type="submit" class="btn action-btn update" name="action" value="updateSystemConfig" >
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </form>  
                                    </td>
                                    <td>                
                                        <form action="MainController" method="post">
                                            <input type="hidden" name="id" value="${systemConfig.id}"/>
                                            <button type="submit" class="btn action-btn delete" name="action" value="deleteSystemConfig">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Add Button -->
                <div class="text-end mt-3">
                    <a href="addSystemConfig.jsp" class="btn btn-success">
                        <i class="fas fa-plus"></i> Add System Config
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
