 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="biofarm_j2f.Strings, biofarm_j2f.PostgresConnection, java.util.ArrayList, biofarm_j2f.Product, javax.servlet.jsp.JspWriter"%>

<%
	String username = (String)session.getAttribute("usr");
	int userId = (int)session.getAttribute("farmerId");
	if(username == null)
		response.sendRedirect("index.jsp");
	PostgresConnection conn = new PostgresConnection();
	ArrayList<Product> list = conn.getProductList(userId);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="./css/dashboard.css">
</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">My Products <span class="sr-only">(current)</span></a>
					</li>
      				<li class="nav-item">
        				<a class="nav-link" href="products_farmer.jsp">All Products </a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#" >Orders</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#"><%=username%></a>
      				</li>
    			</ul>
  			</div>
		</nav>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header" id="selCategory">
						<select class="form-control" onchange="onCategoryChange(this.value)">
							<option>All</option>
							<option>Fruit</option>
							<option>Vegetable</option>
							<option>Crop</option>
						</select>
					</div>
					<div class="card-body" id="selContent">
						<ul class="list-group" id="products">
							<%
							Product p = null;
							for(int i = 0; i < list.size(); i++){
								p = list.get(i);
								if(p.getCategory().equals("vegetable")){
									out.print("<li class='list-group-item Vegetable'>"+ p + "</li>");
								}else if(p.getCategory().equals("fruit")){
									out.print("<li class='list-group-item Fruit'>"+ p + "</li>");
								}else if(p.getCategory().equals("crop")){
									out.print("<li class='list-group-item Crop'>"+ p + "</li>");
								}
							}
							%>
							<li>
							
							</li>
						</ul>
				  	</div>
				</div>
			</div>
			<div class="col-md-8">

						<div class="card">
			  <div class="card-body">
			    <h5 class="card-title">Selected Item</h5>
			    <p class="card-text">Here would be some information..</p>
			    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			  	<form action="insert">
			  	
			  			<label for="name">Name:</label>
			  			<input type="text" name="pname" id="name"></input>
			  		
						<label for="amount">Amount:</label>
						<input type="text" name="pamount" id="amount"></input>
					
						<label for="price">Price:</label>
						<input type="text" name="pprice" id="price"></input>	
					
					<button type="submit">save</button>			
				</form>
			  </div>
			  
			</div>
			</div>
		</div>
		
		<!-- necessary imports -->
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="./js/dashboard.js"></script>
	</body>
</html>