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
 * @author ADMIN
 */
public class ChangeProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("loginedUser") == null) {

                request.setAttribute("error", "Please login first");

                request.setAttribute("ERROR", "Please login first");

                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            User user = (User) session.getAttribute("loginedUser");
            
            // Nếu là GET request, chỉ hiển thị form
            if ("GET".equalsIgnoreCase(request.getMethod())) {
                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                return;
            }
            
            // Nếu là POST request, xử lý update
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");

            // Validate input
            if (name == null || name.trim().isEmpty()) {

                request.setAttribute("error", "Name cannot be empty");

                request.setAttribute("ERROR", "Name cannot be empty");

                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                return;
            }
            
            if (password == null || password.trim().isEmpty()) {

                request.setAttribute("error", "Password cannot be empty");

                request.setAttribute("ERROR", "Password cannot be empty");

                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                return;
            }

            if (!password.equals(confirm)) {

                request.setAttribute("error", "Confirm password is not correct");

                request.setAttribute("ERROR", "Confirm password is not correct");

                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                return;
            }

            UserDAO d = new UserDAO();
            int result = d.updateUser(user.getId(), name.trim(), password);

            if (result == 1) {
                user.setName(name.trim());
                user.setPassword(password);
                session.setAttribute("user", user);
                request.setAttribute("msg", "Profile updated successfully");
                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
            } else {

                request.setAttribute("error", "Update failed. Please try again.");

                request.setAttribute("ERROR", "Update failed. Please try again.");

                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // For debugging

            request.setAttribute("error", "Something went wrong: " + e.getMessage());

            request.setAttribute("ERROR", "Something went wrong: " + e.getMessage());

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
        return "Handles user profile changes";
    }
}