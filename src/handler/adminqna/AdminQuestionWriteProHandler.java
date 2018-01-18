package handler.adminqna;

import java.sql.Timestamp;

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
public class AdminQuestionWriteProHandler implements CommandHandler{
	
	@Resource
	private QnaDao qDao;
	
	@RequestMapping("/adminQuestionWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String a_id = (String)request.getSession().getAttribute("adminId");
		
		int q_delete = 0;
		

		/*String cate = "";
		
		if(q_cate == 1) {
			cate = "1";
		} else if(q_cate == 2) {
			cate = "2";
		} else if(q_cate == 3) {
			cate = "3";
		} else if(q_cate == 4) {
			cate = "4";
		}*/
		
		QnaDataBean qDto = new QnaDataBean();
		qDto.setQ_num(Integer.parseInt(request.getParameter("q_num")));
		qDto.setM_id(request.getParameter("m_id"));
		qDto.setA_id(a_id);
		qDto.setQ_cate(Integer.parseInt(request.getParameter("q_cate")));
		qDto.setQ_subject(request.getParameter("q_subject"));
		qDto.setQ_content(request.getParameter("q_content"));
		qDto.setRef(Integer.parseInt(request.getParameter("ref")));
		qDto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		qDto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		qDto.setQ_regdate(new Timestamp(System.currentTimeMillis()));
		qDto.setQ_delete(q_delete);
		
		int result = qDao.insertArticle(qDto);
		request.setAttribute("result", result);
		
		return new ModelAndView("adminqna/adminQuestionWritePro");
	}
}
