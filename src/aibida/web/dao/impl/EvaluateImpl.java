package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IOrder;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Order;
import aibida.web.utils.JDBCUtil;

public class EvaluateImpl implements IEvaluate{

	@Override
	public void addEvaluate(Evaluate evaluate) {
		// TODO Auto-generated method stub
		int order_id=evaluate.getOrder_id();
		int point=evaluate.getPoint();
		String evaluation=evaluate.getEvaluation();
		String sql="insert into evaluate (order_id,point,evaluation) values ("+order_id+","+point+",'"+evaluation+"');";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		try {
			st.execute(sql);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
	}

	@Override
	public ArrayList<Evaluate> getAllEvaluate(int user_id) {
		ArrayList<Evaluate> evaluates=new ArrayList<>();
		IOrder iorder=new OrderIpml();
		ArrayList<Order> orders=iorder.getOrder(user_id);
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		for(int i=0;i<orders.size();i++) {
			int order_id=((Order)orders.get(i)).getId();
			String sql="select * from evaluate where order_id="+order_id+";";
			ResultSet rs=JDBCUtil.getResultSet(sql, st);
			try {
				while(rs.next()) {
					Evaluate evaluate=new Evaluate();
					evaluate.setId(rs.getInt("id"));
					evaluate.setOrder_id(rs.getInt("order_id"));
					evaluate.setEvaluation(rs.getString("evaluation"));
					evaluate.setPoint(rs.getInt("point"));
					evaluate.setInsert_time(rs.getTimestamp("insert_time"));
					evaluates.add(evaluate);
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				JDBCUtil.closeResultSet(rs);
			}
		}
		JDBCUtil.closeStatement(st);
		JDBCUtil.closeConnection(conn);
		return evaluates;
	}

	@Override
	public Evaluate getEvaluate(int order_id) {
		Evaluate evaluate=null;
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		String sql="select * from evaluate where order_id="+order_id+";";
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				evaluate=new Evaluate();
				evaluate.setId(rs.getInt("id"));
				evaluate.setOrder_id(rs.getInt("order_id"));
				evaluate.setEvaluation(rs.getString("evaluation"));
				evaluate.setPoint(rs.getInt("point"));
				evaluate.setInsert_time(rs.getTimestamp("insert_time"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
		}
		JDBCUtil.closeStatement(st);
		JDBCUtil.closeConnection(conn);
		return evaluate;
	}
	
}
