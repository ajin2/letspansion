package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDao;
import member.LogonDataBean;

@Controller
public class LogonModifyProHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/logonModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setPasswd( request.getParameter( "passwd" ) );
		
		String id = (String) request.getSession().getAttribute( "memId" );
		memberDto.setId( id );
	
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) 
			&& ! tel2.equals( "" ) 
			&& ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		memberDto.setTel( tel );
	
		String email = null;
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		if( ! email1.equals( "" ) 
			&& ! email2.equals( "" ) ) {
			email = email1 + "@" + email2;
		}
		memberDto.setEmail( email );
	
		//LogonDBBean memberDao = LogonDBBean.getInstance();
		//LogonDao logonDao = (LogonDao)LogonDBBean.ctx.getBean("logonDao");
		int result = logonDao.updateMember( memberDto );

		request.setAttribute( "result", result );
		
		return new ModelAndView("member/modifyPro");
	}
}








