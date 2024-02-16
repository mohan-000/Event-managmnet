package model;

public class Themes {

	String t_id;
	String t_img;
	String t_name, t_cost, t_info;
	
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getT_img() {
		return t_img;
	}
	public void setT_img(String base64Image) {
		this.t_img = base64Image;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_cost() {
		return t_cost;
	}
	public void setT_cost(String t_cost) {
		this.t_cost = t_cost;
	}
	public String getT_info() {
		return t_info;
	}
	public void setT_info(String t_info) {
		this.t_info = t_info;
	}
}
