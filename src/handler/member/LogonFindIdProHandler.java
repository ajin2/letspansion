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
public class LogonFindIdProHandler implements CommandHandler{
	@Resource
	private LogonDao logonDao;
	@RequestMapping( "/logonFindIdPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		LogonDataBean memberDto = new LogonDataBean();
		String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	int result = logonDao.idcheck( name,email );
    	
    	request.setAttribute("name", name);
    	request.setAttribute("email", email);
    	request.setAttribute("result", result);
    	
    	if(result == 1) {
    		memberDto = logonDao.namegetMember(name);
    		memberDto = logonDao.emailgetMember(email);
			request.setAttribute("memberDto", memberDto);
    	}
    	
		return new ModelAndView("/member/findIdPro");
	}

}
