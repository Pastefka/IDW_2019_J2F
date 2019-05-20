 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="biofarm_j2f.Strings, biofarm_j2f.PostgresConnection, java.util.ArrayList, biofarm_j2f.PorductOverviewItem, javax.servlet.jsp.JspWriter"%>

<%
	String username = (String)session.getAttribute("usr");
	int userId = (int)session.getAttribute("farmerId");
	if(username == null)
		response.sendRedirect("index.jsp");
	PostgresConnection conn = new PostgresConnection();
	ArrayList<PorductOverviewItem> list = conn.getProductListOverview();
	
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
					<li class="nav-item">
						<a class="nav-link" href="dashboard_farmer.jsp">My Products </a>
					</li>
      				<li class="nav-item active">
        				<a class="nav-link" href="#">All Products <span class="sr-only">(current)</span></a>
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
						<select class="form-control">
							<option>All</option>
							<option>Fruit</option>
						</select>
					</div>
					<div class="card-body" id="selContent">
						<ul class="list-group">
							<%
							PorductOverviewItem p = null;
							for(int i = 0; i < list.size(); i++){
								p = list.get(i);
								if(p.getCategory().equals("vegetable")){
									out.print("<li class='list-group-item vegetable'>"+ p + "</li>");
								}else if(p.getCategory().equals("fruit")){
									out.print("<li class='list-group-item fruit'>"+ p + "</li>");
								}else if(p.getCategory().equals("crop")){
									out.print("<li class='list-group-item crop'>"+ p + "</li>");
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
			    <h5 class="card-title">Some information about the product</h5>
			    <p class="card-text">Here would be some further information... if there would be any..</p>
			    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
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