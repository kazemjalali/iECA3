<%@ page import="Storage.Storage" %>
<!DOCTYPE html>
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
    <a href="/">Home</a>
    <p id="email">email: <%=Storage.Database.CurrentUser.email%></p>
    <ul>
        <li id="name">name: <%=Storage.Database.CurrentUser.name%></li>
        <li id="nickname">nickname: @<%=Storage.Database.CurrentUser.nickname%></li>
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
            <th></th>
            <th></th>
        </tr>

        <tr>
            <th>War for the Planet of the Apes</th>
            <th>2017-07-14</th> 
            <th>Matt Reeves</th> 
            <th>Drama, Action, Adventure</th> 
            <th>7.4</th> 
            <th>8</th> 
            <th>140</th> 
            <td><a href="/movies/03">Link</a></td>
            <td>        
                <form action="" method="POST" >
                    <input id="form_movie_id" type="hidden" name="movie_id" value="03">
                    <button type="submit">Remove</button>
                </form>
            </td>
        </tr>
    </table>
    <h2>Recommendation List</h2>
    <table>
        <tr>
            <th>Movie</th>
            <th>imdb Rate</th> 
            <th>Link</th>
        </tr>

    </table>
</body>
</html>