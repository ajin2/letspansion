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
		
		/*int count = SqlMapClient.getSqlSession().selectOne("Notice.checkReply", nDto);
		
		if(count != 0) {
			result = -1;
		} else {
			SqlMapClient.getSqlSession().update("Notice.replyCheck", nDto);
			*/
			SqlMapClient.getSqlSession().update("Notice.delete", n_id);
		//}
		
		// deleteArticle	
		
		return result;
	}

	public int updateArticle( NoticeDataBean nDto ) {
		return SqlMapClient.getSqlSession().update("Notice.updateArticle", nDto);
	}
	
	
}
