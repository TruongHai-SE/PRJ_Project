/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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

    public void processRequest(HttpServletRequest request, HttpServletResponse respone){


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        out.print("<html><body>");
        
        out.print("</body></html>");
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
