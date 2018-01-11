package handler.after;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import after.AfterDao;
import after.ReplyBoardDataBean;
import handler.CommandHandler;

@Controller
public class ReplyHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/reply" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("aaa");
		
		ReplyBoardDataBean replyDto = new ReplyBoardDataBean();
		
		System.out.println("am_num:"+request.getParameter( "am_num" ));
		System.out.println("m_id:"+request.getParameter("m_id"));
		System.out.println("contents:" + request.getParameter( "re_content"));
		
		replyDto.setAm_num( Integer.parseInt(request.getParameter("am_num") ) );
		replyDto.setM_id( request.getParameter( "m_id" ) );
		replyDto.setRe_content( request.getParameter( "re_content") );
		
		System.out.println("값 세팅");
		
		afterDao.insertReply(replyDto);
		
		return new ModelAndView( "after/content" );
	}

}
