<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@700&family=Montserrat:wght@300;400;900&family=Sacramento&family=Ubuntu&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

table {
	text-align: center;
	width: 100%;
}

.container1 {
	background-color: white;
	border-radius: 15px;
	box-shadow: 0 8px 16px -4px lightblue;
	width: 60%;
	padding: 3%;
	margin-left: 20%;
}

#buttonAdd {
	width: 30%;
	background-color: #5837D0;
	color: white;
	text-align: center;
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
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-house"></i>  Dashboard</li>
      				</a>
      				<a href="getInventory">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-hammer"></i>  Inventory</li>
      				</a>
      				<a href="getConsumables">
      					<li class="list-group-item" id="Active1"><i class="fa-solid fa-screwdriver"></i>  Consumables</li>
      				</a>
      				<a href="getLog">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-book"></i>  Log</li>
      				</a>
      				<a href="">
      					<li class="list-group-item" id="select1"><i class="fa-solid fa-rotate-left"></i>  Return</li>
      				</a>
      				<br><br>
      				<a href="">
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
    		
    		
    		<!-- Main -->
    		<div class="col-10" style=" text-align: center; ">
      			<br><h2 style="text-align: center;">Add New Consumables</h2><br><br>
      			<div class="container1">
      				<form action="inventoryinsert" style="width: 640px; text-align: left;" method="post">
      				 <div class="row">
   				 		<div class="col">
      					<div class="mb-3">
    						<label class="form-label" style="text-align: left;">Consumables ID</label>
    						<input type="text" class="form-control" id="id">
  						</div>
      					<div class="mb-3">
    						<label class="form-label">Consumables Name</label>
    						<input type="text" class="form-control" id="name">
  						</div>
  						<div class="mb-3">
    						<label class="form-label">Date</label>
    						<input type="date" class="form-control" id="date">
  						</div>
  						<div class="mb-3">
    						<label class="form-label">Reciept</label>
    						<input type="number" class="form-control" id="number"  min="1">
  						</div>
  						<div class="mb-3">
    						<label class="form-label">Approval</label>
    						<input type="text" class="form-control" id="GRN_REF">
						</div>
						</div>
						<div class="col">
						<div class="mb-3">
						<label class="form-label">Location</label>
							<select class="form-select" id="location">
	  							<option selected>Select Location</option>
	  							<option value="1">Cupboard 1</option>
	  							<option value="2">Cupboard 2</option>
	  							<option value="3">Cupboard 3</option>
							</select>
						</div>
						<div class="mb-3">
    						<label class="form-label">Description</label>
    						<textarea class="form-control" id="description" rows="4"></textarea>
						</div> 
						<div class="mb-3">
  							<label class="form-label">Image</label>
  							<input class="form-control" type="file" id="image">
						</div>
						</div>
						</div>
						<br>
						<div style="text-align: center;">
					  	<button type="submit" class="btn btn-lg" id="buttonAdd">Add</button>
      					</div>
      				</form>
      			</div>
    		</div>
  		</div>
  	</div>
</div>


</body>
</html>