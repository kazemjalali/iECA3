
<%@ page import="Model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="Storage.Storage" %>
<%@ page import="Views.GetAllMovieView" %>

<%--
  Created by IntelliJ IDEA.
  User: kaafj
  Date: 3/11/2022
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(Storage.Database.CurrentUser == null)
        response.sendRedirect("/iECA3_war_exploded/login.jsp");
%>
<html>


<head>
    <title>Movies</title>
    <style>
        table{
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
<a href="/iECA3_war_exploded">Home</a>
<p id="email">email: ali@gmail.com</p>
<br><br>
<form action="" method="POST">
    <label>Search:</label>
    <input type="text" name="search" value="">
    <button type="submit" name="action" value="search">Search</button>
    <button type="submit" name="action" value="clear">Clear Search</button>
</form>
<br><br>
<form action="" method="POST">
    <label>Sort By:</label>
    <button type="submit" name="action" value="sort_by_imdb">imdb Rate</button>
    <button type="submit" name="action" value="sort_by_date">releaseDate</button>
</form>
<br>
<table id="table">
    <tbody>
    <tr>
        <th>name</th>
        <th>summary</th>
        <th>releaseDate</th>
        <th>director</th>
        <th>writers</th>
        <th>genres</th>
        <th>cast</th>
        <th>imdb Rate</th>
        <th>rating</th>
        <th>duration</th>
        <th>ageLimit</th>
        <th>Links</th>
    </tr>
    <%java.util.List<Movie> movies = Storage.Database.GetAllMovies();%>
        <%for(Movie mve : movies){%>
            <%GetAllMovieView movie = new GetAllMovieView(mve);%>
            <tr>
                <td><%=movie.name%></td>
                <td><%=movie.summary%></td>
                <td><%=movie.releaseDate%></td>
                <td><%=movie.director%></td>
                <td><%=movie.writers%></td>
                <td><%=movie.genres%></td>
                <td><%=movie.castNames%></td>
                <td><%=movie.imdbRate%></td>
                <td><%=movie.rating%></td>
                <td><%=movie.duration%></td>
                <td><%=movie.ageLimit%></td>
                <td><a href="movie.jsp?movie_id=<%=mve.id%>" >link</a></td>
            </tr>
          <%  }%>
    </tbody>

</table>
</body>
</html>
