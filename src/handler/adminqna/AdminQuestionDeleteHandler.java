package handler.adminqna;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import qna.QnaDao;

@Controller
public class AdminQuestionDeleteHandler implements CommandHandler {
	
	@Resource
	private QnaDao qDao;
	
	@RequestMapping("/adminQuestionDelete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		
		/*int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));*/
		
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		/*request.setAttribute("q_num", q_num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);*/
		
		int result = qDao.deleteArticle(q_num);
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("adminqna/adminQuestionDelete");
	}
}
