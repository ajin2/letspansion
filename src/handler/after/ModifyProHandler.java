package handler.after;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import after.AfterDao;
import after.AfterDataBean;
import handler.CommandHandler;

@Controller
public class ModifyProHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/modifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		AfterDataBean afterDto = new AfterDataBean();
		afterDto.setAm_subject( request.getParameter( "am_subject") );
		afterDto.setAm_content( request.getParameter( "am_content") );
		afterDto.setAm_num( Integer.parseInt( request.getParameter( "am_num") ) );
			
		String pageNum = request.getParameter("pageNum");
	  	/*int result = boardDao.updateArticle(boardDto);*/
		
		afterDao.updateArticle(afterDto);
	
	  	/*request.setAttribute( "result", result );*/
	  	request.setAttribute( "pageNum", pageNum );
		
		return new ModelAndView("after/modifyPro");
	}
	

}
