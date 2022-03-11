package Servlets;

import Model.Rate;
import Model.Vote;
import Storage.Storage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "voteComment", value = "/voteComment")
public class VoteCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(Storage.Database.CurrentUser == null)
            response.sendRedirect("/iECA3_war_exploded/login.jsp");

        int form_comment_id = Integer.parseInt(request.getParameter("form_comment_id"));
        int voteValue = Integer.parseInt(request.getParameter("voteValue"));
        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        Vote vote = new Vote(Storage.Database.CurrentUser.email, Integer.valueOf(form_comment_id), voteValue);


        try {
            Storage.Database.AddVote(vote);
            response.sendRedirect("/iECA3_war_exploded/movie.jsp?movie_id=" + movie_id);

        } catch (Exception e) {
            response.sendRedirect("/iECA3_war_exploded/error.jsp?error=" + e.getMessage());
        }
    }

}
