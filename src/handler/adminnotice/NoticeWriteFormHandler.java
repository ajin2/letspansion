package handler.adminnotice;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import notice.NoticeDao;
import notice.NoticeDataBean;

@Controller
public class NoticeWriteFormHandler implements CommandHandler {
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/noticeWriteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int n_id = 0;
		String a_id = "admin";
		
		
		if(request.getParameter("n_id") != null) {
			n_id = Integer.parseInt(request.getParameter("n_id"));
		}
		
		NoticeDataBean nDto = nDao.getArticle(n_id);
		
		request.setAttribute("a_id", a_id);
		request.setAttribute("n_id", n_id);
		
		return new ModelAndView("notice/noticeWriteForm");
	}

}
