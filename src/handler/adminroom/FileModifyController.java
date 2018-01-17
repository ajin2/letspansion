package handler.adminroom;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;
import room.RoomDao;
import room.RoomPictureDataBean;

@Controller
public class FileModifyController implements CommandHandler {
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/fileModify")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String formData = request.getParameter("formData");
    	request.setAttribute("formData", formData);
    	
    	String path = request.getSession().getServletContext().getRealPath("/roomupload");
    	request.setAttribute("path", path);
		int sizeLimit = 10 * 1024 * 1024;
		
		MultipartRequest multiRequest = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		request.setAttribute("multiRequest", multiRequest);
    	
		int pict_id = Integer.parseInt(request.getParameter("pict_id"));
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		if (multiRequest.getOriginalFileName("file2") != null) {
			System.out.println("file2 : 2222222222222222222");
			RoomPictureDataBean picDto = new RoomPictureDataBean();
			String pic_ori = multiRequest.getOriginalFileName("file2");
			String pic_sys = multiRequest.getFilesystemName("file2");
			
			request.setAttribute("pic_ori", pic_ori);
			request.setAttribute("pic_sys", pic_sys);
			
			System.out.println(pict_id + " : " + r_id + " : " + pic_ori + " : " + pic_sys);
			picDto.setPict_id(pict_id);
			picDto.setR_id(r_id);
			picDto.setPic_ori(pic_ori);
			picDto.setPic_sys(pic_sys);
			
			roomDao.updatePicture(picDto);
			
					
		}
		
    	
		return new ModelAndView("adminroom/adminRoomModi");
	}
}
