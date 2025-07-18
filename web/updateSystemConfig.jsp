<%-- 
    Document   : updateSystemConfig
    Created on : Jul 17, 2025, 10:17:16 PM
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
        <title>Update System Config</title>
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }
            .form-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 700px;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <div class="form-container">
            <h3 class="text-primary mb-4"><i class="fas fa-edit">Update System Config</i></h3>
            <form class="MainController" method="post">
                <input type="hidden" name="id" value="${systemConfig.id}"/>

                <div class="mb-3">
                    <label for="config_key" class="form-label">Config Key</label>
                    <input type="text" class="form-control" id="config_key" name="NewConfig_key" value="${config_key}" required>

                    <c:if test="${config_keyError != null}">
                        <div class="text-danger">${config_keyError}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="config_value" class="form-label">Config Value</label>
                    <input type="text" class="form-control" id="config_value" name="NewConfig_value" value="${config_value}" required>
                    <c:if test="${config_valueError != null}">
                        <div class="text-danger">${config_valueError}</div>
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <input type="text" class="form-control" id="description" name="NewDescription" value="${description}">
                </div>

                <div class="d-flex justify-content-between">
                    <a href="SystemConfigListController" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
                    <button type="submit" name="action" value="updateSystemConfig" class="btn btn-success" >
                        <i class="fas fa-plus"></i> Update System Config
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
