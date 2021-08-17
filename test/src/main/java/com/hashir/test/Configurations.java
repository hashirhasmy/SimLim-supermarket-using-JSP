package com.hashir.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class Configurations {
	
	private static String dB_URL = "jdbc:mysql://localhost/dbuser";
	private static String USER = "root";
	private static String PASSWORD = "";
	
	public static Connection getDbConnection() {
		
		Connection connection = null;
		
		try {
			Driver driver = new Driver();
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection(dB_URL, USER, PASSWORD);
			return connection;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
	}
 
}
