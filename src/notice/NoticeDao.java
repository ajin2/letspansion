package notice;

import java.util.List;
import java.util.Map;


public interface NoticeDao {
	public int getCount();
	public List<NoticeDataBean> getArticles(Map<String, Integer> map);
	public NoticeDataBean getArticle(int n_id);
	public int insertArticle(NoticeDataBean nDto);
	/*public int check(int n_id);*/
	public int deleteArticle(int n_id);
	public int updateArticle(NoticeDataBean nDto);
}
