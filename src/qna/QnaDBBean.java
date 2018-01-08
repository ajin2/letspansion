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
}
