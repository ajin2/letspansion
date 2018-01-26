package handler.adminroom;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import room.RoomDao;
import room.RoomDataBean;

@Controller
public class AdminRoomModifyDoneHandler implements CommandHandler{
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/adminRoomModifyDone")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		RoomDataBean roomDto = new RoomDataBean();
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		System.out.println("r_minperson : " + Integer.parseInt(request.getParameter("r_minperson")));
		System.out.println("r_maxperson : " + Integer.parseInt(request.getParameter("r_maxperson")));
		System.out.println("r_price : " + Integer.parseInt(request.getParameter("r_price")));
		System.out.println("r_content : " + request.getParameter("r_content"));
		
		roomDto.setR_id(r_id);
		roomDto.setR_minperson(Integer.parseInt(request.getParameter("r_minperson")));
		roomDto.setR_maxperson(Integer.parseInt(request.getParameter("r_maxperson")));
		roomDto.setR_price(Integer.parseInt(request.getParameter("r_price")));
		roomDto.setR_content(request.getParameter("r_content"));
		
		roomDao.roomUpdate(roomDto);
		
		request.setAttribute("r_id", r_id);
		
		return new ModelAndView("adminroom/adminRoomDetail.do");
	}
}
