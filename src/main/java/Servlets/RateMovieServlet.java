package Servlets;

import Model.Rate;
import Model.WatchList;
import Storage.Storage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "rateMovie", value = "/rateMovie")
public class RateMovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(Storage.Database.CurrentUser == null)
            response.sendRedirect("/iECA3_war_exploded/login.jsp");

        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        int rate = Integer.parseInt(request.getParameter("quantity"));
        try {
            Storage.Database.AddRateMovie(new Rate(Storage.Database.CurrentUser.email, movie_id, rate));
            response.sendRedirect("/iECA3_war_exploded/movie.jsp");

        } catch (Exception e) {
            response.sendRedirect("/iECA3_war_exploded/error.jsp?error=" + e.getMessage());
        }
    }
}
