package handler.adminmanage;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;

@Controller
public class AdminPensionManageProductHandler implements CommandHandler{
	@RequestMapping("/adminManageProduct")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
	    String formData = request.getParameter("formData");
	    request.setAttribute("formData", formData);
	    
	    String path = request.getSession().getServletContext().getRealPath("/adminmanage/productimg");
	    File dir = new File(path);
	    if(!dir.isDirectory()) {
	       new File(path).mkdir();
	    }
	    request.setAttribute("path", path);
	    int sizeLimit = 10 * 1024 * 1024;
	  
	    MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	    request.setAttribute("multi", multi);
	    
	    String originName1 = multi.getOriginalFileName( "fileup" );
		String systemName1 = multi.getFilesystemName( "fileup" );
		
		request.setAttribute("originName1", originName1);
		request.setAttribute("systemName1", systemName1);

		System.out.println(originName1 + "///" + systemName1);

        return new ModelAndView("adminmanage/adminManageProduct");
	}
}
