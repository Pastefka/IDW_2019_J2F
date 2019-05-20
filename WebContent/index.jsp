<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>login</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="./css/login.css" rel="stylesheet">
</head>
<body class="text-center">
	<form class="form-signin" action="login">
  		<img class="mb-4" src="./img/logo.svg" width="128" height="128">
  		<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  		<label for="inputName" class="sr-only">Username</label>
  		<input name="name" type="text" id="inputName" class="form-control" placeholder="Username" required>
  		<label for="inputPassword" class="sr-only">Password</label>
  		<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
  		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  		<p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
	</form>
	
	<!-- necessary imports -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>