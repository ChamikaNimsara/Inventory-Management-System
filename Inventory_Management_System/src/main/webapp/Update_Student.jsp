<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	%>

	<form action="studentupdate" method="post">
		Student ID<input class="box" type="text" name="sid" value="<%= id %>" readonly><br><br>
		Name<input class="box" type="text" name="name" value="<%= name %>"><br><br>
		Email<input class="box" type="email" name="email" value="<%= email %>"><br><br>
		
		<input type="submit" name="submit" value="Update My Data">
	</form>
</body>
</html>