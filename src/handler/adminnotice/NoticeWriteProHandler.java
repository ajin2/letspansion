package handler.adminnotice;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import notice.NoticeDao;
import notice.NoticeDataBean;
import handler.CommandHandler;

@Controller
public class NoticeWriteProHandler implements CommandHandler{
	@Resource
	private NoticeDao nDao;
	
	@RequestMapping("/noticeWritePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		
		NoticeDataBean nDto = new NoticeDataBean();
		nDto.setN_id(Integer.parseInt(request.getParameter("n_id")));
		nDto.setA_id(request.getParameter("a_id"));
		nDto.setN_subject(request.getParameter("n_subject"));
		nDto.setN_content(request.getParameter("n_content"));
		nDto.setN_regdata(new Timestamp(System.currentTimeMillis()));
		
		int result = nDao.insertArticle(nDto);
		
		request.setAttribute("result", result);
	
		return new ModelAndView("notice/noticeWritePro");
	}
}



















