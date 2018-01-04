package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import handler.CommandHandler;

@Controller
public class AdminLoginProHandler implements CommandHandler {

	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("/adminLoginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		String adminId = request.getParameter("adminid");
		String adminPasswd = request.getParameter("adminpasswd");
		
		int result = adminDao.adminLogin(adminId, adminPasswd);
				
		request.setAttribute("result", result);
		request.setAttribute("adminId", adminId);
		
		return new ModelAndView("admin/adminLoginPro");
	}
}
