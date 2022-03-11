<%@ page import="static jdk.internal.org.jline.reader.impl.LineReaderImpl.CompletionType.List" %>
<%@ page import="Model.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="Storage.Storage" %>

<%--
  Created by IntelliJ IDEA.
  User: kaafj
  Date: 3/11/2022
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <%for(Movie movie : movies){%>
            <tr>
                <td><%=movie.name%></td>
                <td><%=movie.summary%></td>
                <td><%=movie.releaseDate%></td>
                <td><%=movie.director%></td>
                <td><%=movie.writers%></td>
                <td><%=movie.genres%></td>
                <td><%=movie.cast%></td>
                <td><%=movie.imdbRate%></td>
                <td><%=movie.rating%></td>
                <td><%=movie.duration%></td>
                <td><%=movie.ageLimit%></td>
                <td></td>
            </tr>
          <%  }%>
    </tbody>

</table>
</body>
</html>
