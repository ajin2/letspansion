package db;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import admin.AdminDBBean;
import admin.AdminDao;
import after.AfterDBBean;
import after.AfterDao;
import member.LogonDBBean;
import member.LogonDao;
import notice.NoticeDBBean;
import notice.NoticeDao;
import qna.QnaDBBean;
import qna.QnaDao;
import room.RoomDBBean;
import room.RoomDao;

@Configuration
public class CreateBean {

	@Bean
	public AdminDao adminDao() {
		return new AdminDBBean();
	}
	
	@Bean 
	public LogonDao logonDao() {
		return new LogonDBBean();
	}	
	
	@Bean
	public RoomDao roomDao() {
		return new RoomDBBean();
	}

	@Bean
	public AfterDao afterDao() {
		return new AfterDBBean();
	}
	
	@Bean
	public NoticeDao noticeDao() {
		return new NoticeDBBean();
	}
	
	@Bean
	public QnaDao qnaDao() {
		return new QnaDBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		
		return viewResolver;
	}
}
