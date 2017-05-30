package aibida.web.controler;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IOrganazation;
import aibida.web.dao.impl.OrganazationImpl;
import aibida.web.domain.Organazation;

public class OrganazationAction extends ActionSupport{
	private String username;
	private String password;
	private String email;
	
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

	public String login() {
		IOrganazation iOrganazation=new OrganazationImpl();
		Organazation organazation;
		if((organazation=iOrganazation.getOrnazation(username, password))!=null) {
			Map session=ActionContext.getContext().getSession();
			session.put(organazation, organazation);
			return "Login_S";
		}
		return "Login_F";
		
		
	}
}
