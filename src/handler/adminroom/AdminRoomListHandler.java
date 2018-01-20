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
public class AdminRoomListHandler implements CommandHandler{
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/adminRoomList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		List<RoomPictureDataBean> pictures = roomDao.getRoomsPictureArticles();
		request.setAttribute("pictures", pictures);

		List<RoomDataBean> roomDto = roomDao.getRoomsArticle();
		request.setAttribute("roomDto", roomDto);
		
		return new ModelAndView("adminroom/adminRoomList");
	}
}
