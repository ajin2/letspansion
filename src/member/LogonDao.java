package member;

import java.util.Map;

public interface LogonDao {

  	public int insertMember( LogonDataBean memberDto );
	public int check( String id );
	public int check( String id, String passwd );
	public int idcheck( String name );
	public int idcheck( String name, String email );
	public int findPasswd( Map<String, String> map );
	public int deleteMember( String id );
	public LogonDataBean getMember( String id );
	public LogonDataBean namegetMember( String name );
	public LogonDataBean emailgetMember( String email );
	public int updateMember( LogonDataBean memberDto );
	public int updatePasswd( LogonDataBean memberDto );
	
}
