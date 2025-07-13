<%-- 
    Document   : searchBook
    Created on : 23-Jun-2025, 01:56:38
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search result</title>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="header.jsp" />



        <div style="margin: 100px 70px 20px 70px">
            <c:if test="${not empty requestScope.searchKey}">
                <h3>The result for: <strong>${searchKey}</strong></h3>
            </c:if>
            <c:if test="${not empty MSG}">
                <p style="color: red">${MSG}</p>
            </c:if>
        </div>

        <c:if test="${not empty requestScope.RESULT}">
            <table border="1" style="border-collapse: collapse; width: 80%; margin: 0px 70px" >
                <tr style="text-align: center">
                    <th>STT</th>
                    <th>Book</th>
                    <th></th>
                </tr>

                <c:forEach var="book" items="${requestScope.RESULT}" varStatus="loop">
                    <tr>
                        <td style="text-align: center">${loop.count}</td>
                        <td style="padding: 10px;">
                            <div style="display: flex; align-items: center; gap: 20px">
                                <a href="MainController?action=BookDetail&bookId=${book.id}">
                                    <img src="${book.url}" alt="Book image" width="100px" height="150px">
                                </a>

                                <div style="line-height: 1.85; font-size: 16px">
                                    Title: <strong>${book.title}</strong><br>
                                    Author: ${book.author}<br>
                                    Category: ${book.category}<br>
                                    Year of publication: ${book.published_year}<br>
                                    Number of copies available: ${book.available_copies}
                                </div>

                            </div>
                        </td>

                        <td style="text-align: center; gap: 20px">
                            <form>
                                <input type="hidden" name="bookId" value="${book.id}">
                                <c:if test="${book.available_copies > 0}">
                                    <input type="submit" name="action" value="Borrow">
                                    <input type="submit" name="action" value="Add to Cart">
                                </c:if>
                                <c:if test="${book.available_copies <= 0}">
                                    <button type="button" disabled=>No book available</button>
                                </c:if>

                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </c:if>


    </body>
</html>
