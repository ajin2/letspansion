package handler.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class QuestionWriteHandler implements CommandHandler{
	
	@RequestMapping("/questionWrite")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int q_num = 0;
		String pageNum = null;
		int ref = 1;
		int re_step = 0;	
		int re_level = 0;	
		
		if( request.getParameter( "q_num" ) != null ) {
			q_num = Integer.parseInt( request.getParameter( "q_num" ) );
			pageNum = request.getParameter("pageNum");
			ref = Integer.parseInt( request.getParameter( "ref" ) );
			re_step = Integer.parseInt( request.getParameter( "re_step" ) );
			re_level = Integer.parseInt( request.getParameter( "re_level" ) );
		}

		request.setAttribute( "q_num", q_num );
		request.setAttribute("pageNum", pageNum);
		request.setAttribute( "ref", ref );
		request.setAttribute( "re_step", re_step );
		request.setAttribute( "re_level", re_level );
		
		
		return new ModelAndView("qna/questionWrite");
	}
}
