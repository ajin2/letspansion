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
	
	@RequestMapping( "/logonModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setM_passwd( request.getParameter( "passwd" ) );
		
		String id = (String) request.getSession().getAttribute( "memId" );
		memberDto.setM_id( id );
	
		memberDto.setM_tel( request.getParameter( "tel1" ));
		
    	memberDto.setM_postcode(request.getParameter("postcode"));
		memberDto.setM_address(request.getParameter("address"));
		memberDto.setM_detailadd(request.getParameter("detailadd"));
		
		int result = logonDao.updateMember( memberDto );

		request.setAttribute( "result", result );
		
		return new ModelAndView( "member/modifyPro" );
	}
}








