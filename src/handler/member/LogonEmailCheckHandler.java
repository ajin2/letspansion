package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.EmailConfirm;
import member.LogonDao;
@Controller
public class LogonEmailCheckHandler implements CommandHandler{
	@Resource
	private LogonDao logonDao;	
	
	@RequestMapping( "/emailckeck" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding( "utf-8" );
		
		String email=null;
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		if(!email1.equals("")){
			if(email2.equals("0")){
				// 직접입력
				email=email1;
			}else{
				email=email1+"@"+email2;
			}
		}
		request.setAttribute("email", email);
		
		
		String emailvalue = request.getParameter("emailvalue");

		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum = emailconfirm.connectEmail(email);
		
		request.setAttribute("emailvalue", emailvalue);
		request.setAttribute("emailconfirm", emailconfirm);
		request.setAttribute("authNum", authNum);
		
		return new ModelAndView( "member/emailcheck" );
	}

}
