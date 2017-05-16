package aibida.web.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import aibida.web.dao.IOrder;
import aibida.web.domain.Order;
import aibida.web.utils.JDBCUtil;

public class OrderIpml implements IOrder{

	@Override
	public void addOrder(Order order) {
		int user_id=order.getUser_id();
		int item_id=order.getItem_id();
		int item_order_id=order.getItem_order_id();
		String name=order.getName();
		String telephone=order.getTelephone();
		String address=order.getAddress();
		int status=order.getStatus();
		String sql="insert into order_tb (user_id,item_id,item_order_id,name,telephone,address,status) values ("+user_id+","+item_id+","+item_order_id+",'"+name+"','"+telephone+"','"+address+"',"+status+");";
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
	public ArrayList<Order> getOrder(int user_id) {
		ArrayList<Order> orders=new ArrayList<>();
		String sql="select * from order_tb where user_id="+user_id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Order order=new Order();
				order.setId(rs.getInt("id"));
				order.setUser_id(user_id);
				order.setItem_id(rs.getInt("item_id"));
				order.setItem_order_id(rs.getInt("item_order_id"));
				order.setName(rs.getString("name"));
				order.setTelephone(rs.getString("telephone"));
				order.setAddress(rs.getString("address"));
				order.setInsert_time(rs.getTimestamp("insert_time"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return orders;
	}

	@Override
	public Order getOrder(int user_id, int item_id, int item_order_id) {
		Order order=null;
		String sql="select * from order_tb where user_id="+user_id+" and item_id="+item_id+" and item_order_id="+item_order_id+"  ;";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				order=new Order();
				order.setId(rs.getInt("id"));
				order.setUser_id(user_id);
				order.setItem_id(item_id);
				order.setItem_order_id(item_order_id);
				order.setName(rs.getString("name"));
				order.setTelephone(rs.getString("telephone"));
				order.setAddress(rs.getString("address"));
				order.setStatus(rs.getInt("status"));
				order.setInsert_time(rs.getTimestamp("insert_time"));
				
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return order;
	}

	@Override
	public Order getOrderByid(int id) {
		Order order=null;
		String sql="select * from order_tb where id="+id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			if(rs.next()) {
				order=new Order();
				order.setId(rs.getInt("id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setItem_id(rs.getInt("item_id"));
				order.setItem_order_id(rs.getInt("item_order_id"));
				order.setName(rs.getString("name"));
				order.setTelephone(rs.getString("telephone"));
				order.setAddress(rs.getString("address"));
				order.setStatus(rs.getInt("status"));
				order.setInsert_time(rs.getTimestamp("insert_time"));
				
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return order;
	}

	@Override
	public void changeStatus(int status,int order_id) {
		String sql="update order_tb set status="+status+" where id="+order_id+";";
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
	public ArrayList<Order> getOrders(int item_id) {
		ArrayList<Order> orders=new ArrayList<>();
		String sql="select * from order_tb where item_id="+item_id+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Order order=new Order();
				order.setId(rs.getInt("id"));
				orders.add(order);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return orders;
	}

	@Override
	public ArrayList<Order> getOrders(int user_id, int pagesize,int nowpage) {
		ArrayList<Order> orders=new ArrayList<>();
		int begin=(nowpage-1)*pagesize;
		String sql="select * from order_tb where user_id="+user_id+" limit "+begin+","+pagesize+";";
		Connection conn=JDBCUtil.getConnection();
		Statement st=JDBCUtil.getStatement(conn);
		ResultSet rs=JDBCUtil.getResultSet(sql, st);
		try {
			while(rs.next()) {
				Order order=new Order();
				order.setId(rs.getInt("id"));
				order.setUser_id(rs.getInt("user_id"));
				order.setItem_id(rs.getInt("item_id"));
				order.setItem_order_id(rs.getInt("item_order_id"));
				order.setName(rs.getString("name"));
				order.setTelephone(rs.getString("telephone"));
				order.setAddress(rs.getString("address"));
				order.setStatus(rs.getInt("status"));
				order.setInsert_time(rs.getTimestamp("insert_time"));
				orders.add(order);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(st);
			JDBCUtil.closeConnection(conn);
		}
		return orders;
	}


}
