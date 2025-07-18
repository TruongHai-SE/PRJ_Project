/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.SystemConfigDAO;
import dto.SystemConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HONG MINH
 */
@WebServlet(name = "AddSystemConfigController", urlPatterns = {"/AddSystemConfigController"})
public class AddSystemConfigController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSystemConfigController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSystemConfigController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        SystemConfigDAO scDao = new SystemConfigDAO();
        SystemConfig sc = new SystemConfig();

        // Lay du lieu
        String config_key = request.getParameter("config_key");
        String config_value = request.getParameter("config_value");
        String description = request.getParameter("description");

        // Luu du lieu vao form
        request.setAttribute("config_key", config_key);
        request.setAttribute("config_value", config_value);
        request.setAttribute("description", description);

        if (config_key == null) {
            request.setAttribute("config_keyError", "Please Enter Config Key");
            return;
        }
        if (config_value == null) {
            request.setAttribute("config_valueError", "Please Enter Config Value");
            return;
        }
        
        scDao.addSystemConfig(config_key, config_value, description);
        response.sendRedirect("SystemConfigListController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
