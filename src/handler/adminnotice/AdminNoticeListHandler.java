package handler.adminnotice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import notice.NoticeDao;
import notice.NoticeDataBean;

@Controller
public class AdminNoticeListHandler implements CommandHandler{
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("adminNoticeList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int count = 0;		
		
		int n_pageBlock = 5;		
		int n_pageSize = 15;		
		String n_pageNum= null;	
		int n_currentPage = 0;	
		int n_start = 0;			
		int n_end = 0;			
		int n_number = 0;			
		
		int n_startPage = 0;		
		int n_endPage = 0;		
		int n_pageCount = 0;
		
		count = nDao.getCount();
		request.setAttribute("count", count);
		
		if(count > 0){
			n_pageNum = request.getParameter("n_pageNum");
			if(n_pageNum == null){
				n_pageNum = "1";
			}
			n_currentPage = Integer.parseInt(n_pageNum);
			
			n_pageCount = (count / n_pageSize) + (count % n_pageSize > 0 ? 1:0);
			
			if(n_currentPage > n_pageCount)		n_currentPage = n_pageCount;
			
			n_start = (n_currentPage - 1) * n_pageSize + 1;
				// (3 - 1) * 10 + 1 	= 21
			n_end = n_start + n_pageSize - 1;
				// 21 + 10 - 1 			= 30
			n_number = count - (n_currentPage - 1) * n_pageSize;
				// 50 - (2 - 1) * 10 	= 40
			
			n_startPage = (n_currentPage / n_pageBlock) * n_pageBlock + 1;
				// (5 / 10) * 10 + 1 	= 1
			if(n_currentPage%n_pageBlock == 0)	n_startPage -= n_pageBlock;
			
			n_endPage = n_startPage + n_pageBlock - 1;
				// 1 + 10 - 1			= 10
						
			if(n_endPage > n_pageCount ) n_endPage = n_pageCount;
			
			
			request.setAttribute("n_pageNum", n_pageNum);
			request.setAttribute("n_currentPage", n_currentPage);
			request.setAttribute("n_pageBlock", n_pageBlock);
			request.setAttribute("n_number", n_number);
			request.setAttribute("n_startPage", n_startPage);
			request.setAttribute("n_endPage", n_endPage);
			request.setAttribute("n_pageCount", n_pageCount);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", n_start);
			map.put("end", n_end);
			
			List<NoticeDataBean> anoticeArticles = nDao.getArticles( map );
			request.setAttribute( "anoticeArticles", anoticeArticles );
		}
		
		
		return new ModelAndView("adminnotice/adminNoticeList");
	}
}
