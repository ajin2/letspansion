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
public class AdminNoticeModifyHandler implements CommandHandler{
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/adminNoticeModify")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		//System.out.println(q_num + "----" );
		
		String n_pageNum = request.getParameter("n_pageNum");
		
		request.setAttribute("n_id", n_id);
		request.setAttribute("n_pageNum", n_pageNum);

		NoticeDataBean nDto = nDao.getArticle(n_id);
		request.setAttribute("nDto", nDto);
		
		return new ModelAndView("adminnotice/adminNoticeModify");
	}
}
