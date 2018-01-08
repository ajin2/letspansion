package handler.member;

import java.sql.Timestamp;

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
public class LogonInputProHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/logonInputPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding( "utf-8" );
	
		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setM_id( request.getParameter( "id" ) );
		memberDto.setM_passwd( request.getParameter( "passwd" ) );
		memberDto.setM_name( request.getParameter( "name" ) );
		memberDto.setM_tel( request.getParameter( "tel1" ) );	
	
		// email
		String email = null;
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		if( ! email1.equals( "" ) ) {
			if( email2.equals( "0" ) ) {
				email = email1;	
			} else {
				email = email1 + "@" + email2;
			}
		}
		memberDto.setM_email( email );
	
		// reg_date	
		
		memberDto.setM_postcode(request.getParameter("postcode"));
		memberDto.setM_address(request.getParameter("address"));
		memberDto.setM_detailadd(request.getParameter("detailadd"));
		memberDto.setM_regdate( new Timestamp( System.currentTimeMillis() ) );
		
		int result = logonDao.insertMember( memberDto );
	
		request.setAttribute( "result", result );	
		
		return new ModelAndView( "member/inputPro" );
	}
}















