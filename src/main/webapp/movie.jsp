<%--
  Created by IntelliJ IDEA.
  User: kaafj
  Date: 3/11/2022
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="Storage.Storage" %>
<%@ page import="Views.SingleMovieView" %>
<%@ page import="Views.CastView" %>
<%@ page import="Views.CommentView" %>
<html>
<head>
    <title>movie</title>
    <style>
        li {
            padding: 5px;
        }
        table {
            width: 20%;
            text-align: center;
        }
    </style>
</head>
<body>
<%String movieId = request.getParameter("movie_id");%>
<%SingleMovieView result =  Storage.Database.GetMovie(Integer.parseInt(movieId)); %>
<a href="/">Home</a>
<p id="email">email: ali@gmail.com</p>
<ul>
    <li id="name">name:<%=result.Name%> </li>
    <li id="summary">summary:<%=result.Summary%></li>
    <li id="releaseDate">releaseDate: <%=result.ReleaseDate%></li>
    <li id="director">director: <%=result.Director%></li>
    <li id="writers">writers: <%=result.Writers%></li>
    <li id="genres">genres: <%=result.Genres%></li>

    <li id="imdbRate">imdb Rate: <%=result.ImdbRate%></li>
    <li id="rating">rating: <%=result.Rating%></li>
    <li id="duration">duration: <%=result.Duration%></li>
    <li id="ageLimit">ageLimit: <%=result.AgeLimit%></li>
</ul>
<h3>Cast</h3>
<table>
    <tr>
        <th>name</th>
        <th>age</th>
        <th>actor page</th>
    </tr>
    <%for(CastView castView : result.Cast){%>
        <tr>
            <td><%=castView.Name%></td>
            <td><%=castView.Age%></td>
            <td><a href="actor.jsp?actor_id=<%=castView.ActorId%>">link</a></td>
        </tr>
    <%}%>

</table>

<br><br>
<form action="/iECA3_war_exploded/rateMovie"  method="POST">
    <label>Rate(between 1 and 10):</label>
    <input type="number" id="quantity" name="quantity" min="1" max="10" required>
    <input type="hidden" id="movie_Id" name="action" value="<%=movieId%>">
    <button type="submit">rate</button>
</form>
<br>
<form action="/addWatchList" method="POST">
    <input type="hidden" id="movieId" name="action" value="<%=movieId%>">
    <button type="submit">Add to WatchList</button>
</form>
<br />
<table id="cmTable">
    <tr>
        <th>nickname</th>
        <th>comment</th>
        <th></th>
        <th></th>
    </tr>
    <%for(CommentView cm : result.Comments){%>
        <tr>
            <td><%=cm.nickName%></td>
            <td><%=cm.Text%></td>
            <td>
                <form action="" method="POST">
                    <label for=""><%=cm.like%></label>
                    <input
                            id="form_comment_id"
                            type="hidden"
                            name="comment_id"
                            value="<%=cm.Id%>"
                    />
                    <input type="hidden" id="form_action" name="action" value="like">
                    <input type="hidden" id="form_movie_id" name="movie_id" value="<%=movieId%>">
                    <button type="submit">like</button>
                </form>
            </td>
            <td>
                <form action="" method="POST">
                    <label for=""><%=cm.dislike%></label>
                    <input  id="form_comment_id" type="hidden" name="comment_id" value="<%=cm.Id%>"/>
                    <input type="hidden" id="form_action" name="action" value="dislike">
                    <input type="hidden" id="form_movie_id" name="movie_id" value="<%=movieId%>">
                    <button type="submit">dislike</button>
                </form>
            </td>
        </tr>
    <%}%>

</table>
</body>
</html>
