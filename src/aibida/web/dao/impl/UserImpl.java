package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import aibida.web.dao.IUser;
import aibida.web.domain.User;
import aibida.web.utils.JDBCUtil;
import aibida.web.utils.Md5;

public class UserImpl implements IUser{
	public User findUser(String username, String password) {
		User user=null;
		username=Md5.EncodingByMd5(username);
		password=Md5.EncodingByMd5(password);
		Connection conn=JDBCUtil.getConnection();  //鑾峰彇鏁版嵁搴撹繛鎺�
		Statement st=JDBCUtil.getStatement(conn);  //鑾峰彇Statement瀵硅薄
		String sql="select * from user where (username='"+username+"' or telephone='"+username+"' or email='"+username+"') and password='"+password+"';";
		System.out.println(username);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);  //鏌ヨ缁撴灉
		try {
			if(rs.next()) {
				int id=rs.getInt("id");
				String userName=rs.getString("username");
				String passWord=rs.getString("password");
				String telephone=rs.getString("telephone");
				String email=rs.getString("email");
				int rank=rs.getInt("rank");
				String qq=rs.getString("qq");
				String wechat=rs.getString("wechat");
				String microblog=rs.getString("microblog");
				String avatar=rs.getString("avatar");
				int isCheck=rs.getInt("isCheck");
				String nickname=rs.getString("nickname");
				user=new User(id, userName, passWord, telephone, email, rank, qq, wechat, microblog,avatar,isCheck,nickname);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return user;
	}
	
	//添加用户
	public void addUser(User user) {
		String username=user.getUserName();
		String password=user.getPassWord();
		username=Md5.EncodingByMd5(username);
		password=Md5.EncodingByMd5(password);
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="insert into user(username,password,email) values('"+username+"','"+password+"','"+user.getEmail()+"');";
		try {
			st.execute(sql);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
			
		}
	}
	
	
	public boolean searchUser(String username) {
		boolean result=false;
		username=Md5.EncodingByMd5(username);
		System.out.println(username);
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="select * from user where username='"+username+"';";
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				result=true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return result;
	}

	@Override
	public boolean findUserByEmail(String email) {
		boolean result=false;
		String sql="select * from user where email='"+email+"' and ischeck=1";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				result=true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return result;
	}

	@Override
	public boolean isCheck(String username) {
		boolean result=false;
		username=Md5.EncodingByMd5(username);
		String sql="select * from user where username ='"+username+"' and ischeck=1";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				result=true;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return result;
	}

	@Override
	public void activeUser(String username) {
		username=Md5.EncodingByMd5(username);
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="update user set ischeck=1 where username='"+username+"'";
		try {
			st.executeQuery(sql);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		
	}

	@Override
	public User addQQUser(String qq_id,String username,String avatar) {
		String sql="insert into user (username,qq,avatar) values('"+username+"','"+qq_id+"','"+avatar+"');";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		Statement st1=JDBCUtil.getStatement(conn);
		ResultSet rs=null;
		String sql1="select * from user where qq='"+qq_id+"';";
		User user=null;
		try {
			st1.execute(sql);
			rs=JDBCUtil.getResultSet(sql1, st);
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setUserName(username);
				user.setQq(qq_id);
				user.setAvatar(avatar);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeStatement(st1);
			JDBCUtil.closeConnection(conn);
		}
		return user;
	}
	
	public static void main(String[] args) {
		UserImpl i=new UserImpl();
		i.addQQUser("13456", "心醉欲不休丶", "img/7");
	}

	@Override
	public User getUser(int user_id) {
		String sql="select * from user where id="+user_id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		User user=null;
		try {
			if(rs.next()) {
				int id=rs.getInt("id");
				String userName=rs.getString("username");
				String passWord=rs.getString("password");
				String telephone=rs.getString("telephone");
				String email=rs.getString("email");
				int rank=rs.getInt("rank");
				String qq=rs.getString("qq");
				String wechat=rs.getString("wechat");
				String microblog=rs.getString("microblog");
				String avatar=rs.getString("avatar");
				int isCheck=rs.getInt("isCheck");
				String nickname=rs.getString("nickname");
				user=new User(id, userName, passWord, telephone, email, rank, qq, wechat, microblog,avatar,isCheck,nickname);	
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return user;
	}
}
