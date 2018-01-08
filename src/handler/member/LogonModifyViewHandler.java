package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;
import member.LogonDataBean;

@Controller
public class LogonModifyViewHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;
	
	@RequestMapping( "/logonModifyView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
	
		int result = logonDao.check( id, passwd );	
	
		request.setAttribute( "result", result );
		
		if( result == 1 ) {
			LogonDataBean memberDto = logonDao.getMember( id );
			request.setAttribute( "memberDto", memberDto );
		}
		
		return new ModelAndView( "member/modifyView" );
	}	
}









