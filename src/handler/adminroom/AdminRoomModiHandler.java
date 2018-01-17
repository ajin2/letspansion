package handler.adminroom;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import room.RoomDao;
import room.RoomDataBean;
import room.RoomPictureDataBean;

@Controller
public class AdminRoomModiHandler implements CommandHandler{
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/adminRoomModi")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		RoomDataBean roomDto = roomDao.getRoomArticle(r_id);
		List<RoomPictureDataBean> pictureArticles = roomDao.getRoomPictureArticles(r_id);  
		
		String path = request.getSession().getServletContext().getRealPath("/roomupload");
		
		request.setAttribute("path", path);
		request.setAttribute("r_id", r_id);
		request.setAttribute("roomDto", roomDto);
		request.setAttribute("pictureArticles", pictureArticles);
		
		return new ModelAndView("adminroom/adminRoomModi");
	}
}
