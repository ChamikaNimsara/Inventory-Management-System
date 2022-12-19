<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@700&family=Montserrat:wght@300;400;900&family=Sacramento&family=Ubuntu&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Admin Login</title>
</head>

<style>
body {
	background-color: #4649FF;
	height: 100vh;
	padding: 15px;
	padding-top: 10%;
	text-align: center;
}

.float-child {
	width: 50%;
	height: 100%;
    float: left;
    padding: 50px 0px 30px 0px;
}

.outer-container {
	width: 900px; 
	height: 500px; 
	background: #7DE5ED; 
	border-radius: 15px;
	text-align: center;
	margin: auto;
}

.box {
	border-radius: 10px;
	background-color: #81C6E8;
	border-width: 0px;
	height: 40px;
	width: 70%;
	text-indent: 15px;
}

.box-onc

</style>

<body>
<div class="outer-container" id="container">
  <div class="float-child" style="padding: 70px 0px 30px 0px">
  	<div style="border-right-color: #4649FF; border-right-width: 2px; border-right-style: solid;">
  		<img alt="" src="images/logo.png" style="height: 110px; width: 240px; text-align: center; margin:  0 10% 10% 10%;">
    	<img alt="" src="images/profile1.png" style="height: 200px; width: 200px; text-align: center; ">
  	</div>
  </div>
  
  <div class="float-child">
    <div class="form">
    	<h1 style="color:black;  font-size:30px; font-family: 'Merriweather Sans', sans-serif; text-align:center; color: #4649FF;">Admin Login</h1><br><br>
    	<form action="loginAdmin" method="post">
		
		<input class="box" type="text" name="uid" placeholder="Username"> <br><br>
		<input class="box" type="password" name="pass" placeholder="Password"> <br><br>
		
		<div style="text-align: center;">
			<input type="submit" name="submit" value="Login" class="btn btn-outline-dark btn-lg"  style="width: 70%;">
		</div>
	</form><br><br><br><br><br>
	
	<div>
		<a href="Student_Login.jsp" style="color: #4649FF; text-decoration: none;"> <i class="fa-solid fa-user" style="margin-right: 10px;"></i>Student Portal</a>
	</div>
    </div>
  </div>
  

</div>
</body>
</html>