package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieFilter implements Filter {

	private List<String> blankurls = new ArrayList<String>();

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		System.out.println(((HttpServletRequest) request).getRequestURI());
		

		String uri = ((HttpServletRequest) request).getRequestURI();

		Cookie[] cookies = ((HttpServletRequest) request).getCookies();
		if (cookies != null) {
			
			for (Cookie ck : cookies) {
				if ("token".equals(ck.getName())) {
					
					chain.doFilter(request, response);
					return;
				}

			}
		}
		
		if (uri.indexOf("/css") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/img") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/js") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("landing") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/ops/connect") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/fonts") > 0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/ops/createuser") >0) {
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/test") > 0 ){
			chain.doFilter(request, response);
			return;
		} else if (uri.indexOf("/contacts") > 0 ){
			chain.doFilter(request, response);
			return;
		}
		((HttpServletResponse) response).sendRedirect("/WAPP/landing");

		

	}

	public void init(FilterConfig config) throws ServletException {
		this.blankurls.add("/WAPP/landing");
		this.blankurls.add("/WAPP/connect");
	}

	public void destroy() {
		// executed when the filter is unloaded
	}
}