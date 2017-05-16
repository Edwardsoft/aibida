package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.Organazation;

public interface IOrganazation {
	public ArrayList<Organazation> getAllOrganazation();
	public Organazation getOrnazation(String username,String password);
	public Organazation getOrganationById(int id);
}
