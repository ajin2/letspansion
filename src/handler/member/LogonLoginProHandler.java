package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;

@Controller
public class LogonLoginProHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;
	
	@RequestMapping( "/logonLoginPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );
		int result = 0;
		
		int deleteCheck = logonDao.deleteCheck(id);
		request.setAttribute("deleteCheck", deleteCheck);
		
		if (deleteCheck == 0) {
			result = logonDao.check( id, passwd );
			
			request.setAttribute( "result", result );
			request.setAttribute( "id", id );
		}
		return new ModelAndView( "member/loginPro" );
	}	
}
