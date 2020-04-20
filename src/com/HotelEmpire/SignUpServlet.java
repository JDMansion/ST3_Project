package com.HotelEmpire;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SignUpServlet extends HttpServlet {
	public SignUpServlet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thing:@localhost:1521:xe","Hotel","hotel");
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String dob = req.getParameter("dob");
			String gender = req.getParameter("gender");
			
			PreparedStatement stmt = con.prepareStatement("insert into hotel1 values(?,?,?,?,?)");
			stmt.setString(1, fullname);
			stmt.setString(2, email);
			stmt.setString(3, password);
			stmt.setString(4, dob);
			stmt.setString(5, gender);
			con.close();
			PrintWriter out = res.getWriter();
			out.println("Registration Successful");
		}
		catch (Exception e) {
			System.out.println();
		}
		
	}
}
