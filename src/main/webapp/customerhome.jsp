<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/inventory_manage";
String database = "inventory_manage";
String userid = "root";
String password = "Password1234";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@700&family=Montserrat:wght@300;400;900&family=Sacramento&family=Ubuntu&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>

<style>
body {
	background-color: #CFF5E7;
}

.searchbar{
    margin-bottom: auto;
    margin-top: auto;
    height: 40px;
    background-color: #353b48;
    border-radius: 10px;
    padding: 10px;
    }

    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 450px;
    caret-color:white;
    line-height: 12px;
    transition: width 0.4s linear;
    padding: 0 10px;
    }

    .search_icon{
    height: 20px;
    width: 20px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    text-decoration:none;
    }

	.search_icon:hover {
    color: #59C1BD;
    }
    
    .nav-link:hover {
	color: #ffffff;
	font-weight: bold;
	}
	
	.active {
	font-weight: bold;
	}
	
	.search {
	background-color: #353b48;
	color: #ffffff;
	border-style: none;
	}
</style>


<body>

<!-- Navigation Bar -->
<nav class="navbar" style="background-color: #59C1BD;">
  <div class="container-fluid" style=" margin: 0px 5px 0px 5px;">
    <a class="navbar-brand" href="customerhome.jsp">
    	Inventory Management System
    </a>
    	<a class="nav-link active" aria-current="page" href="customerhome.jsp">Home</a>
    	<a class="nav-link" href="inventorypage">Inventory</a>
    	<a class="nav-link" href="consumablespage">  Consumables</a>

    <div class="searchbar">
    	<form action="inventorysearch"  method="post">
          <input class="search_input" type="text" name="search" placeholder="Search...">
          <a href="#" class="search_icon"><button type="submit" value="Search" class="search"><i class="fas fa-search"></i></button></a>
    	</form>
    </div>
    
    <a class="navbar-brand" href="">
    	<i class="fa-solid fa-cart-shopping"></i>
    </a>
    <a class="navbar-brand" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions" href="">
    	<i class="fa-solid fa-user"></i>
    </a>
  </div>
</nav>


<!-- User Profile Offcanvas -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">User Profile</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	<img alt="" src="images/201818.png" style="height: 100px; width: 100px; text-align: center; margin-left: 35%;"><br><br>
    <c:forEach var="std" items="${stdDetails}">
    	<c:set var="id" value="${std.getStudent_ID()}"/>  
		<c:set var="name" value="${std.name}"/>  
		<c:set var="email" value="${std.email}"/>
		Student ID: ${std.getStudent_ID()} <br>
		Student Name: ${std.name} <br>
		Email: ${std.email} <br>
	</c:forEach>
	
	<c:url value="Update_Student.jsp" var="stdUpdate">
		<c:param name="id" value="${id}"></c:param>
		<c:param name="name" value="${name}"></c:param>
		<c:param name="email" value="${email}"></c:param>
	</c:url>
	
	<br><br>
	<div class="d-grid gap-2 col-6 mx-auto" style="width: 100%;">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="${stdUpdate}" style="text-decoration: none; color: white; width: 50%;"><button type="button" class="btn btn-warning" style="width: 100%;"> Update</button></a>
			<button type="button" class="btn btn-danger" style="width: 50%;">Deactivate</button>
		</div>
			<a href="Student_Login.jsp" style="text-decoration: none; color: white; width: 100%;"><button type="button" class="btn btn-dark" style="width: 100%;">Log Out</button></a>
	</div>
  </div>
</div>


<!-- Body -->
<div class="main" style="margin-top: 3%;">
	<div class="container text-center">
  		<div class="row">
    		<div class="col">
      			<h2 style="text-align: center;">Most Popular Inventory</h2>
      			
       			<% 
					try{
						connection = DriverManager.getConnection(connectionUrl, userid, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM inventory ORDER BY Numbers DESC";
						resultSet = statement.executeQuery(sql);
						%>

			

			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px; ">
 				<img src="images/glueguntest.jpg" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
			
			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px;">
 				<img src="images/bouthtest.jpg" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
			
			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px;">
 				<img src="images/vertdrilltest.jpg" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
      			
      						<%	
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					} 
      			
					%> 
      
      			
    		</div>
    		<div class="col">
      			<h2 style="text-align: center;">Most Popular Consumables</h2>
      			
      			<% 
					try{
						connection = DriverManager.getConnection(connectionUrl, userid, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM consumables ORDER BY Issued DESC";
						resultSet = statement.executeQuery(sql);
						%>

			

			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px;">
 				<img src="images/grindingwheelstest.png" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
			
			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px;">
 				<img src="images/multibondtest.jpeg" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
			
			<div class="card" style="width: 23rem; margin: 3%; margin-left: 140px;">
 				<img src="images/arduinotest.jpg" class="card-img-top" alt="..." style="width: 200px; height: 200px; margin-left: 70px;">
 					<div class="card-body" style="background-color: #EEEEEE; text-align: left; padding-left: 30px;">
	 					<% resultSet.next(); %>
	 					Inventory ID: <%=resultSet.getString(1) %> <br>
	 					Inventory Name: <%=resultSet.getString(3) %> <br>
	 					Received Date: <%=resultSet.getString(2) %> <br>
	 					No of units: <%=resultSet.getString(4) %> <br>
 						<br>
				    <form>
					    <div class="row" style="margin-left: 10px;">
					    	<div class="col">
					    		<input type="number" class="form-control" id="number"  min="1" style="width: 100px; height: 40px;">
					    	</div>
					    	<div class="col">
					    		<button type="submit" class="btn btn-danger" id="buttonAdd">Order</button>
					    	</div>
					    </div>
				    </form>
				    </div>
			</div>
      			
      						<%	
						connection.close();
					} catch (Exception e) {
						e.printStackTrace();
					} 
      			
					%> 
      
      			
      			
    		</div>
  		</div>
  	</div>
</div>


</body>
</html>