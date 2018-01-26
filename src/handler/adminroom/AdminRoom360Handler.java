package handler.adminroom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminRoom360Handler implements CommandHandler{
	
	@RequestMapping("/adminRoom360")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		request.setAttribute("r_id", r_id);
		
		return new ModelAndView("adminroom/adminRoom360");
	}
}
