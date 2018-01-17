package handler.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import member.LogonDao;

 @Controller
public class LogonFindPasswdViewHandler implements CommandHandler{
	@Resource
	private LogonDao logonDao;
	@RequestMapping("/logonFindPasswdView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
	      
	      String id = request.getParameter("id");
	      String email = request.getParameter("email");
	      
	      Map<String,String> map = new HashMap<String, String>();
	      map.put("id", id);
	      map.put("email", email);
	      
	       int result = logonDao.findPasswd( map );
	       
	       request.setAttribute("id", id);
	       request.setAttribute("email", email);
	       request.setAttribute("result", result);


		return new ModelAndView("/member/findPasswdView");
	}

}
