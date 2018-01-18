package handler.adminnotice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminNoticeWriteHandler implements CommandHandler{

	
	@RequestMapping("/adminNoticeWrite")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int n_id = 0;
		
		if(request.getParameter("n_id") != null) {
			n_id = Integer.parseInt(request.getParameter("n_id"));
		}
		
		request.setAttribute("n_id", n_id);
		
		return new ModelAndView("adminnotice/adminNoticeWrite");
	}

}
