package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.Order;

public interface IOrder {
	public void addOrder(Order order);
	public ArrayList<Order> getOrder(int user_id);
	public Order getOrder(int user_id,int item_id,int item_order_id);
	public Order getOrderByid(int id);
	public void changeStatus(int status,int order_id);
	public ArrayList<Order> getOrders(int item_id);
	public ArrayList<Order> getOrders(int user_id,int pagesize,int nowpage);
}
