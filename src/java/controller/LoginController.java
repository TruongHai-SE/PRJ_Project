/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import dto.User;
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
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
                request.setAttribute("msg", "Email or password is missing.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            UserDAO d = new UserDAO();
            User user = d.getUser(email, password);

            if (user != null && "active".equalsIgnoreCase(user.getStatus())) {
                HttpSession session = request.getSession();
                session.setAttribute("loginedUser", user);
                session.setAttribute("welcomeShown", false);
                request.setAttribute("msg", "Login successful");
                
                if(user.getRole().equalsIgnoreCase("admin")){
                    response.sendRedirect("AdminDashboard.jsp");
                }else{
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("ERROR", "Email or password is invalid");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("ERROR", "Something went wrong!");
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
        return "Handles user login";
    }// </editor-fold>

}
