<!DOCTYPE html>
<%@page import="com.hashir.test.Configurations"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
#u-img{
	width: 30px;
	height: 50px;
	display: inline-block;
	vertical-align: middle;
	border-radius: 50%; 
	background-size: cover;
}

#u-profile{
	padding: 15px ;
	display : inline-block;
	font-size: 18px;
}

#u-profile-wrapper{
	display : inline-block;
	margin-right: 15px;
}
table{
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 600px;
}
td{
	border: 5px solid silver;
	text-align: left;
	padding: 8px;
}
hr.divider{
    max-width: 3.25rem;
    border-width: 0.2rem;
    border-color: #f4623a;
} 
</style>
</head>
<body style="background : linear-gradient(90deg,#a7af6d, #1cbc96);">

<%
		boolean logged_in = false;
		
		if(session.isNew() || session.getAttribute("logged_in") == null){
			out.print("<h3>Please login...</h3>");
		} else {
			logged_in = (Boolean)session.getAttribute("logged_in");
		}
		
		if(logged_in) {
			
			Cookie cookies[] = request.getCookies();
			
			for(int i=0; i < cookies.length; i++){
				out.print("Key : "+ cookies[i].getName()+ " Value : "+cookies[i].getValue()+"<br/>"); 
			}
	%>
	
	<jsp:include page="includes/header.jsp"></jsp:include>
	
	<div class="container">
	 <h2 class="text-center mt-0">Customer Order Deails</h2>
            <hr class="divider my-4" />
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Mobile No</th>
							<th scope="col">Item</th>
							<th scope="col">Qty</th>
							<th scope="col">Code</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
	
				<%	
						
						Connection connection = Configurations.getDbConnection();
						
						String sql = "SELECT * FROM test1";
						Statement stmt = connection.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						
						while(rs.next()) {
				%>
					<tr>
						<th scope="row"><%  out.print(rs.getString("id")); %></th>
						<td><%  out.print(rs.getString("name")); %></td>
						<td><%  out.print(rs.getString("email")); %></td>
						<td><%  out.print(rs.getString("mobile")); %></td>
						<td><%  out.print(rs.getString("item")); %></td>
						<td><%  out.print(rs.getString("qty")); %></td>
						<td><%  out.print(rs.getString("code")); %></td>
						<td>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#f00" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/></svg>
						</td>
					</tr>
				<%
					}
						connection.close();
				%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
				<%
					} else {
						/* out.print("<h3>Please login.....</h3>"); */
					}
				%>

	
	
	

	
	<script src="js/jquery-3.5.1.slim.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/popper.min.js"></script>
</body>
</html>