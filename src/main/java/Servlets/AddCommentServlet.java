package Servlets;

import Model.Comment;
import Model.WatchList;
import Storage.Storage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addComment", value = "/addComment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(Storage.Database.CurrentUser == null){
            response.sendRedirect("/iECA3_war_exploded/login.jsp");
            return;
        }

        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        String cmText = request.getParameter("commentText");
        Comment comment = new Comment(Storage.Database.CurrentUser.email, movie_id, cmText);
        try {
            Storage.Database.AddComment(comment);
            response.sendRedirect("/iECA3_war_exploded/movie.jsp?movie_id=" + movie_id);

        } catch (Exception e) {
            response.sendRedirect("/iECA3_war_exploded/error.jsp?error=" + e.getMessage());
        }
    }

}
