package aibida.web.controler;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class OrderCarAction {
	
	private String id;
	private String amount;
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getAmount() {
		return amount;
	}



	public void setAmount(String amount) {
		this.amount = amount;
	}



	public void addCar() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		HashMap<String,String> orderCar=(HashMap<String,String>)session.get("orderCar");
		if(orderCar==null) {
			orderCar=new HashMap<String,String>();
			System.out.println("初始hashmap======"+orderCar);
		}
		System.out.println("fds"+orderCar.toString());
		System.out.println("id====="+id);
		System.out.println("amount======="+amount);
		System.out.println(orderCar.size());
		if(Integer.parseInt(amount)>0) {
			orderCar.put(id, amount);
			System.out.println("fds"+orderCar.toString());
			session.put("orderCar", orderCar);
		}else {
			orderCar.remove(id);
			session.put("orderCar", orderCar);
		}
		System.out.println(orderCar.size());
	}
	
	public void deleteCar() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		session.remove("orderCar");
	}
	
}
