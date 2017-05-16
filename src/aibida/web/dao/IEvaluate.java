package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.Evaluate;

public interface IEvaluate {
	public void addEvaluate(Evaluate evaluate);
	public ArrayList<Evaluate> getAllEvaluate(int user_id);
	public Evaluate getEvaluate(int order_id);
}
