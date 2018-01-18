package handler.adminnotice;

import java.sql.Timestamp;

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
public class AdminNoticeWriteProHandler implements CommandHandler{
	
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/adminNoticeWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String a_id = (String)request.getSession().getAttribute("adminId");
		
		int n_delete = 0;
		
		NoticeDataBean nDto = new NoticeDataBean();
		nDto.setN_id(Integer.parseInt(request.getParameter("n_id")));
		nDto.setA_id(a_id);
		nDto.setN_subject(request.getParameter("n_subject"));
		nDto.setN_content(request.getParameter("n_content"));
		nDto.setN_regdata(new Timestamp(System.currentTimeMillis()));
		nDto.setN_delete(n_delete);
		
		int result = nDao.insertArticle(nDto);
		request.setAttribute("result", result);
		
		return new ModelAndView("adminnotice/adminNoticeWritePro");
	}
	
}
