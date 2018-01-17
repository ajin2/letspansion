package handler.notice;

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
public class NoticeContentHandler implements CommandHandler{
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/noticeContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		String n_pageNum = request.getParameter("n_pageNum");
		String a_id = "������";
		
		NoticeDataBean nDto = nDao.getArticle(n_id);
		
		request.setAttribute("nDto", nDto);
		request.setAttribute("n_pageNum", n_pageNum);
		request.setAttribute("a_id", a_id);
		
		return new ModelAndView("notice/noticeContent");
	}
}
