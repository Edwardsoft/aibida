package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IVolunteer;
import aibida.web.domain.Volunteer;
import aibida.web.utils.JDBCUtil;

public class VolunteerImpl implements IVolunteer{

	@Override
	public Volunteer getVolunteer(int project_id) {
		Volunteer volunteer=null;
		String sql="select * from volunteer where project_id="+project_id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				volunteer=new Volunteer();
				volunteer.setProject_id(rs.getInt("project_id"));
				volunteer.setTotal_amount(rs.getInt("total_amount"));
				volunteer.setMan_amount(rs.getInt("man_amount"));
				volunteer.setWoman_amount(rs.getInt("woman_amount"));
				volunteer.setType(rs.getInt("type"));
				volunteer.setTotal_amount(rs.getInt("total_remain_amount"));
				volunteer.setMan_remain_amount(rs.getInt("man_remain_amount"));
				volunteer.setWoman_remain_amount(rs.getInt("woman_remain_amount"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return volunteer;
	}

	@Override
	public void decreaseAmount(int project_id, int sex, int type) {
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql=null;
		String sql1=null;
		if(type==1) {
			if(sex==0) {
				sql="update volunteer set man_remain_amount=man_remain_amount-1 where project_id="+project_id+";";
				sql1="update volunteer set total_remain_amount=total_remain_amount-1 where project_id="+project_id+";";
			}else {
				sql="update volunteer set woman_remain_amount=woman_remain_amount-1 where project_id="+project_id+";";
				sql1="update volunteer set total_remain_amount=total_remain_amount-1 where project_id="+project_id+";";
			}
		}else {
			sql="update volunteer set total_remain_amount=total_remain_amount-1 where project_id="+project_id+";";
		}
		try {
			if(type==1) {
				st.execute(sql);
				st.execute(sql1);
			}else {
				st.execute(sql);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		
		
	}
	
}
