package qna;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class QnaDBBean implements QnaDao{
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne("QnA.getCount");
	}
	
	public List<QnaDataBean> getArticles( Map<String, Integer> map ) {			
		return SqlMapClient.getSqlSession().selectList("QnA.getArticles", map);
	}
	
	public int insertArticle(QnaDataBean qDto) {
		int q_num = qDto.getQ_num();
		int ref = qDto.getRef();
		int re_step = qDto.getRe_step();
		int re_level = qDto.getRe_level();
		
		if( q_num == 0 ) {
			if(getCount() != 0) {
				ref = SqlMapClient.getSqlSession().selectOne("QnA.maxnum");
				
			} else {
				ref = 1;
			}	
			re_step = 0;
			re_level = 0;
		} else {
			SqlMapClient.getSqlSession().update("QnA.updateReply", qDto);
			
			re_step ++;
			re_level ++;
		}
		
		qDto.setRef(ref);
		qDto.setRe_step(re_step);
		qDto.setRe_level(re_level);
		
		return SqlMapClient.getSqlSession().insert("QnA.insertArticle", qDto);
	}
	
	public QnaDataBean getArticle( int q_num ) {
		return SqlMapClient.getSqlSession().selectOne("QnA.getArticle", q_num);
	}
	
	public int deleteArticle( int q_num ) {
		int result = 0;
		QnaDataBean qDto = getArticle( q_num );
		
		int count = SqlMapClient.getSqlSession().selectOne("QnA.checkReply", qDto);
		
		if(count != 0) {
			result = -1;
		} else {
			SqlMapClient.getSqlSession().update("QnA.replyCheck", qDto);
			
			SqlMapClient.getSqlSession().update("QnA.delete", q_num);
		}
		
		// deleteArticle	
		
		return result;
	}
	
	public int updateArticle( QnaDataBean qDto ) {
		return SqlMapClient.getSqlSession().update("QnA.updateArticle", qDto);
	}
	
}
