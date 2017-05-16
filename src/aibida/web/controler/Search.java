package aibida.web.controler;


import java.util.ArrayList;



import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IProject;
import aibida.web.dao.impl.ProjectImpl;
import aibida.web.domain.Project;

public class Search extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String content;
	private ArrayList<Project> donate_projects;
	private int donate_project_size;
	private ArrayList<Project> volunteer_projects;
	private int volunteer_project_size;
	
	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArrayList<Project> getDonate_projects() {
		return donate_projects;
	}

	public void setDonate_projects(ArrayList<Project> donate_projects) {
		this.donate_projects = donate_projects;
	}

	public int getDonate_project_size() {
		return donate_project_size;
	}

	public void setDonate_project_size(int donate_project_size) {
		this.donate_project_size = donate_project_size;
	}

	public ArrayList<Project> getVolunteer_projects() {
		return volunteer_projects;
	}

	public void setVolunteer_projects(ArrayList<Project> volunteer_projects) {
		this.volunteer_projects = volunteer_projects;
	}

	public int getVolunteer_project_size() {
		return volunteer_project_size;
	}

	public void setVolunteer_project_size(int volunteer_project_size) {
		this.volunteer_project_size = volunteer_project_size;
	}

	public String execute() throws Exception {
		IProject iProject=new ProjectImpl();
		donate_projects=iProject.searchProject(content);
		if(donate_projects.isEmpty()) {
			donate_projects=new ArrayList<>();
		}
		donate_project_size=donate_projects.size();
		return SUCCESS;
	}
	
	public String searchVolunteer() {
		IProject iProject=new ProjectImpl();
		volunteer_projects=iProject.searchProject(content,3);
		if(volunteer_projects.isEmpty()) {
			volunteer_projects=new ArrayList<>();
		}
		volunteer_project_size=volunteer_projects.size();
		
		return SUCCESS;
	}
	


}
