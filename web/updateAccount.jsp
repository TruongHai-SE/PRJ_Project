<%-- 
    Document   : updateAccount
    Created on : Jul 18, 2025, 12:20:20 PM
    Author     : HONG MINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="AdminHeader.jsp" %>
        <div class="container mt-5">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Update Account</h4>
                </div>
                <div class="card-body">
                    <form action="MainController" method="post">
                        <input type="hidden" name="accountID" value="${account.id}"/>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="NewName" value="${name}">
                            <c:if test="${nameError != null}">
                                <div class="text-danger">${nameError}</div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="NewEmail" value="${email}">
                            <c:if test="${emailError != null}">
                                <div class="text-danger">${emailError}</div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="NewPassword" value="${password}">
                            <c:if test="${passwordError != null}">
                                <div class="text-danger">${passwordError}</div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-select" id="role" name="NewRole" >
                                <option value="user" ${role == 'user' ? 'selected' : ''}>User</option>
                                <option value="admin" ${role == 'admin' ? 'selected' : ''}>Admin</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="NewStatus" >
                                <option value="active" ${status == 'active' ? 'selected' : ''}>Active</option>
                                <option value="blocked" ${status == 'blocked' ? 'selected' : ''}>Blocked</option>
                            </select>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="AccountListController" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back</a>
                            <button type="submit" name="action" value="updateAccount" class="btn btn-primary">
                                Update Account
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
