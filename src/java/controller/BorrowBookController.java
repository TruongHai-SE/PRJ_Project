/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.BorrowDAO;
import dto.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class BorrowBookController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("loginedUser") == null) {
                request.setAttribute("ERROR", "Vui lòng đăng nhập trước khi mượn sách");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            User user = (User) session.getAttribute("loginedUser");
            String bookIdStr = request.getParameter("bookId");
            String source = request.getParameter("source");

            if (bookIdStr == null || bookIdStr.trim().isEmpty()) {
                request.setAttribute("ERROR", "ID sách không hợp lệ");
                if ("borrowHistory".equals(source)) {
                    BorrowDAO borrowDAO = new BorrowDAO();
                    request.setAttribute("borrowHistory", borrowDAO.getBorrowHistory(user.getId()));
                    request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("mistake.jsp").forward(request, response);
                }
                return;
            }

            int bookId = Integer.parseInt(bookIdStr);
            BorrowDAO borrowDAO = new BorrowDAO();
            BookDAO bookDAO = new BookDAO();

            if (bookDAO.getBook(bookId) == null) {
                request.setAttribute("ERROR", "Sách không tồn tại");
                if ("borrowHistory".equals(source)) {
                    request.setAttribute("borrowHistory", borrowDAO.getBorrowHistory(user.getId()));
                    request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("mistake.jsp").forward(request, response);
                }
                return;
            }

            if (borrowDAO.hasPendingBorrow(user.getId(), bookId)) {
                request.setAttribute("ERROR", "Bạn đã có đơn mượn đang chờ hoặc đang mượn cuốn sách này.");
                if ("borrowHistory".equals(source)) {
                    request.setAttribute("borrowHistory", borrowDAO.getBorrowHistory(user.getId()));
                    request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("bookDetail.jsp?bookId=" + bookId).forward(request, response);
                }
                return;
            }

            boolean success = borrowDAO.borrowBook(user.getId(), bookId);
            if (success) {
                request.setAttribute("msg", "Yêu cầu mượn sách đã được gửi, đang chờ duyệt.");
                if ("borrowHistory".equals(source)) {
                    request.setAttribute("borrowHistory", borrowDAO.getBorrowHistory(user.getId()));
                    request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("ERROR", "Hiện không còn sách khả dụng. Vui lòng thử lại sau.");
                if ("borrowHistory".equals(source)) {
                    request.setAttribute("borrowHistory", borrowDAO.getBorrowHistory(user.getId()));
                    request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("bookDetail.jsp?bookId=" + bookId).forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("mistake.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles book borrowing";
    }
}
