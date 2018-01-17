package after;

import java.sql.Timestamp;

public class ReplyBoardDataBean {
	private int re_num;
	private int am_num;
	private String m_id;
	private int reply_parent_num;
	private String re_content;
	private int re_rating;
	private Timestamp re_reg_date;
	private Timestamp re_delete_date;
	private Timestamp re_update_date;
	
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getAm_num() {
		return am_num;
	}
	public void setAm_num(int am_num) {
		this.am_num = am_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getReply_parent_num() {
		return reply_parent_num;
	}
	public void setReply_parent_num(int reply_parent_num) {
		this.reply_parent_num = reply_parent_num;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_rating() {
		return re_rating;
	}
	public void setRe_rating(int re_rating) {
		this.re_rating = re_rating;
	}
	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	public Timestamp getRe_delete_date() {
		return re_delete_date;
	}
	public void setRe_delete_date(Timestamp re_delete_date) {
		this.re_delete_date = re_delete_date;
	}
	public Timestamp getRe_update_date() {
		return re_update_date;
	}
	public void setRe_update_date(Timestamp re_update_date) {
		this.re_update_date = re_update_date;
	}
	
}
