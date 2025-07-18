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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author HONG MINH
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)

public class AddBookController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        BookDAO bookDao = new BookDAO();
        Book b = new Book();

        // Lay du lieu 
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        String url = request.getParameter("url");
        String description = request.getParameter("description");

        // Gan lai du lieu cho form
        request.setAttribute("title", title);
        request.setAttribute("author", author);
        request.setAttribute("isbn", isbn);
        request.setAttribute("category", category);
        request.setAttribute("status", status);
        request.setAttribute("description", description);

        if (isbn == null || !isbn.matches("\\d{13}")) {
            request.setAttribute("isbnError", "ISBN must be exactly 13 digits.");
            request.getRequestDispatcher("addBook.jsp").forward(request, response);
            return;
        }
        if (bookDao.getBookByISBN(isbn) != null) {
            request.setAttribute("isbnError", "This ISBN already exists in the system.");
            request.getRequestDispatcher("addBook.jsp").forward(request, response);
            return;
        }

        int published_year = 0;
        int total_copies = 0;
        int available_copies = 0;
        try {
            published_year = Integer.parseInt(request.getParameter("published_year"));
            total_copies = Integer.parseInt(request.getParameter("total_copies"));
            available_copies = Integer.parseInt(request.getParameter("available_copies"));

            request.setAttribute("published_year", published_year);
            request.setAttribute("total_copies", total_copies);
            request.setAttribute("available_copies", available_copies);

            if (available_copies > total_copies) {
                request.setAttribute("copiesError", "Available copies cannot be greater than total copies.");
                request.getRequestDispatcher("addBook.jsp").forward(request, response);
                return;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("copiesError", "Number Format is invalid! Please enter number");
            request.getRequestDispatcher("addBook.jsp").forward(request, response);
            return;
        }

        // Lay anh tu form
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // ten file goc

        // Duong dan luu anh
        String uploadDir = getServletContext().getRealPath("picture");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs(); // create thu muc neu chua ton tai
        }
        //Save picture vao folder
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadDir + File.separator + fileName;
            filePart.write(filePath);
        }

        // Gan duong dan luu DB 
        String imageURL = "picture/" + fileName;

        bookDao.addBook(title, author, isbn, category, published_year, total_copies, available_copies, status, imageURL, description);
        response.sendRedirect("mistake.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
