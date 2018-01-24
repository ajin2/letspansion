package after;

import java.util.List;
import java.util.Map;

public interface AfterDao {
	public int getCount();
	
	public List<AfterDataBean> getArticles( Map<String, Integer> map );
	
	public int insertArticle( AfterDataBean afterDto );
	
	public void addCount( int am_num );
	
	public AfterDataBean getArticle( int am_num );
	
	public int deleteArticle( int am_num );
	
	public int updateArticle( AfterDataBean afterDto );
	
	public int insertReply( ReplyBoardDataBean replyDto );

	/*public ReplyBoardDataBean selectReply(int re_num );*/

	/*public void selectReply(ReplyBoardDataBean replyDto);*/

	public List<ReplyBoardDataBean> selectReply(int am_num);

	public void deleteReply(int re_num);

	/*public void modifyReply(int re_num);*/

	public void modifyReply(ReplyBoardDataBean replyDto);

}












