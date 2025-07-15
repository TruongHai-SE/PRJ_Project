package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = "HomeController";
            }
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
                case "ChangeProfile":
                    url = "ChangeProfileController";
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
                case "Borrow":
                    url = "BorrowBookController";
                    break;
                case "Return":
                    url = "ReturnBookController";
                    break;
                case "BorrowHistory":
                    url = "BorrowHistoryController";
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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Main Controller";
    }
}