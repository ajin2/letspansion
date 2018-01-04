package after;

import java.sql.Timestamp;

public class AfterDataBean {
	private int am_num;				// 글번호
	private String m_id;			// memeber_id
	private String am_subject;		// 글제목
	private String am_content; 		// 글내용
	private int am_readcount;		// 글 조회수
	private Timestamp am_reg_date;		// 글 증록 날짜
	private Timestamp am_delete_date;	// 글 삭제 날짜
	private Timestamp am_update_date;	// 글 수정 날짜
	
	
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
	public String getAm_subject() {
		return am_subject;
	}
	public void setAm_subject(String am_subject) {
		this.am_subject = am_subject;
	}
	public String getAm_content() {
		return am_content;
	}
	public void setAm_content(String am_content) {
		this.am_content = am_content;
	}
	public int getAm_readcount() {
		return am_readcount;
	}
	public void setAm_readcount(int am_readcount) {
		this.am_readcount = am_readcount;
	}
	public Timestamp getAm_reg_date() {
		return am_reg_date;
	}
	public void setAm_reg_date(Timestamp am_reg_date) {
		this.am_reg_date = am_reg_date;
	}
	public Timestamp getAm_delete_date() {
		return am_delete_date;
	}
	public void setAm_delete_date(Timestamp am_delete_date) {
		this.am_delete_date = am_delete_date;
	}
	public Timestamp getAm_update_date() {
		return am_update_date;
	}
	public void setAm_update_date(Timestamp am_update_date) {
		this.am_update_date = am_update_date;
	}
	
}
