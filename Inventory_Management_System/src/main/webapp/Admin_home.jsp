<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.time.LocalDate"%>
<%@page import="java.time.Month"%>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #F4F5FA;
}

li {
	font-size: 20px;
	height: 50px;
	padding-top: 10px;
}

i {
	margin-right: 10px;
}

#Active1 {
	background-color: #5837D0;
	color: white;
	border-radius: 10px;
	padding-top: 10px;
	margin: 5px;
	padding-left: 12px;
}

#select1 {
	padding-top: 10px; 
	margin: 5px; 
	padding-left: 12px;
}

#select1:hover {
	background-color: #D6E4E5;
	border-radius: 10px;
	padding-top: 10px;
	margin: 5px;
	padding-left: 12px;
}

a {
	text-decoration: none;
	color: #212529;
}

a:hover {
	text-decoration: none;
	color: #212529;
}

.container1 {
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 8px 32px -4px lightblue;
	width: 50%;
	padding: 3%;
	margin: 1%;
	float: left;
}

</style>


<body>

<div class="main" style="margin-top: 1%;">
	<div class="" style="margin: 0; margin-right: 0; padding-right: 3%;">
  		<div class="row">
    		<div class="col-2" style="padding-left: 1.5%;">
      			<h4 style="text-align: Left; margin-bottom: 30px;">Inventory Management System</h4>
      			
      			<ul style="padding-left: 0;"> 
      				<a href="Admin_home.jsp">
      					<li class="list-group-item" id="Active1"><i class="fa-solid fa-house"></i>  Dashboard</li>
      				</a>
      				<a href="getInventory">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-hammer"></i>  Inventory</li>
      				</a>
      				<a href="getConsumables">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-screwdriver"></i>  Consumables</li>
      				</a>
      				<a href="getLog">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-book"></i>  Log</li>
      				</a>
      				<a href="">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-rotate-left"></i>  Return</li>
      				</a>
      				<br><br>
      				<a data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions" href="">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-user"></i>  Admin Profile</li>
      				</a>
      				<a href="Admin_Register.jsp">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-user-plus"></i>  New Admin</li>
      				</a>
      				<a href="getStudent">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-graduation-cap"></i>  View Students</li>
      				</a>
      				<br><br>
      				<a href="Admin_Login.jsp">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-right-to-bracket"></i>  Log Out</li>
      				</a> 
      				
      			</ul>
      			<br><br>
      			Copyright <br>Chamika_Nimsara
    		</div>
    		<div class="col-10">
      			<h2 style="text-align: center;">DashBoard</h2>
      			
      			
      			<% 
      				ArrayList<String> popularCons = new ArrayList<>();
      				try{
    					connection = DriverManager.getConnection(connectionUrl, userid, password);
    					statement=connection.createStatement();
    					String sql ="SELECT Material FROM consumables ORDER BY Issued DESC";
    					resultSet = statement.executeQuery(sql);
    						while(resultSet.next()){
    							popularCons.add(resultSet.getString(1));
    						}
    						connection.close();
    					} catch (Exception e) {
    					e.printStackTrace();
    					}
      				%>
      				
      				<% 
      				ArrayList<String> popularInv = new ArrayList<>();
      				try{
    					connection = DriverManager.getConnection(connectionUrl, userid, password);
    					statement=connection.createStatement();
    					String sql ="SELECT Items FROM inventory ORDER BY Numbers DESC";
    					resultSet = statement.executeQuery(sql);
    						while(resultSet.next()){
    							popularInv.add(resultSet.getString(1));
    						}
    						connection.close();
    					} catch (Exception e) {
    					e.printStackTrace();
    					}
      				%>
      			
      			

      			<div class="container1">
      			<h5 style="text-align: center;">Daily Login</h5>
      			<canvas id="myChart" style="width:100%;max-width:600px"></canvas>

      			</div>

      			<div class="container1" style="color: #5BB318; width: 21.5%; text-align: center; height: 38.5%;">
      				<h5 style="text-align: center; font-weight: bold;">Most Popular Consumable</h5><br>
      					<table class="table" style="text-align: centre; width: 90%; margin-left: 5%;">
							<tr style="background-color: #5BB318; color: white;"><td style="text-align:center; border-radius: 10px;"> <%=popularCons.get(0) %> </td></tr>
      				      	<tr><td style="text-align:center;"> <%=popularCons.get(1) %> </td></tr>
      				      	<tr style="background-color: #5BB318; color: white;"><td style="text-align:center; border-radius: 10px;"> <%=popularCons.get(2) %> </td></tr>
						</table>
				</div>
				
				<div class="container1" style="color: #5BB318; width: 21.5%; text-align: center; height: 38.5%;">
      				<h5 style="text-align: center; font-weight: bold;">Most Popular Inventory</h5><br>
      					<table class="table" style="text-align: centre; width: 90%; margin-left: 5%;">
							<tr style="background-color: #5BB318; color: white;"><td style="text-align:center; border-radius: 10px;"> <%=popularInv.get(0) %> </td></tr>
      				      	<tr><td style="text-align:center;"> <%=popularInv.get(1) %> </td></tr>
      				      	<tr style="background-color: #5BB318; color: white;"><td style="text-align:center; border-radius: 10px;"> <%=popularInv.get(2) %> </td></tr>
						</table>
				</div>

				<% 
      				ArrayList<String> outOfStock1 = new ArrayList<>();
      				try{
    					connection = DriverManager.getConnection(connectionUrl, userid, password);
    					statement=connection.createStatement();
    					String sql ="SELECT Material FROM consumables WHERE Available=0";
    					resultSet = statement.executeQuery(sql);
    						while(resultSet.next()){
								outOfStock1.add(resultSet.getString(1));
    						}
    						connection.close();
    					} catch (Exception e) {
    					e.printStackTrace();
    					}

      				%>
      		
      				<% 
      				ArrayList<String> outOfStock2 = new ArrayList<>();
      				try{
    					connection = DriverManager.getConnection(connectionUrl, userid, password);
    					statement=connection.createStatement();
    					String sql ="SELECT Items FROM inventory WHERE Numbers=0";
    					resultSet = statement.executeQuery(sql);
    						while(resultSet.next()){
								outOfStock2.add(resultSet.getString(1));
    						}
    						connection.close();
    					} catch (Exception e) {
    					e.printStackTrace();
    					}

      				%>
      		
      				<div class="container1" style="color: #FF1818; width: 45%; height: 34%;">
      					<h5 style="text-align: center; font-weight: bold;">Out of Stock</h5><br>
      					  <div class="row">
      					  <div class="col" style="width: 50%;">
      					<h5 style="text-align: left;">Consumables</h5>
      					<%
      					for (int i = 0; i < outOfStock2.size(); i++) { %>
      				      <%=outOfStock2.get(i) %> <br>
      				    <%}%>
      				    </div>
      				    <div class="col" style="width: 50%;">
      					<h5 style="text-align: left;">Inventory</h5>
      					
      					<%
      					for (int i = 0; i < outOfStock1.size(); i++) {  %>
        				      <%=outOfStock1.get(i) %> <br>
        				    <% }
      					%>
      				</div></div></div>



				<div class="container1" style="color: #FF7000; width: 50%;">
      					<h5 style="text-align: center; font-weight: bold;">Inventory Due</h5><br>
      					<table class="table" style="text-align: center; color: #FF7000;">
      					<tr>
      					<th>Student ID</th>
      					<th>Inventory ID</th>
      					<th></th>
      					</tr>
      				<% 
      				LocalDate currentdate = LocalDate.now();
      				int currentDay = currentdate.getDayOfMonth();
      				ArrayList<String> due = new ArrayList<>();
      				try{
    					connection = DriverManager.getConnection(connectionUrl, userid, password);
    					statement=connection.createStatement();
    					String sql ="select Student_Id, Inventory_ID, DAY(Res_Day), No_items from reservation";
    					resultSet = statement.executeQuery(sql);
    						while(resultSet.next()){
    							if((currentDay - Integer.parseInt(resultSet.getString(3))) >= 3){ %>

									<tr><td>
									<%=resultSet.getInt(1) %>
									</td>
									<td>
									<%=resultSet.getInt(2) %>
									</td>
									<td>
									<button type="button" class="btn btn-warning btn-sm">Send Reminder</button>
									</td>
									</tr>
							<% }}
    						connection.close();
    					} catch (Exception e) {
    					e.printStackTrace();
    					}

      				%>
      			</table>
      				</div>


      			
      				<%
      				int m = 0;
      				int t = 0;
      				int w = 0;
      				int tr = 0;
      				int f = 0;
      				int sa = 0;
      				int su = 0;
      				
					try{
					connection = DriverManager.getConnection(connectionUrl, userid, password);
					statement=connection.createStatement();
					String sql ="SELECT WEEKDAY(Login_Date), count(STUDENT_ID) FROM log GROUP BY WEEKDAY(Login_Date)";
					resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
							if(resultSet.getInt(1) == 0) m = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 1) t = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 2) w = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 3) tr = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 4) f = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 5) sa = resultSet.getInt(2);
							else if(resultSet.getInt(1) == 6) su = resultSet.getInt(2);
						}
						connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					
					%>
					
					<script>
					var xValues = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
					var yValues = [<%=m%>, <%=t%>, <%=w%>, <%=tr%>, <%=f%>, <%=sa%>, <%=su%>];
					var barColors = ["#5837D0", "#5837D0","#5837D0","#5837D0","#5837D0","#5837D0","#5837D0"];
					
					new Chart("myChart", {
					  type: "bar",
					  data: {
					    labels: xValues,
					    datasets: [{
					      backgroundColor: barColors,
					      data: yValues
					    }]
					  },
					  options: {
						  
					    legend: {display: false},
					    title: {
					      display: true,
					    },
					    scales: {
					    	  yAxes: [{
					    	    ticks: {
					    	      stepSize: 1
					    	    }
					    	  }]
					    	}
					  }
					});
					</script>
      		
      				
      		
      				

      		
      		
      		
      		
      		
      		
      		
      		
      				
      		
      		
      		
      				
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		
      		
    		</div>
  		</div>
  	</div>
</div>

<!-- User Profile Offcanvas -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Admin Profile</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  	<img alt="" src="images/profile1.png" style="height: 100px; width: 100px; text-align: center; margin-left: 35%;"><br><br>
    <c:forEach var="std" items="${adminDetails}">
    	<c:set var="id" value="${admin.getAdmin_ID()}"/>  
		<c:set var="name" value="${admin.name}"/>  
		<c:set var="email" value="${admin.email}"/>
		Admin ID: ${admin.getAdmin_ID()} <br>
		Admin Name: ${admin.name} <br>
		Email: ${admin.email} <br>
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
	</div>
  </div>
</div>

</body>
</html>