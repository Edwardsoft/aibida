package aibida.web.controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IOrder;
import aibida.web.dao.IUser;
import aibida.web.dao.IVolunteerOrder;
import aibida.web.dao.impl.EvaluateImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.dao.impl.UserImpl;
import aibida.web.dao.impl.VolunteerOrderImpl;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Order;
import aibida.web.domain.User;
import aibida.web.domain.VolunteerOrder;
import aibida.web.utils.Mail;

public class UserAction extends ActionSupport{
	private String username;
	private String password;
	private String email;
	private String company;
	private ArrayList<Order> orders;
	private ArrayList<Evaluate> evaluates;
	private ArrayList<VolunteerOrder> volunteerOrders;
	
	
	public ArrayList<Order> getOrders() {
		return orders;
	}

	public void setOrders(ArrayList<Order> orders) {
		this.orders = orders;
	}

	public ArrayList<Evaluate> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(ArrayList<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}

	public ArrayList<VolunteerOrder> getVolunteerOrders() {
		return volunteerOrders;
	}

	public void setVolunteerOrders(ArrayList<VolunteerOrder> volunteerOrders) {
		this.volunteerOrders = volunteerOrders;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	private User user;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void login() throws IOException {        //登录
		IUser iuser=new UserImpl();                        
		user=iuser.findUser(username, password);         
		HttpServletResponse response = ServletActionContext.getResponse();
	    PrintWriter writer = response.getWriter();
		if(user==null) {
			writer.write("false");
		}else {
			writer.write("true");
			user.setUserName(username);
			ActionContext actioncontext=ActionContext.getContext();
			Map session=actioncontext.getSession();
			session.put("user", user); 
		}
		writer.close();
	}
	
	public void register() throws IOException {    //注册账号

		IUser iuser=new UserImpl();	
		user=new User();
		user.setUserName(username);
		user.setPassWord(password);
		user.setEmail(email);
		iuser.addUser(user);
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		session.put("user", user);
	}
	
	public void checkUserName() throws IOException{    //检查用户名是否可用
		IUser iuser=new UserImpl();
		HttpServletResponse response = ServletActionContext.getResponse();
	    PrintWriter writer = response.getWriter();
		if(iuser.searchUser(username)) {
			writer.write("true");
		}else {
			writer.write("false");
		}
	}
	
	public String checkEmail() throws IOException {      //检查邮箱
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		user=(User)session.get("user");
		email=user.getEmail();
		username=user.getUserName();
		Mail.sendMail(email, username);
		String company=null;
		String emailtype=email.split("@")[1];
		if(emailtype.equals("qq.com")) {
			company="mail.qq.com";
		}
		System.out.println("================");
		System.out.println(company);
		System.out.println("================");
		return "email_S";
		
	}
	
	public String logout() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		session.remove("user");
		return "logout_S";
	}
	
	public String show() {
		ActionContext actioncontext=ActionContext.getContext();
		Map session=actioncontext.getSession();
		if(session.get("user")==null) {
			return "show_E";
		}
		user=(User)session.get("user");
		int user_id=user.getId();
		IOrder iorder=new OrderIpml();
		orders=iorder.getOrder(user_id);
		if(orders.isEmpty()) {
			orders=null;
		}
		IEvaluate ievaluate=new EvaluateImpl();
		evaluates=ievaluate.getAllEvaluate(user_id);
		if(evaluates.isEmpty()) {
			evaluates=null;
		}
		IVolunteerOrder iVolunteerOrder=new VolunteerOrderImpl();
		volunteerOrders=iVolunteerOrder.getVolunteerOrders(user_id);
		if(volunteerOrders.isEmpty()) {
			volunteerOrders=null;
		}
		return "show_S";
	}
	
 }
