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
		AfterDataBean afterDto = new AfterDataBean();
		afterDto.setM_id( request.getParameter("m_id") );
		afterDto.setAm_subject( request.getParameter( "am_subject") );
		afterDto.setAm_content( request.getParameter( "am_content") );
		afterDto.setAm_num(Integer.parseInt(request.getParameter("am_num")));
		
		afterDto.setAm_reg_date( new Timestamp( System.currentTimeMillis() ) );
	
		int result = afterDao.insertArticle( afterDto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView ("/after/writePro");
		
	}

}
