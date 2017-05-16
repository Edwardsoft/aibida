package aibida.web.controler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IItem;
import aibida.web.dao.IOrder;
import aibida.web.dao.impl.ItemImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.domain.Item;
import aibida.web.domain.Order;
import aibida.web.domain.User;

public class OrderAction extends ActionSupport{
	private ArrayList<Order> orders;
	private int page;
	private int pageamount;
	private String type;
	private String name;
	private String telephone;
	private String address;
	private ArrayList<Item> items;
	
	
	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public ArrayList<Order> getOrders() {
		return orders;
	}

	public void setOrders(ArrayList<Order> orders) {
		this.orders = orders;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageamount() {
		return pageamount;
	}

	public void setPageamount(int pageamount) {
		this.pageamount = pageamount;
	}



	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMyOrders() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		User user=(User)session.get("user");  
		int pagesize=6;
		if(user==null) {
			return "NoLogin";
		}
		int user_id=user.getId();
		IOrder iOrder=new OrderIpml();
		orders=iOrder.getOrder(user_id);
		int size=orders.size();
		int pageamount=0;
		if(size%pagesize==0) {
			pageamount=size/pagesize;
		}else {
			pageamount=size/pagesize+1;
		}
		if(page==0) {
			page=1;
		}
		orders=iOrder.getOrders(user_id,pagesize,page);
		IItem iitem=new ItemImpl();
		items=new ArrayList<>();
		System.out.println("order.size=="+orders.size());
		for(int i=0;i<orders.size();i++) {
			int item_id=orders.get(i).getItem_id();
			Item item=iitem.getItemById(item_id+"");
			items.add(item);
		}	
		return "myorders_S";
	}
	
	public String view() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		User user=(User)session.get("user");  
		if(user==null) {
			return "NoLogin";
		}
		
		HashMap<String,String> orderCar=(HashMap<String, String>)session.get("orderCar");
		
		Iterator iterator=orderCar.entrySet().iterator();
		IItem iitem=new ItemImpl();
		ArrayList<Item> items=new ArrayList<>();
		while(iterator.hasNext()) {
			Map.Entry entry=(Map.Entry)iterator.next();
			String id=(String)entry.getKey();
			String amount=(String)entry.getValue();
			Item item=new Item();
			item=iitem.getItemById(id);
			item.setAmount(Integer.parseInt(amount));
			items.add(item);	
		}
		session.put("items", items);
		return "view_S";
	}
	
	public String submitOrder() {
		
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		User user=(User)session.get("user");  
		if(user==null) {
			return "NoLogin";
		}
		
		
		IOrder iorder=new OrderIpml();
		int user_id=user.getId();
		
		IItem iitem=new ItemImpl();
		
		ArrayList<Item> items=(ArrayList<Item>)session.get("items");
		for(int i=0;i<items.size();i++) {
			Item item=items.get(i);
			int item_id=item.getId();
			for(int j=0;j<item.getAmount();j++) {
				int item_order_id=iitem.getAmount(item_id)-iitem.getRemainAmount(item_id)+1;
				System.out.println(item_order_id);
				Order order=new Order();
				order.setUser_id(user_id);
				order.setItem_id(item_id);
				order.setItem_order_id(item_order_id);
				order.setName(name);
				order.setTelephone(telephone);
				order.setAddress(address);
				order.setStatus(1);
				iorder.addOrder(order);
				iitem.decreaseRemainAmount(item_id);
			}
		}
		session.remove("items");

		return "order_S";
	}
	
}
