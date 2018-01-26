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
public class AdminNoticeModifyProHandler implements CommandHandler{
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/adminNoticeModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		NoticeDataBean nDto = new NoticeDataBean();
		nDto.setN_id(Integer.parseInt(request.getParameter("n_id")));
		nDto.setN_subject(request.getParameter("n_subject"));
		nDto.setN_content(request.getParameter("n_content"));
		
		
		String n_pageNum = request.getParameter("n_pageNum");
		
		int result = nDao.updateArticle(nDto);
		
		request.setAttribute("result", result);
		request.setAttribute("n_pageNum", n_pageNum);
		
		return new ModelAndView("adminnotice/adminNoticeModifyPro");
	}
}
