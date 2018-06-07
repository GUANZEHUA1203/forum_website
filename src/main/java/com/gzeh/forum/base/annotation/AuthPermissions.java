package com.gzeh.forum.base.annotation;
import java.lang.annotation.Documented;  
import java.lang.annotation.ElementType;  
import java.lang.annotation.Retention;  
import java.lang.annotation.RetentionPolicy;  
import java.lang.annotation.Target;  
  
import org.springframework.web.bind.annotation.Mapping;  
  
@Target({ElementType.METHOD,ElementType.TYPE})  
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
@Mapping  
public @interface AuthPermissions {
  
    /** 
     * 权限
     * @return 
     */  
	AnnAuthType authName() default AnnAuthType.user;
	
}  