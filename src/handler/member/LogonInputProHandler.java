package handler.member;

import java.sql.Timestamp;

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
public class LogonInputProHandler implements CommandHandler {

	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/logonInputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding( "utf-8" );
	
		LogonDataBean memberDto = new LogonDataBean();
		/*memberDto.setId( request.getParameter( "id" ) );
		memberDto.setPasswd( request.getParameter( "passwd" ) );
		memberDto.setName( request.getParameter( "name" ) );
		memberDto.setJumin1( request.getParameter( "jumin1" ) );
		memberDto.setJumin2( request.getParameter( "jumin2" ) );*/
	
		// tel
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) 
			&& ! tel2.equals( "" ) 
			&& ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3; 
		}
		/*memberDto.setTel( tel );	*/
	
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
		/*memberDto.setEmail( email );*/
	
		// reg_date	
		/*memberDto.setReg_date( new Timestamp( System.currentTimeMillis() ) );*/
	
		//LogonDBBean memberDao = LogonDBBean.getInstance();
		//LogonDao logonDao = (LogonDao)LogonDBBean.ctx.getBean("logonDao");
		/*int result = logonDao.insertMember( memberDto );*/
	
		/*request.setAttribute( "result", result );	*/
		
		return new ModelAndView("member/inputPro");
	}
}















