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
public class AdminNoticeDeleteHandler implements CommandHandler {
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/adminNoticeDelete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		
		/*int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));*/
		
		String n_pageNum = request.getParameter("n_pageNum");
		request.setAttribute("n_pageNum", n_pageNum);
		
		/*request.setAttribute("q_num", q_num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);*/
		
		int result = nDao.deleteArticle(n_id);
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("adminnotice/adminNoticeDelete");
	}
}
