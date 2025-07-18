<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="dao.BookDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
    .book-card {
        transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }

    .book-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .book-img {
        height: 250px;
        object-fit: cover;
    }
</style>

<c:if test="${not empty recentSearch}">
    <div class="container mt-4">
        <h4 class="text-center mb-4 fw-semibold" style="color: orange">You Might Like</h4>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <c:forEach var="book" items="${recentSearch}">
                <div class="col">
                    <div class="card h-200s book-card">
                        <a href="MainController?action=BookDetail&bookId=${book.id}">
                            <img src="${book.url}" class="card-img-top mx-auto d-block book-img" alt="Book image" style="height: 250px; width: 170px;object-fit: contain; padding: 5px ">
                        </a>
                        <div class="card-body d-flex flex-column" style="font-size: 14px">
                            <h6 style="height: 35px; align-content:  center" class="card-title"><strong>${book.title}</strong></h6>
                            <p class="card-text mb-1"><strong>Author:</strong> ${book.author}</p>
                            <p class="card-text mb-1"><strong>Category:</strong> ${book.category}</p>
                            <p class="card-text mb-1"><strong>Year:</strong> ${book.published_year}</p>
                            <p class="card-text"><strong>Available:</strong> ${book.available_copies}</p>
                        </div>
                        <div class="card-footer bg-white border-top-0 pb-3">
                            <form action="MainController" method="post" class="d-flex gap-2">
                                <input type="hidden" name="bookId" value="${book.id}">
                                <c:choose>
                                    <c:when test="${book.available_copies > 0}">
                                        <button type="submit" name="action" value="Borrow" class="btn btn-sm btn-primary flex-fill">Borrow</button>
                                        <button type="submit" name="action" value="Add to Cart" class="btn btn-sm btn-outline-success flex-fill">Add to Cart</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" class="btn btn-sm btn-secondary w-100" disabled>No book available</button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>
