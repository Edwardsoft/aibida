package aibida.web.dao;

import java.util.ArrayList;

import aibida.web.domain.Item;
import aibida.web.domain.Order;

public interface IItem {
	public ArrayList<Item> getItemByProjectId(int id);
	public Item getItemById(String id);
	public int getRemainAmount(int id);
	public int getAmount(int id);
	public void decreaseRemainAmount(int id);
}
 