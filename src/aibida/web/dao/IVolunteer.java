package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.Volunteer;

public interface IVolunteer {
	public Volunteer getVolunteer(int project_id);
	public void decreaseAmount(int project,int sex,int type);
}
