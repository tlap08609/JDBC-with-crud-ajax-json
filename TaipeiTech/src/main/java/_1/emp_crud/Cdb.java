package _1.emp_crud;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Cdb {

	public static void main(String[] args) throws SQLException {
		DatabaseMetaData md = conn.getMetaData();
	    ResultSet rs = md.getTables(null, null, "%", null);
	    while (rs.next()) {
	      System.out.println(rs.getString(3));
	    }  }

	  static Connection conn;

	  static Statement st;

	  static {
	    try {
	      // Step 1: Load the JDBC driver.
	      Class.forName("com.mysql.jdbc.Driver");
	      System.out.println("Driver Loaded.");
	      // Step 2: Establish the connection to the database.
	      String url = "jdbc:mysql://127.0.0.1/jdbcpra";

	      conn = DriverManager.getConnection(url, "root", "student");
	      System.out.println("Got Connection.");

	      st = conn.createStatement();
	    } catch (Exception e) {
	      System.err.println("Got an exception! ");
	      e.printStackTrace();
	      System.exit(0);}

	}

}
