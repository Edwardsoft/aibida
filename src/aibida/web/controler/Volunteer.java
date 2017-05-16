package aibida.web.controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionSupport;

import aibida.web.dao.IOrganazation;
import aibida.web.dao.IProject;
import aibida.web.dao.IVolunteer;
import aibida.web.dao.impl.OrganazationImpl;
import aibida.web.dao.impl.ProjectImpl;
import aibida.web.dao.impl.VolunteerImpl;
import aibida.web.domain.Organazation;
import aibida.web.domain.Project;


public class Volunteer extends ActionSupport{
	
	private String method;
	private ArrayList<Project> projects;
	private Organazation organazation;
	private aibida.web.domain.Volunteer volunteer;
	private Project project;
	private String project_id;
	
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public ArrayList<Project> getProjects() {
		return projects;
	}

	public void setProjects(ArrayList<Project> projects) {
		this.projects = projects;
	}

	public Organazation getOrganazation() {
		return organazation;
	}

	public void setOrganazation(Organazation organazation) {
		this.organazation = organazation;
	}

	public aibida.web.domain.Volunteer getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(aibida.web.domain.Volunteer volunteer) {
		this.volunteer = volunteer;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String showAll() {
		IProject iproject=new ProjectImpl();
		projects=iproject.getProjects(3);
		return SUCCESS;
	}
	
	public String show() {
		IProject iproject=new ProjectImpl();
		project=iproject.getProjectById(project_id+"");
		int organazation_id=project.getOrganazation_id();
		IOrganazation iorganazation=new OrganazationImpl();
		organazation=iorganazation.getOrganationById(organazation_id);
		IVolunteer ivolunteer=new VolunteerImpl();
		volunteer=ivolunteer.getVolunteer(Integer.parseInt(project_id));
		
		return SUCCESS;
	}

}
