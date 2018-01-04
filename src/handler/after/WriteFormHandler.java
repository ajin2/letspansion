package handler.after;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class WriteFormHandler implements CommandHandler{
	
	
	@RequestMapping( "/writeForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
			// 제목글
			int am_num = 0;		// 제목글 / 답변글
			
			/*if( request.getParameter( "am_num" ) != null ) {
				// 답변글
				am_num = Integer.parseInt( request.getParameter( "am_num" ) );
			}	*/
			
			request.setAttribute( "am_num", am_num );
			
			return new ModelAndView("after/writeForm");
		
	}

}
