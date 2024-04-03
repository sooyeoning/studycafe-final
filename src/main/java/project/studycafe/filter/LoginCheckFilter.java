package project.studycafe.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@WebFilter(urlPatterns = {
		"/ticket/*", "/reserve/*", "/myseat/*", "/return/*", "/mypage/*",
		"/logout/*", "/web/mypage/*", "/getPlaceName"})
@Slf4j
public class LoginCheckFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		log.info("---------------filter------------");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("id")==null) {
			res.sendRedirect("/login");
			return;
		}
		
		chain.doFilter(request, response);
	}

}
