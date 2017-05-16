package aibida.web.dao.impl;

import aibida.web.dao.IOrganazation;
import aibida.web.domain.Item;
import aibida.web.domain.Organazation;
import aibida.web.utils.JDBCUtil;
import aibida.web.utils.Md5;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OrganazationImpl implements IOrganazation{
	public ArrayList<Organazation> getAllOrganazation() {
		ArrayList<Organazation> organazations=new ArrayList<>();
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="select * from organazation;";
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Organazation organazation=new Organazation();
				organazation.setId(rs.getInt("id"));
				organazation.setName(rs.getString("name"));
				organazation.setPassword(rs.getString("password"));
				organazation.setEmail(rs.getString("email"));
				organazations.add(organazation);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return organazations;
	}

	@Override
	public Organazation getOrnazation(String username, String password) {
		username=Md5.EncodingByMd5(username);
		password=Md5.EncodingByMd5(password);
		String sql="select * from organazation where username='"+username+"' and password='"+password+"';";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Organazation getOrganationById(int id) {
		Organazation organazation=null;
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="select * from organazation where id="+id+";";
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				organazation=new Organazation();
				organazation.setId(rs.getInt("id"));
				organazation.setName(rs.getString("name"));
				organazation.setPassword(rs.getString("password"));
				organazation.setEmail(rs.getString("email"));
				organazation.setTelephone(rs.getString("telephone"));
				organazation.setAvatar(rs.getString("avatar"));
				organazation.setSynopsis(rs.getString("synopsis"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return organazation;
	}
}
