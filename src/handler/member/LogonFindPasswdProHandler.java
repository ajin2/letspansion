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
public class LogonFindPasswdProHandler implements CommandHandler{
	@Resource
	private LogonDao logonDao;
	@RequestMapping("/longonFindPasswdPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		  String id = request.getParameter("id");
	      String passwd = request.getParameter("passwd");
	      
	      LogonDataBean logondto = new LogonDataBean();
	      logondto.setM_id( id );
	      logondto.setM_passwd( passwd );

	       int result = logonDao.updatePasswd( logondto );
	       request.setAttribute("result", result);
	       
	      return new ModelAndView( "member/findPasswdPro" );

	}
}
