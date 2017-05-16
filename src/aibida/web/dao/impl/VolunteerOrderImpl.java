package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IVolunteerOrder;
import aibida.web.domain.VolunteerOrder;
import aibida.web.utils.JDBCUtil;

public class VolunteerOrderImpl implements IVolunteerOrder{

	@Override
	public void addVolunteerOrder(int user_id, int project_id,String name,String telephone,int sex) {
		String sql="insert into volunteer_order (user_id,project_id,status,name,telephone,sex) values ('"+user_id+"','"+project_id+"',1,'"+name+"','"+telephone+"',"+sex+");";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		try {
			st.execute(sql);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
	}

	@Override
	public ArrayList<VolunteerOrder> getVolunteerOrders(int user_id) {
		ArrayList<VolunteerOrder> volunteerOrders=new ArrayList<>();
		String sql="select * from volunteer_order where user_id="+user_id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				VolunteerOrder volunteerOrder=new VolunteerOrder();
				volunteerOrder.setUser_id(user_id);
				volunteerOrder.setProject_id(rs.getInt("project_id"));
				volunteerOrder.setStatus(rs.getInt("status"));
				volunteerOrder.setInsert_time(rs.getTimestamp("insert_time"));
				volunteerOrder.setSex(rs.getInt("sex"));
				volunteerOrder.setName(rs.getString("name"));
				volunteerOrder.setTelephone(rs.getString("telephone"));
				volunteerOrders.add(volunteerOrder);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		
		return volunteerOrders;
	}

}
