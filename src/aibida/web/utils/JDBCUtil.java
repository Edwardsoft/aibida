package aibida.web.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	private static final String URL="jdbc:mysql://localhost:3306/aibida_db";       //URL
	private static final String USERNAME="root";                                   //用户名
	private static final String PASSWORD="li202202";                               //密码
	private static final String DRIVER="com.mysql.jdbc.Driver";                    //MYSQL驱动
	
	static {   //ע��MYSQL����
		try {
			Class.forName(DRIVER);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//获取数据库连接
	public static Connection getConnection() {
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(URL, USERNAME, PASSWORD);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	
	//关闭数据库连接
	public static void closeConnection(Connection conn) {
		try{
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//获取Statement
	public static Statement getStatement(Connection conn) {
		Statement st=null;
		try {
			st=conn.createStatement();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return st;
	}
	
	//关闭Statement
	public static void closeStatement(Statement st) {
		try {
			st.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//获取结果集
	public static ResultSet getResultSet(String sql,Statement st) {
		ResultSet rs=null;
		try {
			rs=st.executeQuery(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	//关闭结果集
	public static void closeResultSet(ResultSet rs) {
		try {
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
