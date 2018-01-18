package handler.adminqna;

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
import qna.QnaDao;
import qna.QnaDataBean;

@Controller
public class AdminQuestionListHandler implements CommandHandler {
	
	@Resource
	private QnaDao qDao;
	
	@RequestMapping("/adminPensionQna")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int count = 0;
		
		String m_id = (String) request.getSession().getAttribute("memId");
		String a_id = (String) request.getSession().getAttribute("adminId");
		
		//int q_cate = 0;
		
//		int q_delete = Integer.parseInt(request.getParameter("q_delete"));

		int pageBlock = 5;
		int pageSize = 100;			
		String pageNum = null;		
		int currentPage = 0;		
		int start = 0;				
		int end = 0;				
		int number = 0;				
		
		int startPage = 0;			
		int endPage = 0;			
		int pageCount = 0;			
	
		count = qDao.getCount();
		request.setAttribute("count", count);
		
		
		
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
			request.setAttribute( "m_id", m_id);
			request.setAttribute( "a_id", a_id);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
						
			List<QnaDataBean> articles = qDao.getArticles( map );
			request.setAttribute( "articles", articles );
		}
		
		
		return new ModelAndView("adminqna/adminPensionQna");
	}
}
