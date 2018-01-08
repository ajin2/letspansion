package handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminLogoutHandler implements CommandHandler{
	@RequestMapping("/adminLogout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.getSession().removeAttribute("adminId");
		
		return new ModelAndView("adminhome/adminPensionHome");
	}
}
