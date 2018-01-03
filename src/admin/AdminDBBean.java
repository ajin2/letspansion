package admin;

import db.SqlMapClient;

public class AdminDBBean implements AdminDao {

	@Override
	public int adminLogin(String adminId) {
		int result = 0;
		int count = SqlMapClient.getSqlSession().selectOne("Admin.adminLogin", adminId);
		if(count != 0) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}
	
	@Override
	public int adminLogin(String adminId, String adminPasswd) {
		int result = 0;
		int count = adminLogin(adminId);
		if(count != 0) {
			AdminDataBean adminDto = getAdmin(adminId);
			if(adminPasswd.equals(adminDto.getA_passwd())) {
				result = 1;
			} else {
				result = 1;
			}
		} else {
			result = 0;
		}
		
		return result;
	}
	
	@Override
	public AdminDataBean getAdmin(String adminId) {
		return SqlMapClient.getSqlSession().selectOne("Admin.getAdmin", adminId);
	}
}
