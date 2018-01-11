package handler.after;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import after.AfterDao;
import after.AfterDataBean;
import handler.CommandHandler;

@Controller
public class ListHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/list" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("aa");
		
		int count = 0;				// 전체글수
		
		int pageBlock = 3;			// 페이지 블락 수
		int pageSize = 5;			// 한 페이지에 출력할 글의 수
		String pageNum = null;		// 현재페이지
		int currentPage = 0;		// 현재페이지
		int start = 0;				// 현재페이지 시작 글번호
		int end = 0;				// 현재페이지 끝 글번호
		int number = 0;				// 출력할 글번호
		
		int startPage = 0;			// 페이지의 시작
		int endPage = 0;			// 페이지의 끝
		int pageCount = 0;			// 페이지의 개수
		
		count = afterDao.getCount();
		System.out.println( "count : " + count );
		
		request.setAttribute( "count", count );
		
		if( count > 0 ) {
			pageNum = request.getParameter( "pageNum" );
			if( pageNum == null ) {
				pageNum = "1";
			}
			
			currentPage = Integer.parseInt( pageNum );
			
			pageCount = ( count / pageSize )
					+ ( count % pageSize > 0 ? 1 : 0 ); 
			
			if( currentPage > pageCount ) currentPage = pageCount;
			
			start = ( currentPage - 1 ) * pageSize + 1;
					// ( 3 - 1 ) * 10 + 1		21
			end = start + pageSize - 1;
					// 21 + 10 - 1				30
			
			number = count - ( currentPage - 1 ) * pageSize;
					// 50 - ( 2 - 1 ) * 10		40
					
			startPage = ( currentPage / pageBlock ) * pageBlock + 1;
					// ( 5 / 10 ) * 10 + 1 		1
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock;
					
			endPage = startPage + pageBlock - 1;
					// 1 + 10 - 1				10
					
			if( endPage > pageCount ) endPage = pageCount;
			
			request.setAttribute( "pageNum", pageNum );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "number", number );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			
			List<AfterDataBean> articles = afterDao.getArticles( map );
			request.setAttribute("articles", articles );
			
			return new ModelAndView("after/list");
			
		}
		
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "currentPage", currentPage );
		request.setAttribute( "pageBlock", pageBlock );
		request.setAttribute( "number", number );
		request.setAttribute( "startPage", startPage );
		request.setAttribute( "endPage", endPage );
		request.setAttribute( "pageCount", pageCount );
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<AfterDataBean> articles = afterDao.getArticles( map );
		request.setAttribute("articles", articles );
		
		
		return new ModelAndView("after/list");
	}

}
