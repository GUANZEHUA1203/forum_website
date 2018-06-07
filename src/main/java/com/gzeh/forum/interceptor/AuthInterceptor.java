package com.gzeh.forum.interceptor;

import com.gzeh.forum.base.BaseController;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;



/**
 * @author HUANGP
 * @date 2018年1月2日
 * @des 自定义拦截器  验证权限
 */
public class AuthInterceptor extends BaseController implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return validateByAnnotation(request,response,handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}  

	
	private boolean validateByAnnotation(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		ShiroFilterFactoryBean sff=new ShiroFilterFactoryBean();
		return false;
	}
	


	private void returnJson(HttpServletResponse response, String json) throws Exception{
		PrintWriter writer = null;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		try {
			writer = response.getWriter();
			writer.print(json);
		} catch (IOException e) {
			logger.error("response error",e);
		} finally {
			if (writer != null)
				writer.close();
		}
	}
   
}