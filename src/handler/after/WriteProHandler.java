package handler.after;

import java.sql.Timestamp;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import after.AfterDao;
import after.AfterDataBean;
import handler.CommandHandler;

@Controller
public class WriteProHandler implements CommandHandler{
	
	@Resource
	private AfterDao afterDao;
	
	@RequestMapping( "/writePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		AfterDataBean afterDto = new AfterDataBean();
		afterDto.setM_id( request.getParameter("m_id") );
		afterDto.setAm_subject( request.getParameter( "am_subject") );
		afterDto.setAm_content( request.getParameter( "am_content") );
		afterDto.setAm_num(Integer.parseInt(request.getParameter("am_num")));
		
		afterDto.setAm_reg_date( new Timestamp( System.currentTimeMillis() ) );
	
		int result = afterDao.insertArticle( afterDto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView ("/after/writePro");
		
	}
	
	@ResponseBody
	@RequestMapping("/image")
	public String handleFileUpload(HttpServletRequest request, HttpServletResponse response/*, @RequestParam("uploadFile") MultipartFile uploadFile*/) {
	    
	
		    // 이미지 업로드할 경로
			//String uploadPath = "/LetsPension/resources/imgs/";
		
			ServletContext context = request.getSession().getServletContext();
			String uploadPath = context.getRealPath("/")+"resources\\imgs\\";

		    int size = 10 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
			
			String fileName = ""; // 파일명
			
			try{
		        // 파일업로드 및 업로드 후 파일명 가져옴
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
				Enumeration files = multi.getFileNames();
				String file = (String)files.nextElement(); 
				fileName = multi.getFilesystemName(file); 
				
			}catch(Exception e){
				e.printStackTrace();
			}
			
		    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
			uploadPath = uploadPath + fileName;
			System.out.println(uploadPath);
			/*
		    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
			JSONObject jobj = new JSONObject();
			jobj.put("url", uploadPath);
			
			response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
			System.out.print(jobj.toJSONString());
			*/
			return "./resources/imgs/"+fileName;
		
	 }
	

}
