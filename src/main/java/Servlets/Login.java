package Servlets;

import Model.User;
import Storage.Storage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = Storage.Database.getUserByEmail(email);
        if(user == null)
            response.sendRedirect("/iECA3_war_exploded/error.jsp?error=User Not Found");
        else{
            Storage.Database.CurrentUser = user;
            response.sendRedirect("/iECA3_war_exploded/home.jsp");
        }
    }
}
