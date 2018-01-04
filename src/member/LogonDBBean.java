package member;

import db.SqlMapClient;

public class LogonDBBean implements LogonDao {
		
	public int insertMember( LogonDataBean logonDto ) {
		return SqlMapClient.getSqlSession().insert( "Member.insertMember", logonDto );
	}
		
	public int check( String id ) {
		int result = 0;		
		int count = SqlMapClient.getSqlSession().selectOne( "Member.check", id );
		if( count != 0 ) {
			result = 1;
		} else {
			result = 0;
		}		
		return result;
	}
	
	public int check( String id, String passwd ) {
		int result = 0;		
		int count = check( id );
		if( count != 0 ) {
			LogonDataBean logonDto = getMember( id );			
			if( passwd.equals( logonDto.getM_passwd() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			result = 0;
		}			
		return result;
	}
	
	public int deleteMember( String id ) {		
		return SqlMapClient.getSqlSession().delete( "Member.deleteMember", id );
	}
	
	public LogonDataBean getMember( String id ) {		
		return SqlMapClient.getSqlSession().selectOne( "Member.getMember", id );
	}

	public int updateMember( LogonDataBean logonDto ) {
		return SqlMapClient.getSqlSession().update( "Member.updateMember", logonDto );
	}	

} // class















