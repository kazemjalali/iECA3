<%@ page import="Storage.Storage" %>
<!DOCTYPE html>


<%
    if(!Storage.Database.DataAddedd)
        Storage.Database.SetInformations();
    if(Storage.Database.CurrentUser == null)
        response.sendRedirect("/iECA3_war_exploded/login.jsp");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
    <ul>
        <li id="email">email: <%=Storage.Database.CurrentUser == null ? "NOT Logged In" : Storage.Database.CurrentUser.email%></li>
        <li>
            <a href="/movies.jsp">Movies</a>
        </li>
        <li>
            <a href="/watchlist.jsp">Watch List</a>
        </li>
        <li>
            <a href="/logout.jsp">Log Out</a>
        </li>
    </ul>
</body>
</html>