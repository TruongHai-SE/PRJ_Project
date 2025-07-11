/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dto.Book;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author xuann
 */
public class SearchBookController extends HttpServlet {

    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("searchKey");
        
        if (title != null && !title.isEmpty()) {

            // create cookie and set time it alive
            cookies(request, response, title);
//            Cookie newCookie = new Cookie("searchHistory", title);
//            newCookie.setMaxAge(86400);
//            response.addCookie(new    Cookie);

            BookDAO d = new BookDAO();
            ArrayList<Book> listBook = d.getBooksByTitle(title);

            if (listBook.isEmpty()) {
                request.setAttribute("MSG", "No results found");
                request.setAttribute("searchKey", title);
                request.getRequestDispatcher("searchBook.jsp").forward(request, response);
            } else {
                request.setAttribute("RESULT", listBook);
                request.setAttribute("searchKey", title);
                request.getRequestDispatcher("searchBook.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("MSG", "No input data");
            request.getRequestDispatcher("searchBook.jsp").forward(request, response);
        }
    }

    void cookies(HttpServletRequest request, HttpServletResponse response, String title) {
    try {
        String oldHistory = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("searchHistory")) {
                    oldHistory = c.getValue();
                    break;
                }
            }
        }

        // Danh sách mới (ban đầu chỉ chứa title hiện tại)
        List<String> keywordList = new ArrayList<>();

        if (oldHistory != null && !oldHistory.isEmpty()) {
            String decoded = URLDecoder.decode(oldHistory, "UTF-8");
            List<String> oldKeywords = new ArrayList<>(Arrays.asList(decoded.split(",")));

            // Loại bỏ nếu đã tồn tại từ trước (case-insensitive)
            oldKeywords.removeIf(kw -> kw.equalsIgnoreCase(title));

            // Thêm từ mới lên đầu danh sách
            keywordList.add(title);
            keywordList.addAll(oldKeywords);

            // Giới hạn 5 từ khóa
            if (keywordList.size() > 5) {
                keywordList = keywordList.subList(0, 5);
            }
        } else {
            keywordList.add(title);
        }

        // Ghép và mã hóa lại
        String newHistory = String.join(",", keywordList);
        String encodedHistory = URLEncoder.encode(newHistory, "UTF-8");

        Cookie newCookie = new Cookie("searchHistory", encodedHistory);
        newCookie.setMaxAge(86400); // 1 ngày
        response.addCookie(newCookie);

    } catch (UnsupportedEncodingException e) {
        e.printStackTrace(); // Có thể log bằng logger thay vì in ra console
    }
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
