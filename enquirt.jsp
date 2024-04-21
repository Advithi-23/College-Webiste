<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Data Insert </h1>
	<% 
		try 
		{
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String subject=request.getParameter("subject");
			String message=request.getParameter("message");
			
			
	
			String URL = "jdbc:mysql://localhost:3306/kit"; 
	
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, "root", "");
	
	%>
	
	<font size="+3" color="green">
	<% 
	out.println("Successfully connected <br>");
		
PreparedStatement ps=con.prepareStatement("insert into enquiry(name,email,subject,message) values(?,?,?,?)");		
					
	          ps.setString(1,name);
	          ps.setString(2,email);
	          ps.setString(3,subject);
	          ps.setString(4,message);
	          
	      
			 ps.executeUpdate();
			 
			out.println("data inserted to table");
			con.close();
	}
catch(Exception e)
{
	%>
	</font>
	<font size="+3" color="red">
	<%
	out.println("Unable to process:"+e);
}
	
	%>
</font>
	

</body>
</html>