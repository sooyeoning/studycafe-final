package project.studycafe;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/mypage/**")
				//.addResourceLocations("file:///C:/image_repo/");
				.addResourceLocations("file:///app/was/apache-tomcat-9.0.87/webapps/upload/");
	}
	
	@Override
    public void addCorsMappings(CorsRegistry registry){
        registry.addMapping("/**")
                .allowedOrigins(
                		"http://localhost:8080",
                		"http://3.37.73.88:8080"
                )
                .allowedMethods("GET", "POST", "PUT", "DELETE", "PATCH")
        ;

    }

	
}
