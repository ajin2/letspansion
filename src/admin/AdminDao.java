package admin;

public interface AdminDao {
	public int adminLogin(String adminId);
	public int adminLogin(String adminId, String adminPasswd);
	public AdminDataBean getAdmin(String adminId);
}
