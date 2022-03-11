<%@ page import="Storage.Storage" %>
<%@ page import="Model.Actor" %>
<%@ page import="Model.Movie" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<%

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
    <table>
        <tr>
            <th>Movie</th>
            <th>imdb Rate</th> 
            <th>rating</th> 
            <th>page</th> 
        </tr>

    </table>
</body>
</html>