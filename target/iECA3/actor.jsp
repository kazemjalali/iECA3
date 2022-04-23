<%@ page import="Storage.Storage" %>
<%@ page import="Model.Actor" %>
<%@ page import="Model.Movie" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<%

    if(Storage.Database.CurrentUser.email == null)
        response.sendRedirect("/error.jsp?error=Please Login");
    int actorId = Integer.parseInt(request.getParameter("actor_id"));
    Actor actor = Storage.Database.GetActorById(actorId);
    ArrayList<Movie> movieActedList = Storage.Database.GetTotalMovieActedIn(actorId);

%>


<head>
    <meta charset="UTF-8">
    <title>Actor</title>
    <style>
      li, td, th {
        padding: 5px;
      }
    </style>
</head>
<body>
    <a href="/">Home</a>
    <p id="email"></p>
    <ul>
        <li id="name">name: <%= actor.name%> </li>
        <li id="birthDate">birthDate: <%= actor.birthDate%></li>
        <li id="nationality">nationality: <%= actor.nationality%></li>
        <li id="tma">Total movies acted in: <%= movieActedList.size() %></li>
    </ul>

    <br/>

    <table>
        <tr>
            <th>Movie</th>
            <th>imdb Rate</th> 
            <th>rating</th> 
            <th>page</th> 
        </tr>
        <%int number=movieActedList.size();
            for(int i = 0;i < number; i++) {%>

        <tr>
            <td><%=movieActedList.get(i).name %></td>
            <td><%=movieActedList.get(i).imdbRate %></td>
            <td><%=movieActedList.get(i).rating %></td>
            <td><a href="movie.jsp?movie_id=<%=movieActedList.get(i).id%>">Link</a></td>
        </tr>
        <%} %>

    </table>
</body>
</html>