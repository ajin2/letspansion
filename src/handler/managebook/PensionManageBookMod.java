package handler.managebook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class PensionManageBookMod implements CommandHandler{
	@RequestMapping("/booklistdel_ordermod")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String params = request.getParameter("params");
		
		request.setAttribute("params", params);
		
		return new ModelAndView("managebook/booklistdel_ordermod");
	}

}
