<%-- 
    Document   : bookDetail
    Created on : 23-Jun-2025, 04:15:27
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
        <title>Book detail page</title>
    </head>
    <body>
        <h3>Book detail</h3>
        <c:if test="${not empty requestScope.book}">
            <img src="${book.url}" alt="Book image" width="150px" height="150px">        

            <div style="line-height: 1.85; font-size: 16px">
                Title: <strong>${book.title}</strong><br>
                Author: ${book.author}<br>
                Category: ${book.category}<br>
                Year of publication: ${book.published_year}<br>
                Number of copies available: ${book.available_copies}
            </div>
        </c:if>

            <c:if test="empty book">
                <p style="color: red">Can not found book data</p>
            </c:if>
    </body>
</html>
