package aibida.web.controler;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IEvaluate;
import aibida.web.dao.IItem;
import aibida.web.dao.IOrder;
import aibida.web.dao.IOrganazation;
import aibida.web.dao.IProject;
import aibida.web.dao.IUser;
import aibida.web.dao.impl.EvaluateImpl;
import aibida.web.dao.impl.ItemImpl;
import aibida.web.dao.impl.OrderIpml;
import aibida.web.dao.impl.OrganazationImpl;
import aibida.web.dao.impl.ProjectImpl;
import aibida.web.dao.impl.UserImpl;
import aibida.web.domain.Evaluate;
import aibida.web.domain.Item;
import aibida.web.domain.Order;
import aibida.web.domain.Organazation;
import aibida.web.domain.Project;
import aibida.web.domain.User;

public class Donate extends ActionSupport{
	private ArrayList<Project> projects;
	private String id;
	private ArrayList<User> users;
	private int total_remain_amount;
	private Organazation organazation;
	private ArrayList<Item> items;
	private Project project;
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ArrayList<User> getUsers() {
		return users;
	}

	public void setUsers(ArrayList<User> users) {
		this.users = users;
	}

	public int getTotal_remain_amount() {
		return total_remain_amount;
	}

	public void setTotal_remain_amount(int total_remain_amount) {
		this.total_remain_amount = total_remain_amount;
	}

	public Organazation getOrganazation() {
		return organazation;
	}

	public void setOrganazation(Organazation organazation) {
		this.organazation = organazation;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ArrayList<Evaluate> getEvaluates() {
		return evaluates;
	}

	public void setEvaluates(ArrayList<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}
	private ArrayList<Evaluate> evaluates;
	
	public ArrayList<Project> getProjects() {
		return projects;
	}

	public void setProjects(ArrayList<Project> projects) {
		this.projects = projects;
	}

	
	
	public String showAll() {
		// TODO Auto-generated method stub
		IProject iproject=new ProjectImpl();
		projects=iproject.searchProject("");
		return SUCCESS;
	}
	public String show() {
		IProject iproject=new ProjectImpl();
		project=iproject.getProjectById(id);
		IItem iitem=new ItemImpl();
		items=iitem.getItemByProjectId(Integer.parseInt(id));
		total_remain_amount=0;
		IOrder iorder=new OrderIpml();
		IEvaluate ievaluate=new EvaluateImpl();
		evaluates=new ArrayList<>();
		for(int i=0;i<items.size();i++) {
			int item_id=items.get(i).getId();
			total_remain_amount+=items.get(i).getRemain_amount();
			ArrayList<Order> orders=iorder.getOrders(item_id);
			for(int j=0;j<orders.size();j++) {
				int order_id=orders.get(j).getId();
				Evaluate evaluate=ievaluate.getEvaluate(order_id);
				if(evaluate!=null) {
					evaluates.add(evaluate);
				}
			}
		}
		users=new ArrayList<>();
		IUser iUser=new UserImpl();
		if(evaluates.isEmpty()) {
			evaluates=null;
		}else {
			for(int i=0;i<evaluates.size();i++) {
				int order_id=evaluates.get(i).getOrder_id();
				Order order=iorder.getOrderByid(order_id);
				int user_id=order.getUser_id();
				User user=iUser.getUser(user_id);
				if(user!=null) {
					users.add(user);
				}
			}
		}
		IOrganazation iorganazation=new OrganazationImpl();
		organazation=iorganazation.getOrganationById(project.getOrganazation_id());
		return SUCCESS;
	}
}
