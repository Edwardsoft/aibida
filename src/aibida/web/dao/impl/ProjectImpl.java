package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IProject;
import aibida.web.domain.Project;
import aibida.web.utils.JDBCUtil;

public class ProjectImpl implements IProject{

	@Override
	public ArrayList<Project> getAllProjects() {
		ArrayList<Project> projects=new ArrayList<>();
		String sql="select * from project;";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Project project=new Project();
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setDescription(rs.getString("description"));
				project.setImg(rs.getString("img"));
				project.setOrganazation_id(rs.getInt("organazation_id"));
				project.setCreate_time(rs.getTimestamp("create_time"));
				project.setCutoff_time(rs.getTimestamp("cutoff_time"));
				projects.add(project);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return projects;
	}

	@Override
	public Project getProjectById(String id) {
		Project project=null;
		String sql="select * from project where id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				project=new Project();
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setDescription(rs.getString("description"));
				project.setImg(rs.getString("img"));
				project.setOrganazation_id(rs.getInt("organazation_id"));
				project.setCreate_time(rs.getTimestamp("create_time"));
				project.setCutoff_time(rs.getTimestamp("cutoff_time"));
				project.setType(rs.getInt("type"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return project;
	}

	@Override
	public ArrayList<Project> getProjects(int type) {
		ArrayList<Project> projects=new ArrayList<>();
		String sql="select * from project where type="+type+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Project project=new Project();
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setDescription(rs.getString("description"));
				project.setImg(rs.getString("img"));
				project.setOrganazation_id(rs.getInt("organazation_id"));
				project.setCreate_time(rs.getTimestamp("create_time"));
				project.setCutoff_time(rs.getTimestamp("cutoff_time"));
				project.setType(rs.getInt("type"));
				projects.add(project);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return projects;
	}

	@Override
	public ArrayList<Project> searchProject(String content) {
		ArrayList<Project> projects=new ArrayList<>();
		String sql="select * from project where name like '%"+content+"%' and type !=3;";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Project project=new Project();
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setDescription(rs.getString("description"));
				project.setImg(rs.getString("img"));
				project.setOrganazation_id(rs.getInt("organazation_id"));
				project.setCreate_time(rs.getTimestamp("create_time"));
				project.setCutoff_time(rs.getTimestamp("cutoff_time"));
				project.setType(rs.getInt("type"));
				projects.add(project);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return projects;
	}

	@Override
	public ArrayList<Project> searchProject(String content, int type) {
		ArrayList<Project> projects=new ArrayList<>();
		String sql="select * from project where name like '%"+content+"%' and type="+type+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Project project=new Project();
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setDescription(rs.getString("description"));
				project.setImg(rs.getString("img"));
				project.setOrganazation_id(rs.getInt("organazation_id"));
				project.setCreate_time(rs.getTimestamp("create_time"));
				project.setCutoff_time(rs.getTimestamp("cutoff_time"));
				project.setType(rs.getInt("type"));
				projects.add(project);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return projects;
	}
	
}
