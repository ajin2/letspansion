package notice;

import java.sql.Timestamp;

public class NoticeDataBean {
	private int n_id;					// ������ ��ȣ
	private String a_id;				// ������ ���̵�
	private String n_subject;			// ����
	private String n_content;			// ����
	private Timestamp n_regdata;		// �ۼ���
	
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Timestamp getN_regdata() {
		return n_regdata;
	}
	public void setN_regdata(Timestamp n_regdata) {
		this.n_regdata = n_regdata;
	}
	
	
	
}
