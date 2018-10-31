package kjsori;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

/**
 * Servlet Filter implementation class CommonFilter
 */
//@WebFilter("/api/*")
public class CommonFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CommonFilter() {}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String contentType = request.getContentType();
		System.out.println("do Filter out");
		if("application/json".equals(contentType)) {
			String body = getBody((HttpServletRequest) request);
			JSONObject json = new JSONObject(body);
			request.setAttribute("json", json);
			System.out.println("do Filter in");
		}
		response.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
    private String getBody(HttpServletRequest request) throws IOException {
    	BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream()));
		StringBuilder builder = new StringBuilder();
		String buffer;
		while ((buffer = input.readLine()) != null) {
			System.out.println(buffer);
			if (builder.length() > 0) {
				builder.append("\n");
			}
			builder.append(buffer);
		}
		return URLDecoder.decode(builder.toString(), "UTF-8");
    }

}
