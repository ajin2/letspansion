package handler.adminroom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class PictureDeleteHandler implements CommandHandler{
	@RequestMapping("/pictureDelete")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pict_id = Integer.parseInt(request.getParameter("pict_id"));
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		request.setAttribute("pict_id", pict_id);
		request.setAttribute("r_id", r_id);
		
		return new ModelAndView("adminroom/pictureDelete");
	}
}
