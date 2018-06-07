package com.gzeh.forum.scan;

import java.lang.annotation.Annotation;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.base.annotation.AnnAuthType;
import com.gzeh.forum.base.annotation.AuthPermissions;
import com.gzeh.forum.shiro.ShiroUser;

/**
 * @author Administrator
 *权限拦截器
 */
public class PermissionInterceptor extends BaseController implements HandlerInterceptor {

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
			HandlerMethod handlerMethod = (HandlerMethod)handler;
			AuthPermissions methodAnnotation = handlerMethod.getMethodAnnotation(AuthPermissions.class);
			if(methodAnnotation==null){
				methodAnnotation = handlerMethod.getBeanType().getAnnotation(AuthPermissions.class);
			}
			AnnAuthType authType = null;
			if(methodAnnotation ==null){
				new AuthPermissions() {
					@Override
					public Class<? extends Annotation> annotationType() {
						return AuthPermissions.class;
					}
					
					@Override
					public AnnAuthType authName() {
						return AnnAuthType.anon;
					}
				};
			}else{
				authType = methodAnnotation.authName();
			}
			if(AnnAuthType.user.equals(authType)){
			 return getLonginedUserPermission(request, response);
			}
			if(AnnAuthType.anon.equals(authType)){
				 return true;
			}else{
				return false;
			}
		}
		return false;
	}
	
	private boolean getLonginedUserPermission(HttpServletRequest request, HttpServletResponse response){
		ShiroUser shiroUser = getShiroUser();
		List<String> urlSet = shiroUser.getUrlSet();
		logger.debug("当前用户权限"+urlSet);
		String httpUrl=String.valueOf(request.getRequestURL());
		for (String string : urlSet) {
			if(httpUrl.contains(string)){
				return true;
			}
		}
		return false;
		
	}

}
