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
public class QuestionModifyProHandler implements CommandHandler{
	
	@Resource
	private QnaDao qDao;
	
	@RequestMapping("/questionModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		QnaDataBean qDto = new QnaDataBean();
		qDto.setQ_num(Integer.parseInt(request.getParameter("q_num")));
		qDto.setQ_subject(request.getParameter("q_subject"));
		qDto.setQ_content(request.getParameter("q_content"));
		
		
		
		String pageNum = request.getParameter("pageNum");
		
		int result = qDao.updateArticle(qDto);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return new ModelAndView("qna/questionModifyPro");
	}
}
