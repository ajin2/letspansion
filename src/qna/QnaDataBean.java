package qna;

import java.sql.Timestamp;

public class QnaDataBean {
	private int q_num;
	private String m_id;
	private String a_id;
	private int q_cate;
	private String q_subject;
	private String q_content;
	private int ref;
	private int re_step;
	private int re_level;
	private Timestamp q_regdate;
	private int q_delete;
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public int getQ_cate() {
		return q_cate;
	}
	public void setQ_cate(int q_cate) {
		this.q_cate = q_cate;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public Timestamp getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Timestamp q_regdate) {
		this.q_regdate = q_regdate;
	}
	public int getQ_delete() {
		return q_delete;
	}
	public void setQ_delete(int q_delete) {
		this.q_delete = q_delete;
	}
	
	
}
