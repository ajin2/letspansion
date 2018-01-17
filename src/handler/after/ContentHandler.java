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
public class ContentHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/content" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable 
	{
		int am_num = Integer.parseInt( request.getParameter( "am_num" ) );
		String pageNum = request.getParameter( "pageNum" );
		
		
		AfterDataBean afterDto = afterDao.getArticle( am_num );
		afterDao.addCount( am_num );
	
		request.setAttribute( "afterDto", afterDto );
		request.setAttribute( "am_num" , am_num);
		request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView("after/content");
	}

}
