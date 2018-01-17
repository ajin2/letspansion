package member;

public interface LogonDao {
	public int deleteCheck(String id);					// LogonLoginProHandler
  	public int insertMember( LogonDataBean memberDto );
	public int check( String id );
	public int check( String id, String passwd );
	public int deleteMember( String id );
	public LogonDataBean getMember( String id );
	public int updateMember( LogonDataBean memberDto );
	
}
