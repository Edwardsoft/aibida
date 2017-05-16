package aibida.web.dao;
import java.util.ArrayList;

import aibida.web.domain.Project;
public interface IProject {
	public ArrayList<Project> getAllProjects();
	public Project getProjectById(String id);
	public ArrayList<Project> getProjects(int type);
	public ArrayList<Project> searchProject(String content);
	public ArrayList<Project> searchProject(String content,int type);
}
