/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dto.Account;
import dto.Book;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class UpdateAccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get book by ID
        int id = Integer.parseInt(request.getParameter("accountID"));
        AccountDAO accDao = new AccountDAO();
        Account account = accDao.getAccountByID(id);
        request.setAttribute("account", account);
        request.setAttribute("name", account.getName());
        request.setAttribute("email", account.getEmail());
        request.setAttribute("password", account.getPassword());
        request.setAttribute("role", account.getRole());
        request.setAttribute("status", account.getStatus());
        request.getRequestDispatcher("updateAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        AccountDAO accDao = new AccountDAO();
        Account acc = new Account();

        // Lay du lieu 
        int id = Integer.parseInt(request.getParameter("accountID"));
        String name = request.getParameter("NewName");
        String email = request.getParameter("NewEmail");
        String password = request.getParameter("NewPassword");
        String role = request.getParameter("NewRole");
        String status = request.getParameter("NewStatus");

        // Gan lai du lieu cho form
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("password", password);
        request.setAttribute("role", role);
        request.setAttribute("status", status);

        accDao.updateAccount(id, name , email , password, role, status);
        response.sendRedirect("AccountListController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
