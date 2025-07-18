<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<c:if test="${empty sessionScope.loginedUser}">
    <c:set var="ERROR" value="Please login first" scope="request"/>
    <jsp:forward page="login.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Change Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="register-page">
    <jsp:include page="header.jsp" />

    <div class="wrapper">
        <form class="form-register" action="MainController" method="post" accept-charset="UTF-8">
            <h2>Change Profile</h2>

            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.ERROR}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty requestScope.msg}">
                <div class="alert alert-success" role="alert">
                    ${requestScope.msg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="input-field">
                <input type="text" name="name" value="${sessionScope.loginedUser.name}" required placeholder=" ">
                <label>Enter new name</label>
            </div>

            <div class="input-field">
                <input type="password" name="password" placeholder=" ">
                <label>Enter new password (optional)</label>
            </div>

            <div class="input-field">
                <input type="password" name="confirm" placeholder=" ">
                <label>Confirm password</label>
            </div>

            <button class="button" type="submit" name="action" value="ChangeProfile">Update</button>

            <div class="login">
                <p><a href="index.jsp">Back to Home</a></p>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>