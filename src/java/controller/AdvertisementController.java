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
import jakarta.websocket.Session;
import java.util.ArrayList;

/**
 *
 * @author xuann
 */
public class AdvertisementController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        BookDAO d = new BookDAO();
        ArrayList<Book> currentSearchList = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("searchHistory".equalsIgnoreCase(cookie.getName())) {
                    String currentSearch = cookie.getValue();
                    currentSearchList = d.getBooksByTitle(currentSearch);

                }
            }
        }
        if (currentSearchList != null) {
            request.setAttribute("searchHistory", currentSearchList);
            request.getRequestDispatcher("advertisement.jsp").forward(request, response);
        } else {
            request.setAttribute("MSG", "Seach history not found");
            request.getRequestDispatcher("advertisement.jsp").forward(request, response);
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        out.print("<html><body>");

        out.print("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        out.print("<html><body>");

        out.print("</body></html>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
