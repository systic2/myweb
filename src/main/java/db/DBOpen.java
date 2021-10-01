package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
	public Connection getConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String id = "scott";
		String pw = "tiger";

		System.out.println("dbopen start");
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("connect");
		} catch (ClassNotFoundException e) {
			System.out.println("oracle jdbc driver not found.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
