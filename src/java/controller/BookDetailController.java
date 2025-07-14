/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dto.Book;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author xuann
 */
public class BookDetailController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String bookId = request.getParameter("bookId");

        if (bookId == null || bookId.trim().isEmpty()) {
            response.sendRedirect("mistake.jsp");
        }
        try {
            int id = Integer.parseInt(bookId);
            BookDAO dao = new BookDAO();
            Book book = dao.getBook(id);

            if (book != null) {
                request.setAttribute("book", book);
                request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Can not found the book");
                request.getRequestDispatcher("bookDetail.jsp").forward(request, response);

            }
        } catch (ServletException | IOException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("mistake.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
