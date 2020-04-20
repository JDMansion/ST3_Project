<%@ page import= "java.sql.*"%>

<%
String fullname = request.getParameter("fullname");
String email = request.getParameter("email");
String password = request.getParameter("password");
String dob = request.getParameter("dob");
String gender = request.getParameter("gender");

try {
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Hotel","hotel");
	PreparedStatement ps = conn.prepareStatement("insert into empire values(?,?,?,?,?)");
	ps.setString(1,fullname);
	ps.setString(2,email);
	ps.setString(3,password);
	ps.setString(4,dob);
	ps.setString(5,gender);
	int x = ps.executeUpdate();
	if(x!=0) {
		out.print("SignUp done Successfully");
	}
	else {
		out.print("Something went wrong");
	}
}

catch(Exception e) {
	out.print(e);
}

%>