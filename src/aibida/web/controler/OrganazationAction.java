package aibida.web.controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

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

	public void login() throws IOException{
		System.out.println(username+" "+password);
		System.out.println("fsfsfasd");
		IOrganazation iOrganazation=new OrganazationImpl();
		Organazation organazation;
		HttpServletResponse response = ServletActionContext.getResponse();
		
	    PrintWriter writer = response.getWriter();
		if((organazation=iOrganazation.getOrnazation(username, password))!=null) {
			Map session=ActionContext.getContext().getSession();
			session.put("user", organazation);
			writer.write("true");
			return ;
		}
		System.out.println("失败");
		writer.write("false");
		writer.close();
		
		
	}
}
