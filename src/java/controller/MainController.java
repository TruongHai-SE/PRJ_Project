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
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = "AdvertisementController";
            }
//            your code here
            switch (action) {
                case "Login":
                    url = "LoginController";
                    break;
                case "register":
                    url = "RegisterController";
                    break;
                case "Logout":
                    url = "LogoutController";
                    break;
                case "search":
                    url = "SearchBookController";
                    break;
                case "BookDetail":
                    url = "BookDetailController";
                    break;
                case "Delete":
                    url = "DeleteController";
                    break;
                case "AddHouse":
                    url = "AddBookController";
                    break;
//                case "ViewCart":
//                    url = "ViewCartController";
//                    break;
                case "AddToCart":
                    url = "AddtoCartController";
                    break;
                case "Remove":
                    url = "RemoveCartController";
                    break;
                default:
                    throw new AssertionError();
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
