package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection conn;
	public static Connection getConnection() {
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345");
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return conn;

}
}
