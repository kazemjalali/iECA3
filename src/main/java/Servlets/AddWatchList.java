package Servlets;

import Model.WatchList;
import Storage.Storage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddWatchList", value = "/AddWatchList")
public class AddWatchList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(Storage.Database.CurrentUser == null)
            response.sendRedirect("/iECA3_war_exploded/login.jsp");

        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        try {
            Storage.Database.AddWatchList(new WatchList(Storage.Database.CurrentUser.email, movie_id));
            response.sendRedirect("/iECA3_war_exploded/watchlist.jsp");

        } catch (Exception e) {
            response.sendRedirect("/iECA3_war_exploded/error.jsp?error=" + e.getMessage());
        }
    }
}
