package admin;

import java.sql.Timestamp;

public class AdminDataBean {
	private String a_id;
	private String a_passwd;
	private String a_name;
	private Timestamp a_regdate;
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_passwd() {
		return a_passwd;
	}
	public void setA_passwd(String a_passwd) {
		this.a_passwd = a_passwd;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public Timestamp getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Timestamp a_regdate) {
		this.a_regdate = a_regdate;
	}
}
