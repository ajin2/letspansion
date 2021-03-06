package handler.adminbook;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminPensionProductInsertHandler implements CommandHandler{
	@RequestMapping("/orderinsert")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		/*request.setCharacterEncoding("utf-8");*/
		
		String params = request.getParameter("params");
		
		request.setAttribute("params", params);
		
		return new ModelAndView("book/orderinsert");
	}

}
