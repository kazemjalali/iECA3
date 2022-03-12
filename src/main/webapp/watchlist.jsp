<%@ page import="Storage.Storage" %>
<%@ page import="Views.MovieListView" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Movie" %>
<!DOCTYPE html>
<%
    if(Storage.Database.CurrentUser == null)
        response.sendRedirect("/iECA3_war_exploded/login.jsp");
    List<MovieListView> movieList = Storage.Database.GetUserWatchList();

    List<Movie> recommendList = Storage.Database.GetRecommendedWatchList();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WatchList</title>
    <style>
      li, td, th {
        padding: 5px;
      }
    </style>
</head>
<body>
<a href="/iECA3_war_exploded">Home</a>
    <p id="email">email: <%=Storage.Database.CurrentUser == null ? "NOT Logged In" : Storage.Database.CurrentUser.email%></p>
    <ul>
        <li id="name">name: <%=Storage.Database.CurrentUser == null ? "NOT Logged In" : Storage.Database.CurrentUser.name%></li>
        <li id="nickname">nickname: @<%=Storage.Database.CurrentUser == null ? "NOT Logged In" : Storage.Database.CurrentUser.nickname%></li>
    </ul>
    <h2>Watch List</h2>
    <table>
        <tr>
            <th>Movie</th>
            <th>releaseDate</th> 
            <th>director</th> 
            <th>genres</th> 
            <th>imdb Rate</th> 
            <th>rating</th> 
            <th>duration</th> 
            <th>page</th>
            <th>remove</th>
        </tr>

        <%int number=movieList.size();
            for(int i = 0;i < number; i++) {%>

        <tr>
            <td><%=movieList.get(i).name %></td>
            <td><%=movieList.get(i).releaseDate %></td>
            <td><%=movieList.get(i).director %></td>
            <td><%=movieList.get(i).genres %></td>
            <td><%=movieList.get(i).imdbRate %></td>
            <td><%=movieList.get(i).rating %></td>
            <td><%=movieList.get(i).duration %></td>
            <td><a href="movie.jsp?movie_id=<%=movieList.get(i).id%>">Link</a></td>
            <td>
                <form action="/iECA3_war_exploded/RemoveWatchList" method="POST">
                    <input type="hidden" id="movieId" name="movie_id" value="<%=movieList.get(i).id%>">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
        <%} %>

    </table>
    <h2>Recommendation List</h2>
    <table>
        <tr>
            <th>Movie</th>
            <th>imdb Rate</th> 
            <th>Link</th>
        </tr>

        <% for(int i = 0;i < 3; i++) {%>

        <tr>
            <td><%=recommendList.get(i).name %></td>
            <td><%=recommendList.get(i).imdbRate %></td>
            <td><a href="movie.jsp?movie_id=<%=recommendList.get(i).id%>">Link</a></td>
        </tr>
        <%} %>

    </table>
</body>
</html>