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
public class LogonDeleteProHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;
	
	@RequestMapping( "/logonDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );			
	
		int resultCheck = logonDao.check( id, passwd );
		
		request.setAttribute( "resultCheck", resultCheck );
		
		if( resultCheck == 1 ) {
			int result = logonDao.deleteMember( id );
			request.setAttribute( "result", result );
		}
		
		return new ModelAndView( "member/deletePro" );
	}
}







