package handler.after;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import after.AfterDao;
import after.AfterDataBean;
import handler.CommandHandler;

@Controller
public class WriteProHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/writePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		System.out.println("aaa");
		AfterDataBean afterDto = new AfterDataBean();
		System.out.println("bbbs");
		afterDto.setM_id( request.getParameter("m_id") );
		System.out.println("m_id : " + request.getParameter("m_id") );
		afterDto.setAm_subject( request.getParameter( "am_subject") );
		System.out.println("subject : " + request.getParameter("am_subject"));
		afterDto.setAm_content( request.getParameter( "am_content") );
		System.out.println("content : " + request.getParameter("am_content"));
		afterDto.setAm_num(Integer.parseInt(request.getParameter("am_num")));
		System.out.println("fff");
		
		afterDto.setAm_reg_date( new Timestamp( System.currentTimeMillis() ) );
		System.out.println("ggg");
	
		int result = afterDao.insertArticle( afterDto );
		System.out.println("eee");
		
		request.setAttribute( "result", result );
		System.out.println("fff");
		
		return new ModelAndView ("/after/writePro");
		
	}

}
