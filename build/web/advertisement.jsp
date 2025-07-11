<%-- 
    Document   : advertisement
    Created on : 22-Jun-2025, 02:35:50
    Author     : xuann
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<h4>Might you like</h4>

<c:if test="${not empty sessionScope.searchList}">
    <c:forEach var="book" begin="${fn:length(searchList) - 3}" end="${fn:length(searchList) - 1}" items="${searchList}">
        <p>Tiêu đề: ${book.title}</p>
        <p>Tác giả: ${book.author}</p>
        <p>Thể loại: ${book.category}</p>
        <p>Năm xuất bản: ${book.published_year}</p>
        <p>Số bản có sẵn: ${book.available_copies}</p>
        <img src="${book.url}" alt="Ảnh bìa" width="150"/>
        <hr/>
    </c:forEach>
</c:if>

