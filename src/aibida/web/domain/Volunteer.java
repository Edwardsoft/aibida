package aibida.web.domain;

public class Volunteer {
	private int id;
	private int project_id;
	private int total_amount;
	private int man_amount;
	private int woman_amount;
	private int total_remain_amount;
	private int man_remain_amount;
	private int woman_remain_amount;
	public int getTotal_remain_amount() {
		return total_remain_amount;
	}
	public void setTotal_remain_amount(int total_remain_amount) {
		this.total_remain_amount = total_remain_amount;
	}
	public int getMan_remain_amount() {
		return man_remain_amount;
	}
	public void setMan_remain_amount(int man_remain_amount) {
		this.man_remain_amount = man_remain_amount;
	}
	public int getWoman_remain_amount() {
		return woman_remain_amount;
	}
	public void setWoman_remain_amount(int woman_remain_amount) {
		this.woman_remain_amount = woman_remain_amount;
	}
	private int type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getMan_amount() {
		return man_amount;
	}
	public void setMan_amount(int man_amount) {
		this.man_amount = man_amount;
	}
	public int getWoman_amount() {
		return woman_amount;
	}
	public void setWoman_amount(int woman_amount) {
		this.woman_amount = woman_amount;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
