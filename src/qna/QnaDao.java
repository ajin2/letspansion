package qna;

import java.util.List;
import java.util.Map;


public interface QnaDao {
	public int getCount();
	public List<QnaDataBean> getArticles(Map<String, Integer> map);
}
