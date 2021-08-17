<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String name_up,owner_up,price_up,qty_up;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		name_up=request.getParameter("txt_name");  //txt_name
		owner_up=request.getParameter("txt_owner"); //txt_owner
		price_up=request.getParameter("txt_price"); //txt_price
		qty_up=request.getParameter("txt_qty"); //txt_qty
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update person1 set name=?, owner=?, price=?, qty=? where id=?"); //sql update query 
		pstmt.setString(1,name_up);
		pstmt.setString(2,owner_up);
		pstmt.setString(3,price_up);
		pstmt.setString(4,qty_up);
		pstmt.setInt(5,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>Update Records</title>
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
		
	<!--css for div main class and table-->
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
			<h1>Update Record</h1>
		</div>
		
		<table style="margin: auto;">	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbuser","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String name,owner,price,qty;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from person1 where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					name=rs.getString(2);
					owner=rs.getString(3);
					price=rs.getString(4);
					qty=rs.getString(5);
			%>
			<tr>
				<td>Name</td>
				<td><input type="text" name="txt_name" value="<%=name%>"></td>
			</tr>
			
			<tr>
				<td>Owner</td>
				<td><input type="text" name="txt_owner" value="<%=owner%>"></td>
			</tr>	
			
			<tr>
				<td>Price</td>
				<td><input type="text" name="txt_price" value="<%=price%>"></td>
			</tr>
			
			<tr>
				<td>Qty</td>
				<td><input type="text" name="txt_qty" value="<%=qty%>"></td>
			</tr>		
			
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<div style="text-align:center;">
			<h1><a href="index2.jsp">Back</a></h1>
		</div>
		
	</form>

	</div>
	
		

</body>

</html>