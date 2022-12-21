<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
</head>
<body>
	<c:forEach var="std" items="${stdDetails}">
		<c:set var="id" value="std.id"/>  
		<c:set var="name" value="std.name"/>  
		<c:set var="email" value="std.email"/>  
		${std.id}
		${std.name}
		${std.email}
	</c:forEach>
	
	<c:url value="Update_Student.jsp" var="stdUpdate">
		<c:param name="id" value="${id}"></c:param>
		<c:param name="name" value="${name}"></c:param>
		<c:param name="email" value="${email}"></c:param>
	</c:url>
	
	<a href="${stdUpdate}">
	<input type="button" name="update" value="Update">
	</a>
</body>
</html>