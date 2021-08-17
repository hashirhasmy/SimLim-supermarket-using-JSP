<%@ page import="java.sql.*" %>  

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String name,owner,price,qty;
		
		name=request.getParameter("txt_name"); //txt_name 
		owner=request.getParameter("txt_owner"); //txt_owner
		price=request.getParameter("txt_price"); //txt_price
		qty=request.getParameter("txt_qty"); //txt_qry
		
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into person1(name,owner,price,qty)values(?,?,?,?)"); //sql insert query 
		pstmt.setString(1,name); 
		pstmt.setString(2,owner);	
		pstmt.setString(3,price);
		pstmt.setString(4,qty);
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
	
		<title>Add Records</title>
		
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		<!--css for div main class and table -->
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
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var name = document.myform.txt_name;
				var owner = document.myform.txt_owner;
				
				if (name.value == "")
				{
					window.alert("please enter name ?");
					name.focus();
					return false;
				}
				if (owner.value == "")
				{
					window.alert("please enter owner ?");
					owner.focus();
					return false;
				}
			}
			
		</script>
		
	</head>
	
	<body style="background : linear-gradient(90deg,#e3eca5, #48e6c1);">
		<jsp:include page="includes/header.jsp"></jsp:include>
		<div class="main" style="margin-top:60px;">

		<form method="post" name="myform"  onsubmit="return validate();">
	
			<div style="text-align:center;">
				<h1>Insert Record</h1>
			</div>
		
			
			<table>	
		
				<tr>
					<td>Name</td>
					<td><input type="text" name="txt_name"></td>
				</tr>
				
				<tr>
					<td>Owner</td>
					<td><input type="text" name="txt_owner"></td>
				</tr>	
				
				<tr>
					<td>Price</td>
					<td><input type="text" name="txt_price"></td>
				</tr>
				
				<tr>
					<td>Qty</td>
					<td><input type="text" name="txt_qty"></td>
				</tr>		
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
			
				<div style="text-align:center;">
					<h1><a href="index2.jsp">Back</a></h1>
				</div>
				
		</form>
		
		</div>
		
		

</body>

</html>