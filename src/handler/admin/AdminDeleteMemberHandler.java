package handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminDeleteMemberHandler implements CommandHandler{
	@RequestMapping("/deleteMember")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String m_id = request.getParameter("m_id");
		request.setAttribute("m_id", m_id);
		
		return new ModelAndView("admin/deleteMember");
	}
}
