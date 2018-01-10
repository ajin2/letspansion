package handler.after;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import after.AfterDao;
import handler.CommandHandler;

@Controller
public class DeleteProHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/deletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int am_num = Integer.parseInt( request.getParameter( "am_num" ) );
		String pageNum = request.getParameter( "pageNum" );
		String m_id = request.getParameter( "m_id" );
	
		/*int resultCheck = afterDao.check( am_num, m_id );*/
	
		/*request.setAttribute( "resultCheck", resultCheck );*/
		request.setAttribute( "pageNum", pageNum );
		
		/*if( resultCheck == 1 ) {
			int result = afterDao.deleteArticle( am_num );
			request.setAttribute( "result", result );
		}*/
		
		afterDao.deleteArticle( am_num );
		
		return new ModelAndView("after/deletePro");
	}

}
