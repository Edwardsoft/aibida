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
	private ArrayList<Item> items;
	private String type;
	
	public String getMyOrders() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		User user=(User)session.get("user");  
		int pagesize=6;
		if(user==null) {
			return "myorders_E";
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
		
		
		HashMap<String,String> orderCar=(HashMap<String, String>)session.get("orderCar");
		
		Iterator iterator=orderCar.entrySet().iterator();
		IItem iitem=new ItemImpl();
		items=new ArrayList<>();
		while(iterator.hasNext()) {
			Map.Entry entry=(Map.Entry)iterator.next();
			String id=(String)entry.getKey();
			String amount=(String)entry.getValue();
			Item item=new Item();
			item=iitem.getItemById(id);
			item.setAmount(Integer.parseInt(amount));
			items.add(item);	
		}
		
		return "view_S";
	}
}
