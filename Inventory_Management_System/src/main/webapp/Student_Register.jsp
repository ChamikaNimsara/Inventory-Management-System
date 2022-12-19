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
<title>Student Registration</title>
</head>

<style>
body {
	background: linear-gradient(-45deg, #A0E4CB, #59C1BD, #0D4C92);
	background-size: 400% 400%;
	animation: gradient 100s ease infinite;
	height: 100vh;
	padding: 15px;
	padding-top: 10%;
	text-align: center;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

.float-child {
	width: 50%;
	height: 100%;
    float: left;
    padding: 70px 0px 30px 0px;
}

.outer-container {
	width: 900px; 
	height: 500px; 
	background: #CFF5E7; 
	border-radius: 15px;
	text-align: center;
	margin: auto;
}

.box {
	border-radius: 10px;
	background-color: #A0E4CB;
	border-width: 0px;
	height: 40px;
	width: 70%;
	text-indent: 15px;
}

.box-onc

</style>

<body>

<div class="outer-container" id="container">
  <div class="float-child">
  	<div style="border-right-color: #6D9886; border-right-width: 2px; border-right-style: solid;">
  		<img alt="" src="images/logo.png" style="height: 110px; width: 240px; text-align: center; margin:  0 10% 10% 10%;">
    	<img alt="" src="images/201818.png" style="height: 200px; width: 200px; text-align: center; ">
  	</div>
  </div>
  
  <div class="float-child" style="padding: 30px 0px 30px 0px">
    <div class="form">
    	<h1 style="color:black;  font-size:30px; font-family: 'Merriweather Sans', sans-serif; text-align:center; color: #6D9886;">Student Registration</h1><br>
    	<form action="insertstudent" method="post">
		
		<input class="box" type="text" name="id" placeholder="Index Number"><br><br>
		<input class="box" type="text" name="name" placeholder="Student Name"><br><br>
		<input class="box" type="email" name="email" placeholder="Student Email"><br><br>
		<input class="box" type="text" name="uid" placeholder="Username"> <br><br>
		<input class="box" type="password" name="psw" placeholder="Password"> <br><br>
		
		<div style="text-align: center;">
			<input type="submit" name="submit" value="Register" class="btn btn-outline-dark btn-lg"  style="width: 70%;">
		</div>
	</form>
    </div>
  </div>
</div>

</body>
</html>