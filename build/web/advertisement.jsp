<%-- 
    Document   : advertisement
    Created on : 22-Jun-2025, 02:35:50
    Author     : xuann
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@page import="dao.BookDAO" %>


<c:if test="${not empty recentSearch}">
    <h4>Might you like</h4>
    
            <table border="1" style="border-collapse: collapse; width: 80%; margin: 0px 70px" >
                <tr style="text-align: center">
                    <th>No.</th>
                    <th>Book</th>
                    <th></th>
                </tr>

                <c:forEach var="book" items="${recentSearch}" varStatus="loop">
                    <tr>
                        <td style="text-align: center">${loop.count}</td>
                        <td style="padding: 10px;">
                            <div style="display: flex; align-items: center; gap: 20px">
                                <a href="MainController?action=BookDetail&bookId=${book.id}">
                                    <img src="${book.url}" alt="Book image" width="150px" height="150px">
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