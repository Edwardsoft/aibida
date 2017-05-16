package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IItem;
import aibida.web.domain.Item;
import aibida.web.domain.Order;
import aibida.web.utils.JDBCUtil;

public class ItemImpl implements IItem{

	public ArrayList<Item> getItemByProjectId(int id) {
		ArrayList<Item> items=new ArrayList<>();
		String sql="select * from item_list where project_id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Item item=new Item();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setAmount(rs.getInt("amount"));
				item.setProject_id(rs.getInt("project_id"));
				item.setRemark(rs.getString("remark"));
				item.setRemain_amount(rs.getInt("remain_amount"));
				items.add(item);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return items;
	}

	@Override
	public Item getItemById(String id) {
		Item item=null;
		String sql="select * from item_list where id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				item=new Item();
				item.setId(rs.getInt("id"));
				item.setName(rs.getString("name"));
				item.setProject_id(rs.getInt("project_id"));
				item.setAmount(rs.getInt("amount"));
				item.setRemark(rs.getString("remark"));
				item.setRemain_amount(rs.getInt("remain_amount"));
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return item;
	}

	@Override
	public int getRemainAmount(int id) {
		int remainamount=0;
		String sql="select remain_amount from item_list where id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				remainamount=rs.getInt("remain_amount");
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return remainamount;
	}

	@Override
	public int getAmount(int id) {
		int amount=0;
		String sql="select amount from item_list where id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				amount=rs.getInt("amount");
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return amount;
	}

	@Override
	public void decreaseRemainAmount(int id) {
		String sql="update item_list set remain_amount=remain_amount-1 where id="+id+";";
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

	
	
}
