package com.findu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	
	/*private static String driver;
	private static String url;
	private static String username;
	private static String password;
	
	static{
		ResourceBundle rb=ResourceBundle.getBundle("dbinfo");
		driver=rb.getString("driver");
		url=rb.getString("url");
		username=rb.getString("username");
		password=rb.getString("password");
		
		//1.加载驱动 防止驱动被注册2次 避免依赖驱动jar
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}*/
	
	//得到数据源
	private static DataSource dataSource=new ComboPooledDataSource();

	public static DataSource getDataSource() {
		return dataSource;
	}

	//2.获取数据库连接（Connection 发送sql的桥梁）
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
		//return DriverManager.getConnection(url, user, password);
	}
	
	//4.释放资源
	public static void release(ResultSet rs, Statement stat, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (stat != null) {
			try {
				stat.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (conn != null){
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}