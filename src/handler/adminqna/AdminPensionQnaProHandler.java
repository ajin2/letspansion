package handler.adminqna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class adminPensionQnaProHandler implements CommandHandler{
	@RequestMapping("/adminQnaPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView("adminqna/adminPensionQnaPro");
	}
}
