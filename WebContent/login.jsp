<%@ page import= "java.sql.*"%>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");
boolean flag = false;
boolean flag1 = false;

try {
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Hotel","hotel");
	PreparedStatement stmt = conn.prepareStatement("select email from empire");
	ResultSet rs = stmt.executeQuery();
	while(rs.next()) {
		if(email.equals(rs.getString(1))) {
			flag = true;
		}
	}
	if(flag == true) {
		
	}
	else {
		out.print("User doesn't Exist, Please SignUp");
	}
	PreparedStatement stmt1 = conn.prepareStatement("select password from empire where email = '"+email+"' ");
	ResultSet rs1 = stmt1.executeQuery();
	
	while(rs1.next()) {
		if(password.equals(rs1.getString(1))) {
			flag1 = true;
		}
	}
	
	if(flag1 == true) {
		out.print("Welcome to empire");
	}
	else {
		out.print("Wrong Password, LogIn Again");
	}
}

catch(Exception e) {
	out.print(e);
}

%>
