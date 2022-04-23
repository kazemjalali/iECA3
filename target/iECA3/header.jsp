<%@ page import="Storage.Storage" %>


<%

	if(Storage.Database.CurrentUser == null)
		response.sendRedirect("/iECA3_war_exploded/login.jsp");

%>