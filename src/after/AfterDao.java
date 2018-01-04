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
	
	
	
}
