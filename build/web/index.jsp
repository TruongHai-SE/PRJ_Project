<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!--        <link rel="stylesheet" href="css/style.css">-->

        <style>

            .welcome-banner {
                background-image: url('picture/Thu-vien-FPTU-TP.-HCM-png.avif');
                background-size: cover;
                background-position: center;
                height: 500px;
                position: relative;
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
            }

            .welcome-banner .overlay {
                background-color: rgba(245, 246, 250, 0.65);
                padding: 40px 20px;
                width: 100%;
                height: 150px;
                border-radius: 10px;
                text-align: center;
                position: relative;
            }

            .welcome-banner .notifi-overlay {
                position: absolute;
                top: 20px;
                width: 100%;
                z-index: 10;
                text-align: start;
            }



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

    </head>
    <body>
        <jsp:include page="header.jsp" />



        <div class="container-fluid text-center mt-3 welcome-banner">
            <div class="container-fluid text-center mt-3 welcome-banner">
                <c:if test="${not empty msg}">
                    <div class="notifi-overlay">
                        <div class="container pt-3">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>⚠️ Notification:</strong> ${requestScope.msg}!
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!--                <div class="overlay">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginedUser && empty sessionScope.welcomeShown}">
                        <h2>Welcome, ${sessionScope.loginedUser.name}!</h2>
                        <p>Your email: ${sessionScope.loginedUser.email}</p>
                        <%
                            session.setAttribute("welcomeShown", true);
                        %>
                    </c:when>

                    <c:otherwise>
                        <h2>Welcome to our library system!</h2>
                        <p>Please <a href="login.jsp">login</a> to access more features.</p>
                    </c:otherwise>
                </c:choose>
            </div>-->
            </div>

        </div>

        <div class="ad mt-5">
            <jsp:include page="advertisement.jsp" />
        </div>


        <div>
            <h4 class="text-center mb-4 mt-5 fw-semibold" style="color: orange">Newly updated books</h4>



            <c:if test="${not empty newestImportedBook}">
                <div class="container mt-4">


                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                        <c:forEach var="book" items="${newestImportedBook}">
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


        </div>


        <div>
            <jsp:include page="footer.jsp" />
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>