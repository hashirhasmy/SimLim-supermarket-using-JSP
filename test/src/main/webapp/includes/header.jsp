<%@page import="com.hashir.test.model.User"%>
<nav id="main-nav" class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Admin</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index1.jsp">Home|Customer Orders
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="index2.jsp">Check products</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<!-- <input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search"> -->
					<%
						if(session.getAttribute("user") == null){
					%>
					<a href="login1.jsp"><button class="btn btn-outline-success my-2 my-sm-0" type="button">Sign in</button></a>
					<%
						} else {
							User user = (User)session.getAttribute("user");
							String username = user.getUsername();
							String img_url = user.getImgURL();
					%>
					<a href="#" class="badge badge-warning"  id="u-profile-wrapper">
							<span id="u-img" style="background-image: url('images/profile/<% out.print(img_url); %>');"></span>
							<span id="u-profile">
							<% 
								out.print(username);
							%></span>
						</a>
				<a href="logout1.jsp"><span class="btn btn-outline-success my-2 my-sm-0">Logout</span></a>
					<%
						}
					%>
			</form>
		</div>
	</nav>