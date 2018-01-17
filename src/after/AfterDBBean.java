package after;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class AfterDBBean implements AfterDao {
	
	public int getCount() {
		return SqlMapClient.getSqlSession().selectOne( "After.getCount" );
	}
	
	public List<AfterDataBean> getArticles( Map<String, Integer> map ) {
		return SqlMapClient.getSqlSession().selectList("After.getArticles", map );
	}
	
	public int insertArticle( AfterDataBean afterDto ) {
		int am_num = afterDto.getAm_num();
		String sql = null;
		
		return SqlMapClient.getSqlSession().insert("After.insertArticle", afterDto);
	}

	@Override
	public void addCount(int am_num) {
		SqlMapClient.getSqlSession().update("After.addCount", am_num );
	}

	@Override
	public AfterDataBean getArticle(int am_num) {
		return SqlMapClient.getSqlSession().selectOne("After.getArticle", am_num);
	}

	@Override
	public int deleteArticle(int am_num) {
		AfterDataBean afterDto = getArticle( am_num );
		
		return SqlMapClient.getSqlSession().update("After.deleteArticle", am_num );
	}

	@Override
	public int updateArticle(AfterDataBean afterDto) {
		return SqlMapClient.getSqlSession().update("After.updateArticle", afterDto);
	}

	@Override
	public int insertReply(ReplyBoardDataBean replyDto) {
		return SqlMapClient.getSqlSession().insert("After.insertReply", replyDto );
	}
}
