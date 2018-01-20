package handler.adminroom;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

import handler.CommandHandler;
import room.RoomDao;
import room.RoomPictureDataBean;

@Controller
public class FileUploadController implements CommandHandler{
	
	@Resource
	private RoomDao roomDao;
	
	@RequestMapping("/fileUpload")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String formData = request.getParameter("formData");
    	request.setAttribute("formData", formData);
		
    	String path = request.getSession().getServletContext().getRealPath("/roomupload");
    	request.setAttribute("path", path);
    	File dir = new File(path);
		if(!dir.isDirectory()) {
			new File(path).mkdir();
		}
		
		int sizeLimit = 10 * 1024 * 1024;
		MultipartRequest multiRequest = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		request.setAttribute("multiRequest", multiRequest);
		
		int r_id = Integer.parseInt(request.getParameter("r_id"));
		
		System.out.println("if 전 11111111111111111111111");
		if (multiRequest.getOriginalFileName("file1") != null) {
			System.out.println("if 후  22222222222222222222222");
			RoomPictureDataBean picDto = new RoomPictureDataBean();
			String pic_ori = multiRequest.getOriginalFileName("file1");
			String pic_sys = multiRequest.getFilesystemName("file1");
			System.out.println("33333333333333333333333333333333333333");
			System.out.println(r_id);
			
			int countPicNum = roomDao.countPicNum(r_id);
			int pict_id = 0;
			if (countPicNum != 0) {	// 등록된 사진이 없으면 NullPointerException
				pict_id = roomDao.maxPicNum(r_id);
			} else {
				pict_id = 1;
			}
			
			System.out.println(pict_id);
			
			request.setAttribute("pic_ori", pic_ori);
			request.setAttribute("pic_sys", pic_sys);
		
			picDto.setPict_id(pict_id);
			picDto.setR_id(r_id);
			picDto.setPic_ori(pic_ori);
			picDto.setPic_sys(pic_sys);
		
			roomDao.insertPicture(picDto);
			
			System.out.println("출력 : pic_id = " + pict_id + " : r_id = " + r_id + " : pic_ori = "
					+ pic_ori + " : pic_sys = " + pic_sys);
			System.out.println("path : " + path);
		}	
		
		
	/*	
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
            try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
         
        System.out.println("id : " + multi.getParameter("id"));
        System.out.println("pw : " + multi.getParameter("pw"));
     */
		
		return new ModelAndView("adminroom/adminRoomModi");
	}
}
