package handler.adminnotice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import notice.NoticeDao;

@Controller
public class NoticeDeletePro implements CommandHandler {
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/noticeDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		String n_pageNum = request.getParameter("n_pageNum");
		
		request.setAttribute("n_pageNum", n_pageNum);
		int result = nDao.deleteArticle(n_id);
		request.setAttribute("result", result);
		
		return new ModelAndView("notice/noticeDeletePro");
	}
}
