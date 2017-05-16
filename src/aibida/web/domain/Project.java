package aibida.web.domain;

import java.sql.Timestamp;

public class Project {
	private int id;
	private String name;
	private String description;
	private String img;
	private int organazation_id;
	private int type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getOrganazation_id() {
		return organazation_id;
	}
	public void setOrganazation_id(int organazation_id) {
		this.organazation_id = organazation_id;
	}
	public Timestamp getCutoff_time() {
		return cutoff_time;
	}
	public void setCutoff_time(Timestamp cutoff_time) {
		this.cutoff_time = cutoff_time;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	private Timestamp cutoff_time;
	private Timestamp create_time;
}
