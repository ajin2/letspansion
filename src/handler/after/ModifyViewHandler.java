package handler.after;

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
public class ModifyViewHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/modifyView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int am_num = Integer.parseInt( request.getParameter("am_num"));
		String pageNum = request.getParameter("pageNum");
		String m_id = request.getParameter("m_id");
		
		/*int result = afterDao.check(am_num,m_id);*/
		
		/*request.setAttribute( "result", result );*/
		request.setAttribute( "am_num", am_num );
		request.setAttribute( "pageNum", pageNum );
		
		/*if( result == 1 ) {
			BoardDataBean boardDto = boardDao.getArticle(num);
			request.setAttribute( "boardDto", boardDto );
		}*/
		
		AfterDataBean afterDto = afterDao.getArticle(am_num);
		request.setAttribute( "afterDto", afterDto );
		
		return new ModelAndView("after/modifyView");
	}

}
