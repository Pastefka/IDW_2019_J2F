<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="biofarm_j2f.Strings, biofarm_j2f.PostgresConnection, java.util.ArrayList, biofarm_j2f.PorductOverviewItem, javax.servlet.jsp.JspWriter"%>

<%
	String username = (String)session.getAttribute("usr");
	int userId = (int)session.getAttribute("customerId");
	if(username == null)
		response.sendRedirect("index.jsp");
	PostgresConnection conn = new PostgresConnection();
	ArrayList<PorductOverviewItem> list = conn.getProductListOverview();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard Customer</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="./css/dashboard_customer.css">
</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">All <span class="sr-only">(current)</span></a>
					</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#">Vegatables</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#">Fruits</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#" >Crops</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="#">Carts</a>
      				</li>
      				<li class="nav-item">
        				<a style="float:right" class="nav-link" href="#"><%=username%></a>
      				</li>
    			</ul>
  			</div>
		</nav>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body" id="selContent">
						<ul class="list-group">
							<%
							PorductOverviewItem p = null;
							for(int i = 0; i < list.size(); i++){
								p = list.get(i);
								if(p.getCategory().equals("vegetable")){
									out.print("<li class='list-group-item vegetable'>"+ p.getName() + "</li>");
								}else if(p.getCategory().equals("fruit")){
									out.print("<li class='list-group-item fruit'>"+ p.getName() + "</li>");
								}else if(p.getCategory().equals("crop")){
									out.print("<li class='list-group-item crop'>"+ p.getName() + "</li>");
								}
							}
							%>
						</ul>
				  	</div>
				</div>
			</div>
				<div class="col-md-8">
					<div class="card">  
						<div class="card-body">
						    <br>
							<div class="boxA">
								<span>PName</span>
								<span>PKat</span>
								<span>PTag</span>
							</div>
							<div class="boxB">
								<h4>ProductInfo</h4>
								<div>
									<p>Info blablabla</p>
									<ul>
										<li>Proteins:</li>
										<li>Fat:</li>
										<li>Nutrision:</li>
									</ul>
								</div>
							</div>
							<div class="boxB">
								<div>
									<br>Price:
								</div>
								<div class="boxC" >
									<h3>FarmerList:</h3>
									<div>
										<ul>
											<li>Farmer Price Amount</li>
											<li>Farmer A : 2,4Euro 40</li>
											<li>Farmer B : 2,5Euro 20</li>
										</ul>
									</div>
								</div>
								<div>
									<form>
										Amount:
										<input type="text" name=bamount></input>
										<br>
										Buy from Farmer:
										 <select name="selectFarmer">
										  <option value="Farmer_A">A</option>
										  <option value="Farmer_B">B</option>
										  <option value="Farmer_C">C</option>
										  <option value="Farmer_D">D</option>
										</select> 
										to Cart:
										<select name="selectCart">
										  <option value="Cart_A">A</option>
										  <option value="Cart_B">B</option>
										  <option value="Cart_C">C</option>
										  <option value="Cart_D">D</option>
										</select> 
										<button type="button" onclick="alert('Product added to Cart')">Add</button> 
									</form>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<div class="card-deck">
		</div>
		<!-- necessary imports -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>
