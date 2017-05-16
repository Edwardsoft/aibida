package aibida.web.domain;

public class Item {
	private int id;
	private int project_id;
	private String name;
	private String remark;
	private int amount;
	private int remain_amount;
	public int getRemain_amount() {
		return remain_amount;
	}
	public void setRemain_amount(int remain_amount) {
		this.remain_amount = remain_amount;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
