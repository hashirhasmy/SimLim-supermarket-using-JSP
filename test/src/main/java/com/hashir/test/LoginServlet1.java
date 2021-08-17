package com.hashir.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hashir.test.model.User;
import com.mysql.cj.jdbc.Driver;

@SuppressWarnings("serial")
public class LoginServlet1 extends HttpServlet {
	
	PrintWriter writer = null;
	String email = null;
	String password = null;
	String username = "username";
	String logged_in = "logged_in"; 
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		HttpSession session = req.getSession();
		writer = (PrintWriter) res.getWriter();
		
		
		email = req.getParameter("u-email");
		password = req.getParameter("u-password");
		
		try {
					
			System.out.println("Rows --- > "+email);
				
			Connection connection = Configurations.getDbConnection();
			
			String sql = "SELECT * FROM user WHERE uemail = ? AND upass = ?";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet resultSet = statement.executeQuery();
				
			while(resultSet.next()) {
							
				int dbId = resultSet.getInt("uid");
				String dbemail = resultSet.getString("uemail");
				String dbpassword = resultSet.getString("upass");
				String dbName = resultSet.getString("uname");
				String dbGender = resultSet.getString("ugender");
				int dbAge = resultSet.getInt("uage");
				String dbRole = resultSet.getString("urole");
				String dbImg = resultSet.getString("img_url");
				
				User user = new User();
				user.setId(dbId);
				user.setEmail(dbemail);
				user.setPassword(dbpassword);
				user.setUsername(dbName);
				user.setGender(dbGender);
				user.setAge(dbAge);
				user.setRole(dbRole);
				user.setImgURL(dbImg);
						
				if(email.equals(dbemail) && password.equals(dbpassword)) {
				
					session.setAttribute("user", user);
					session.setAttribute(logged_in, true);
					
					String data = URLEncoder.encode("Hello CSD63! @$", "utf-8");
					
					Cookie cookie = new Cookie("welcome", data);
					Cookie cookie1 = new Cookie("u-email", URLEncoder.encode(user.getEmail(), "utf-8"));
					cookie.setMaxAge(60); // 30 seconds.
					cookie1.setMaxAge(120); // 30 seconds.
					res.addCookie(cookie);
					res.addCookie(cookie1);
							
					res.sendRedirect("index1.jsp");
				} else {
					
					session.setAttribute(logged_in, false);
					
					RequestDispatcher rDispatcher = req.getRequestDispatcher("login1.jsp");
					rDispatcher.forward(req, res);
				}	
			}
			
			connection.close();

		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("SQL ERROR "+ex.getMessage());
		}
	}
}
