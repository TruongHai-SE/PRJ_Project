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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HONG MINH
 */
public class UpdateSystemConfigController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSystemConfigController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSystemConfigController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SystemConfigDAO scDao = new SystemConfigDAO();
        SystemConfig systemConfig = scDao.getSystemConfigByID(id);
        request.setAttribute("config_key", systemConfig.getConfig_key());
        request.setAttribute("config_value", systemConfig.getConfig_value());
        request.setAttribute("description", systemConfig.getDescription());
        request.getRequestDispatcher("updateSystemConfig.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        
        
        SystemConfigDAO scDao = new SystemConfigDAO();
        SystemConfig sc = new SystemConfig();

        // Lay du lieu
        int id = Integer.parseInt(request.getParameter("id"));
        String config_key = request.getParameter("NewConfig_key");
        String config_value = request.getParameter("NewConfig_value");
        String description = request.getParameter("NewDescription");

        // Luu du lieu vao form
        request.setAttribute("config_key", config_key);
        request.setAttribute("config_value", config_value);
        request.setAttribute("description", description);

        scDao.updateSystemConfig(id,config_key, config_value, description);
        response.sendRedirect("SystemConfigListController");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
