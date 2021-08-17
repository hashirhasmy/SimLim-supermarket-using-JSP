<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body style="background : linear-gradient(90deg,#e3eca5, #48e6c1);">
	
	<jsp:include page="includes/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<form action="authCheck1" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> 
						<input type="email" class="form-control" name="u-email" id="exampleInputEmail1"
							aria-describedby="emailHelp"> 
						<small id="emailHelp" class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> 
						<input type="password" class="form-control" name="u-password" id="exampleInputPassword1">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" name="remember" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Check
							me out</label>
					</div>
					<button type="submit" name="btn-submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	
	<%
		if(request.getCookies() != null){
		Cookie cookies[] = request.getCookies();
		
		for(int i=0; i < cookies.length; i++){
			out.print("Key : "+ cookies[i].getName()+ " Expiry : "+cookies[i].getMaxAge()+"<br/>"); 
		}
	  }
	%>

	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/popper.min.js"></script>
</body>
</html>