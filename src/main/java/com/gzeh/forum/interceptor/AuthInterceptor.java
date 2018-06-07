package com.gzeh.forum.interceptor;

import com.alibaba.fastjson.JSON;
import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.common.annontation.AuthPermissions;
import com.gzeh.forum.shiro.ShiroUser;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;



/**
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
		if(handler instanceof HandlerMethod){
			HandlerMethod handlerMethod=(HandlerMethod)handler;
			AuthPermissions methodAnnotation = handlerMethod.getMethodAnnotation(AuthPermissions.class);
			
			if(methodAnnotation.annotationType().equals("anon")){
				return true;
			}
			
			if(methodAnnotation.annotationType().equals("session")){
				Subject subject = SecurityUtils.getSubject();
				if(subject==null){
					returnJson(response, JSON.toJSONString(renderError("对不起,请先登录")));
					return false;
				}
				return true;
			}
			
			if(methodAnnotation.annotationType().equals("sessionAndAuthc")){
				ShiroUser principal = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
				String requestURL = String.valueOf(request.getRequestURL());
				List<String> urlSet = principal.getUrlSet();
				for (String string : urlSet) {
					if(requestURL.equals(string)){
						return true;
					}
				}
				returnJson(response, JSON.toJSONString(renderError("对不起,你没有权限访问")));
				return false;
			}
		}
		
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