package member;

import java.util.Map;

import db.SqlMapClient;

public class LogonDBBean implements LogonDao {
  
  @Override
	public int deleteCheck(String id) {
		return SqlMapClient.getSqlSession().selectOne("Member.deleteCheck", id);
	}
  
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
	public int idcheck( String name ) {
		int result = 0;		
		int count = SqlMapClient.getSqlSession().selectOne( "Member.idcheck", name );
		if( count != 0 ) {
			result = 1;
		} else {
			result = 0;
		}		
		return result;
	}
	public int idcheck( String name, String email ) {
		int result = 0;		
		int count = idcheck(name);
		if( count != 0 ) {
			LogonDataBean logonDto = namegetMember( name );			
			if( email.equals( logonDto.getM_email() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			result = 0;
		}			
		return result;
	}
	public int findPasswd( Map<String, String > map ) {
	      return SqlMapClient.getSqlSession().selectOne( "Member.findPasswd", map);
	}
	
	public int deleteMember( String id ) {		
		return SqlMapClient.getSqlSession().delete( "Member.deleteMember", id );
	}
	
	public LogonDataBean getMember( String id ) {		
		return SqlMapClient.getSqlSession().selectOne( "Member.getMember", id );
	}
	public LogonDataBean namegetMember( String name ) {		
		return SqlMapClient.getSqlSession().selectOne( "Member.namegetMember", name );
	}
	public LogonDataBean emailgetMember( String email ) {		
		return SqlMapClient.getSqlSession().selectOne( "Member.emailgetMember", email );
	}
	public int updateMember( LogonDataBean logonDto ) {
		return SqlMapClient.getSqlSession().update( "Member.updateMember", logonDto );
	}
	public int updatePasswd( LogonDataBean logonDto ) {
		return SqlMapClient.getSqlSession().update( "Member.updatePasswd", logonDto );
	}

} // class

