package handler.adminmanage;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminPensionManageDelProductHandler implements CommandHandler{
	@RequestMapping("/adminManageDelProduct")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
	    String delfile = request.getParameter("delfile");
	    request.setAttribute("delfile", delfile);
	    System.out.println(delfile);
	    
	    String path = request.getSession().getServletContext().getRealPath("/adminmanage/productimg/");

	    File f = new File(path + delfile);	
	    System.out.println(f);
		if(f.exists()){
			f.delete();
			System.out.println("파일 삭제됨");
		}else{
			System.out.println("파일 없음");
		}

        return new ModelAndView("adminmanage/adminManageDelProduct");
	}
}
