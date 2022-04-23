<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        h1 {
            color: rgb(207, 3, 3);
        }
    </style>
</head>
<body>
<a href="/iECA3_war_exploded">Home</a>
    <h1>
        Error: <%= request.getParameter("error")%>
    </h1>

</body>
</html>