package handler.qna;

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
public class QuestionModifyHandler implements CommandHandler{
	
	@Resource
	private QnaDao qDao;
	
	@RequestMapping("/questionModify")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("q_num", q_num);
		request.setAttribute("pageNum", pageNum);
		
		QnaDataBean qDto = qDao.getArticle(q_num);
		request.setAttribute("qDto", qDto);
		
		return new ModelAndView("qna/questionModify");
	}
}
