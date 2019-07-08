package project.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
public class EncodingFilter implements Filter {

    String encoding = "UTF-8";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
    
	@Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        // 한글 인코딩
        req.setCharacterEncoding(encoding);
        chain.doFilter(req, resp);
    }

	@Override
	public void destroy() {
		
	}
}
