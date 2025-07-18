/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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

public class ReturnBookController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loginedUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId(); 
        String bookIdStr = request.getParameter("bookId");

        if (bookIdStr == null || bookIdStr.trim().isEmpty()) {
            request.setAttribute("error", "Thiếu thông tin sách để trả.");
            request.getRequestDispatcher("borrowHistory.jsp").forward(request, response);
            return;
        }

        try {
            int bookId = Integer.parseInt(bookIdStr);
            BorrowDAO dao = new BorrowDAO();
            boolean success = dao.returnBook(userId, bookId);

            if (success) {
                request.setAttribute("msg", "Yêu cầu trả sách đã được gửi. Vui lòng chờ admin duyệt.");
            } else {
                request.setAttribute("ERROR", "Bạn đã gửi yêu cầu trả sách cho cuốn này hoặc có lỗi xảy ra.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("ERROR", "ID sách không hợp lệ.");
        }
        request.getRequestDispatcher("BorrowHistoryController").forward(request, response);
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
        return "ReturnBookController handles return book requests by creating a pending return request.";
    }
}
