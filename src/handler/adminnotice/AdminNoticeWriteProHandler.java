package handler.adminnotice;

//import java.net.URLEncoder;
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
		
		request.setCharacterEncoding("utf-8");
		
		//String n_subject = URLEncoder.encode(request.getParameter("n_subject"), "UTF-8");
		//String n_content = URLEncoder.encode(request.getParameter("n_content"), "UTF-8");
		
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
		
		String a_id = (String)request.getSession().getAttribute("adminId");
		
		int n_delete = 0;
		
		NoticeDataBean nDto = new NoticeDataBean();
		nDto.setN_id(Integer.parseInt(request.getParameter("n_id")));
		nDto.setA_id(a_id);
		nDto.setN_subject(n_subject);
		nDto.setN_content(n_content);
		nDto.setN_regdata(new Timestamp(System.currentTimeMillis()));
		nDto.setN_delete(n_delete);
		
		/*System.out.println(n_subject);
		System.out.println(n_content);*/
		
		int result = nDao.insertArticle(nDto);
		request.setAttribute("result", result);
		
		return new ModelAndView("adminnotice/adminNoticeWritePro");
	}
	
}
