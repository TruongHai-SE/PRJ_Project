/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.AccountDAO;
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
public class UpdateStatusController extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStatusController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusController at " + request.getContextPath () + "</h1>");
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
        try {
            // lay du lieu 
            int accountID = Integer.parseInt(request.getParameter("accountID"));
            String currStatus = request.getParameter("currentStatus");
         
            // xac dinh trang thai moi : neu active thi chuyen thanh block va nguoc lai
            String newStatus = currStatus.equalsIgnoreCase("active") ? "blocked" : "active";
            
            AccountDAO accDao = new AccountDAO();
            accDao.updateAccountStatus(accountID, newStatus);
            
            response.sendRedirect("AccountListController");
        } catch (Exception e) {
            e.printStackTrace();   
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
