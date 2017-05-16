package aibida.web.controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aibida.web.dao.IItem;
import aibida.web.dao.IOrder;
import aibida.web.dao.IUser;
import aibida.web.dao.impl.ItemImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.dao.impl.UserImpl;
import aibida.web.domain.Item;
import aibida.web.domain.Order;
import aibida.web.domain.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getParameter("method");
		if(method.equals("OrderPage")) {
			String type=request.getParameter("type");
			request.setAttribute("type",type);
			HashMap<String,String> orderCar=(HashMap<String, String>) request.getSession().getAttribute("orderCar");
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
			request.getSession().setAttribute("items",items);
			request.getRequestDispatcher("ordercheck.jsp").forward(request, response);
			
		}else if(method.equals("submitOrder")) {
			IOrder iorder=new OrderIpml();
			int user_id=((User)request.getSession().getAttribute("user")).getId();
			String name=request.getParameter("name");
			String telephone=request.getParameter("telephone");
			String address=request.getParameter("address");
			IItem iitem=new ItemImpl();
			ArrayList<Item> items=(ArrayList<Item>)request.getSession().getAttribute("items");
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
			request.getSession().removeAttribute("items");
			request.getRequestDispatcher("ordercomplete.jsp").forward(request, response);;
		}else if(method.equals("show")) {
			IItem iitem=new ItemImpl();
			IOrder iorder=new OrderIpml();
			int id=Integer.parseInt(request.getParameter("id"));
			Order order=iorder.getOrderByid(id);
			int item_id=order.getItem_id();
			Item item=iitem.getItemById(item_id+"");
			request.setAttribute("order", order);
			request.setAttribute("item", item);
			request.getRequestDispatcher("order.jsp").forward(request, response);
		}else if(method.equals("myOrders")) {
			int pagesize=6;
			if(request.getParameter("user")==null) {
				request.getRequestDispatcher("user_error.jsp");
			}
			int user_id=Integer.parseInt(request.getParameter("user_id"));
			IOrder iOrder=new OrderIpml();
			ArrayList<Order> orders=iOrder.getOrder(user_id);
			int size=orders.size();
			int pageamount=0;
			if(size%pagesize==0) {
				pageamount=size/pagesize;
			}else {
				pageamount=size/pagesize+1;
			}
			int page;
			if(request.getParameter("page")==null) {
				page=1;
				request.setAttribute("page", page);
				orders=iOrder.getOrders(user_id,pagesize,page);
			}else {
				page=Integer.parseInt(request.getParameter("page"));
				orders=iOrder.getOrders(user_id,pagesize,page);
			}
			IItem iitem=new ItemImpl();
			ArrayList<Item> items=new ArrayList<>();
			System.out.println("order.size=="+orders.size());
			for(int i=0;i<orders.size();i++) {
				int item_id=orders.get(i).getItem_id();
				Item item=iitem.getItemById(item_id+"");
				items.add(item);
			}
			request.setAttribute("page", page);
			request.setAttribute("pageamount",pageamount);
			request.setAttribute("items",items);
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("myorders.jsp").forward(request, response);
		}else if(method.equals("cancelOrder")) {
			int order_id=Integer.parseInt(request.getParameter("order_id"));
			IOrder iOrder=new OrderIpml();
			iOrder.changeStatus(0, order_id);
			response.getWriter().write("true");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
