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

<ul>
    <li id="name">name:<%=result.Name%> </li>
    <li id="summary">summary:<%=result.Summary%></li>
    <li id="releaseDate">releaseDate: <%=result.ReleaseDate%></li>
    <li id="director">director: <%=result.Director%></li>
    <li id="writers">writers: <%=result.Writers%></li>
    <li id="genres">genres: <%=result.Genres%></li>
    <li id="cast">cast: <%=result.Cast%></li>
    <li id="imdbRate">imdb Rate: <%=result.ImdbRate%></li>
    <li id="rating">rating: <%=result.Rating%></li>
    <li id="duration">duration: <%=result.Duration%></li>
    <li id="ageLimit">ageLimit: <%=result.AgeLimit%></li>
</ul>


<br><br>
<form action="/rateMovie"  method="POST">
    <label>Your ID:</label>
    <input type="text" id = "user_id" name="user_id" value="" />
    <label>Rate(between 1 and 10):</label>
    <input type="number" id="quantity" name="quantity" min="1" max="10">
    <button type="submit">rate</button>
</form>
<br>
<form action="/addWatchList" method="POST">
    <label>Your ID:</label>
    <input type="text" id = "movie_id" name="movie_id"  />
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

</table>
</body>
</html>
