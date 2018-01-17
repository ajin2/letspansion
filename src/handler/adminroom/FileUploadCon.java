package handler.adminroom;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import handler.CommandHandler;
import room.RoomPictureDataBean;

@Controller
public class FileUploadCon implements CommandHandler{
	
	@RequestMapping("/fileUpload1")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String formData = request.getParameter("formData");
    	request.setAttribute("formData", formData);
		
		String path = request.getSession().getServletContext().getRealPath("/roomupload");
		File dir = new File(path);
		if(!dir.isDirectory()) {
			new File(path).mkdir();
		}
		request.setAttribute("path", path);
		int sizeLimit = 10 * 1024 * 1024;
		MultipartRequest multiRequest = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		request.setAttribute("multiRequest", multiRequest);
		
		int r_id = 9;
		System.out.println("333333333333333333333333333333333");
		if (multiRequest.getOriginalFileName("file1") != null) {
			RoomPictureDataBean picDto = new RoomPictureDataBean();
			String pic_ori = multiRequest.getOriginalFileName("file1");
			String pic_sys = multiRequest.getFilesystemName("file1");
			int pict_id = 1;
			
			request.setAttribute("pic_ori", pic_ori);
			request.setAttribute("pic_sys", pic_sys);
			System.out.println("4444444444444444444444444444444444");
			picDto.setPict_id(pict_id);
			picDto.setR_id(r_id);
			picDto.setPic_ori(pic_ori);
			picDto.setPic_sys(pic_sys);
		
		//	roomDao.insertPicture(picDto);
			System.out.println("55555555555555555555555555555555555");
			System.out.println("출력 : pic_id = " + pict_id + " : r_id = " + r_id + " : pic_ori = "
					+ pic_ori + " : pic_sys = " + pic_sys);
			System.out.println("path : " + path);
		}
		
		return new ModelAndView("adminroom/ajaxUpload");
	}
}
