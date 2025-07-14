<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Kết quả tìm kiếm sách</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                margin-top: 100px !important;
                padding-top: 0 !important;
                background-color: #f8f9fa;
            }

            .search-results {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            .book-box {
                background-color: white;
                border: 2px solid #e0e0e0;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                margin-bottom: 20px;
                display: flex;
                align-items: flex-start;
                transition: all 0.3s ease;
            }

            .book-box:hover {
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
                border-color: #007bff;
                transform: translateY(-2px);
            }

            .book-image {
                width: 120px;
                height: 160px;
                background-color: #f8f9fa;
                border-radius: 8px;
                margin-right: 20px;
                flex-shrink: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 12px;
                color: #666;
                border: 2px solid #e0e0e0;
                overflow: hidden;
            }

            .book-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 6px;
            }

            .book-content {
                flex: 1;
                display: flex;
                flex-direction: column;
                height: 160px;
            }

            .book-info {
                flex: 1;
            }

            .book-title {
                font-weight: bold;
                font-size: 1.3rem;
                margin-bottom: 12px;
                color: #333;
                line-height: 1.4;
            }

            .book-title a {
                text-decoration: none;
                color: inherit;
            }

            .book-details {
                margin-bottom: 8px;
                color: #555;
                font-size: 0.95rem;
            }

            .book-details strong {
                color: #333;
            }

            .book-actions {
                display: flex;
                flex-direction: column;
                gap: 8px;
                min-width: 120px;
                margin-left: 20px;
            }

            .btn-borrow {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 16px;
                border-radius: 6px;
                font-weight: 500;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                text-decoration: none;
                text-align: center;
            }

            .btn-borrow:hover {
                background-color: #0056b3;
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(0, 123, 255, 0.3);
            }

            .btn-cart {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 16px;
                border-radius: 6px;
                font-weight: 500;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                text-decoration: none;
                text-align: center;
            }

            .btn-cart:hover {
                background-color: #0056b3;
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(0, 123, 255, 0.3);
            }

            .btn-disabled {
                background-color: #6c757d;
                border: none;
                color: white;
                padding: 10px 16px;
                border-radius: 6px;
                font-weight: 500;
                font-size: 0.9rem;
                cursor: not-allowed;
            }

            .btn-login {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 16px;
                border-radius: 6px;
                font-weight: 500;
                font-size: 0.9rem;
                transition: all 0.3s ease;
                text-decoration: none;
                text-align: center;
            }

            .btn-login:hover {
                background-color: #0056b3;
                transform: translateY(-1px);
                box-shadow: 0 2px 4px rgba(0, 123, 255, 0.3);
            }

            .no-results {
                text-align: center;
                padding: 40px;
                color: #666;
                font-size: 1.1rem;
            }

            .results-header {
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 2px solid #e0e0e0;
            }

            .results-header h2 {
                color: #333;
                font-weight: 600;
                margin-bottom: 0;
            }

            .available-count {
                color: #28a745;
                font-weight: 600;
            }

            .unavailable-count {
                color: #dc3545;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="search-results">
            <div class="results-header">
                <h2>Kết quả tìm kiếm</h2>
                <!-- Debug info -->
                <small style="color: #666;">
                    Search key: ${requestScope.searchKey} | 
                    Results count: ${requestScope.RESULT != null ? requestScope.RESULT.size() : 0}
                </small>
            </div>

            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${requestScope.ERROR}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty requestScope.MSG}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${requestScope.MSG}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty requestScope.RESULT}">
                <div class="results-container">
                    <c:forEach var="book" items="${requestScope.RESULT}" varStatus="loop">
                        <div class="book-box">
                            <div class="book-image">
                                <c:if test="${not empty book.url}">
                                    <a href="MainController?action=BookDetail&bookId=${book.id}">
                                        <img src="${book.url}" alt="${book.title}" onerror="this.style.display='none'; this.parentElement.innerHTML='<span>No Image</span>';">
                                    </a>
                                </c:if>
                                <c:if test="${empty book.url}">
                                    <span>No Image</span>
                                </c:if>
                            </div>

                            <div class="book-content">
                                <div class="book-info">
                                    <div class="book-title">
                                        <a href="MainController?action=BookDetail&bookId=${book.id}">
                                            ${book.title}
                                        </a>
                                    </div>                                <div class="book-details"><strong>Tác giả:</strong> ${book.author}</div>
                                    <div class="book-details"><strong>Thể loại:</strong> ${book.category}</div>
                                    <div class="book-details">
                                        <strong>Số lượng còn lại:</strong> 
                                        <span class="${book.available_copies > 0 ? 'available-count' : 'unavailable-count'}">
                                            ${book.available_copies}
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="book-actions">
                                <c:if test="${not empty sessionScope.loginedUser}">
                                    <c:if test="${book.available_copies > 0}">
                                        <form action="MainController" method="post" style="margin: 0;">
                                            <input type="hidden" name="bookId" value="${book.id}">
                                            <input type="submit" name="action" value="Borrow" class="btn-borrow">
                                        </form>
                                    </c:if>
                                    <c:if test="${book.available_copies <= 0}">
                                        <button class="btn-disabled" disabled>Hết sách</button>
                                    </c:if>
                                    <form action="MainController" method="post" style="margin: 0;">
                                        <input type="hidden" name="bookId" value="${book.id}">
                                        <input type="submit" name="action" value="Add to Cart" class="btn-cart">
                                    </form>
                                </c:if>
                                <c:if test="${empty sessionScope.loginedUser}">
                                    <a href="login.jsp" class="btn-login">Đăng nhập để mượn</a>
                                    <a href="login.jsp" class="btn-login">Đăng nhập để thêm vào giỏ</a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <c:if test="${empty requestScope.RESULT}">
                <div class="no-results">
                    <i class="fas fa-search" style="font-size: 3rem; color: #ccc; margin-bottom: 20px;"></i>
                    <p>Không tìm thấy sách nào phù hợp với từ khóa tìm kiếm.</p>
                    <p><small>Hoặc có thể dữ liệu chưa được tải.</small></p>
                </div>
            </c:if>

            <!-- Debug: Show all request attributes -->
            <c:if test="${param.debug == 'true'}">
                <div style="background: #f8f9fa; padding: 10px; margin: 10px 0; border: 1px solid #ddd;">
                    <h5>Debug Info:</h5>
                    <p>Search Result: ${requestScope.RESULT}</p>
                    <p>Search Key: ${requestScope.searchKey}</p>
                    <p>Error: ${requestScope.ERROR}</p>
                    <p>Message: ${requestScope.MSG}</p>
                </div>
            </c:if>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>