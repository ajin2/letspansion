package handler.adminroom;

import java.util.List;

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
public class AdminRoomDetailHandler implements CommandHandler{
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/adminRoomDetail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		int countPicture = roomDao.getCountPicture(r_id);
		List<RoomPictureDataBean> pictures = roomDao.getRoomPictureArticles(r_id);
		RoomDataBean roomDto = roomDao.getRoomArticle(r_id);
		
		request.setAttribute("roomDto", roomDto);
		request.setAttribute("countPicture", countPicture);
		request.setAttribute("r_id", r_id);
		request.setAttribute("pictures", pictures);
		
		return new ModelAndView("adminroom/adminRoomDetail");
	}
}
