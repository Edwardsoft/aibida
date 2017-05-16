package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.VolunteerOrder;

public interface IVolunteerOrder {
	public void addVolunteerOrder(int user_id,int project_id,String name,String telephone,int sex);
	public ArrayList<VolunteerOrder> getVolunteerOrders(int user_id);
	
}
