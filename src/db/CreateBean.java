package db;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import member.LogonDBBean;
import member.LogonDao;
import room.RoomDBBean;
import room.RoomDao;

@Configuration
public class CreateBean {

	@Bean 
	public LogonDao logonDao() {
		return new LogonDBBean();
	}	
	
	@Bean
	public RoomDao roomDao() {
		return new RoomDBBean();
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
