package notice;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class NoticeDBBean implements NoticeDao {
	
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne("Notice.getCount");
	}
	
	public List<NoticeDataBean> getArticles( Map<String, Integer> map ) {			
		return SqlMapClient.getSqlSession().selectList("Notice.getArticles", map);
	}
	
	public NoticeDataBean getArticle( int n_id ) {
		return SqlMapClient.getSqlSession().selectOne("Notice.getArticle", n_id);
	}
	
	public int insertArticle( NoticeDataBean nDto ) {
		int n_id =  nDto.getN_id();
		
		if(getCount() != 0) {
			n_id =  SqlMapClient.getSqlSession().selectOne("Notice.maxnum");
		}
		
		return SqlMapClient.getSqlSession().insert("Notice.insertArticle", nDto);		
	}
	
	public int deleteArticle( int n_id ) {
		int result = 0;
		NoticeDataBean nDto = getArticle( n_id );
		
		// checkReply
		int count = SqlMapClient.getSqlSession().selectOne("Notice.checkReply",nDto);
		
		if(count != 0) {
			result = -1;
		} else {
			// replyCheck
			SqlMapClient.getSqlSession().update("Board.replyCheck", nDto);
			
			// deleteArticle
			
			SqlMapClient.getSqlSession().delete("Board.deleteArticle",  n_id);
		}		
		
		return result;
	}
	
}
