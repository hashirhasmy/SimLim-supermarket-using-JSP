<!DOCTYPE html>
<%@page import="com.hashir.test.Configurations"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>

<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String name,email,mobile,item,qty,code;
		
		name=request.getParameter("txt_name"); //txt_name 
		email=request.getParameter("txt_email"); //txt_email
		mobile=request.getParameter("txt_mobile"); //txt_mobile
		item=request.getParameter("txt_item"); //txt_item
		qty=request.getParameter("txt_qty"); //txt_qry
		code=request.getParameter("txt_code"); //txt_code
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into test1(name,email,mobile,item,qty,code)values(?,?,?,?,?,?)"); //sql insert query 
		pstmt.setString(1,name); 
		pstmt.setString(2,email);	
		pstmt.setString(3,mobile);
		pstmt.setString(4,item);
		pstmt.setString(5,qty);
		pstmt.setString(6,code);
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/main1.css">
	<link rel="stylesheet" href="css/login-register.css">

	<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>
		

</head>

<body style="background-color: #a56161;">

   

    <div class="main-content">
	
	<div class="center" style="text-align:center;">
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<h1> Welcome, <%=session.getAttribute("login")%> </h1>

	<h2><a href="logout.jsp">Logout</a></h2> <br>
        
        
	
	<div class="container">
		<div class="row">
			<div class="col-sm-8 offset-sm-2" style="background-color: antiquewhite;">
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Owner</th>
							<th scope="col">Price</th>
							<th scope="col">Qty</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
					<%
						
						Connection connection = Configurations.getDbConnection();
						
						String sql = "SELECT * FROM person1";
						Statement stmt = connection.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						
						while(rs.next()){
					%>
					
						<tr>
							<th scope="row"><%  out.print(rs.getString("id")); %></th>
							<td><%  out.print(rs.getString("name")); %></td>
							<td><%  out.print(rs.getString("owner")); %></td>
							<td><%  out.print(rs.getString("price")); %></td>
							<td><%  out.print(rs.getString("qty")); %></td>
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
	
	<br>
	<br>
	<div class="container">
	<div class="main" style="margin: auto;">

		<form method="post" name="myform"  onsubmit="return validate();">
	
			<div style="text-align:center;">
				<h1>Order Now</h1>
			</div>
		
			
			<table>	
		
				<tr>
					<td>Name</td>
					<td><input type="text" name="txt_name"></td>
				</tr>
				
				<tr>
					<td>Email</td>
					<td><input type="text" name="txt_email"></td>
				</tr>	
				
				<tr>
					<td>Mobile No</td>
					<td><input type="text" name="txt_mobile"></td>
				</tr>
				
				<tr>
					<td>Item</td>
					<td><input type="text" name="txt_item"></td>
				</tr>
				
				<tr>
					<td>Qty</td>
					<td><input type="text" name="txt_qty"></td>
				</tr>
				
				<tr>
					<td>Code</td>
					<td><input type="text" name="txt_code"></td>
				</tr>		
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert" class="btn btn-primary"></td>	
				</tr>
				
			</table>
			
				<div style="text-align:center;">
					<h1><a href="index.html">Back</a></h1>
				</div>
				
		</form>
		
		</div>
		</div>
    
	</div>
		
    </div>
    
    	

</body>

</html>
