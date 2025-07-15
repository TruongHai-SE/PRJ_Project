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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.ArrayList;

/**
 *
 * @author xuann
 */
public class HomeController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Cookie[] cookies = request.getCookies();
        String currentSearch = null;
        BookDAO d = new BookDAO();
        ArrayList<Book> currentSearchList = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("searchHistory".equalsIgnoreCase(cookie.getName())) {
                    currentSearch = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    break;
                }
            }
        }

        if (currentSearch != null) {
            currentSearchList = d.getBooksByTitle(currentSearch);
            request.setAttribute("recentSearch", currentSearchList);

        }

        try {
            BookDAO dao = new BookDAO();
            ArrayList<Book> listNewestBook = new ArrayList<>();
            listNewestBook = dao.getNewestImportedBook(4);
            request.setAttribute("newestImportedBook", listNewestBook);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi trong quá trình truy xuất dữ liệu từ database");
            request.getRequestDispatcher("misktake.jsp").forward(request, response);
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setCharacterEncoding("UTF-8");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
