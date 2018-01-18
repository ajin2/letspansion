package qna;

import java.util.List;
import java.util.Map;


public interface QnaDao {
	public int getCount();
	public List<QnaDataBean> getArticles(Map<String, Integer> map);
	public int insertArticle(QnaDataBean qDto);
	public QnaDataBean getArticle(int q_num);
	public int deleteArticle(int q_num);
	public int updateArticle(QnaDataBean qDto);
}
