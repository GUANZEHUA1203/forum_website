package com.gzeh.forum.common.redis;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.SystemConfig;
import com.gzeh.forum.util.SerializeUtils;

/**
 * @author HUANGP
 * @date 2018年1月2日
 * @des session 封装
 */

public class BaseRedisSession {

	private static Logger logger = LoggerFactory.getLogger(BaseRedisSession.class);
	
	@Autowired
	private RedisManager redisManager;
	
	
	private int sessionTimeOut=SystemConfig.SESSION_TIME_OUT;
	
	/**
	 * The Redis key prefix for the sessions 
	 */
	private static String keyPrefix = "redis_session:";

	/**
	 * save session
	 */
	public void save(String keyId,Object objValue) throws Exception{
		save(keyId, objValue, sessionTimeOut);
	}
	public void save(String keyId,Object objValue,int timeout){
		if(keyId == null || objValue == null){
			logger.error("keyId or objValue id is null");
			return;
		}
		byte[] key = getByteKey(keyId);
		byte[] value = SerializeUtils.serialize(objValue);
		this.redisManager.set(key, value,timeout);
	}

	public Object getObject(Serializable keyId) throws Exception{
		if(keyId == null){
			logger.error("keyId  is null");
			return null;
		}

		byte[] key = getByteKey(keyId);
		byte[] value =redisManager.get(key);
		return SerializeUtils.deserialize(value);
	}
	
	public <T> T get(Serializable keyId,Class<T> tClass) throws Exception{
		Object object = getObject(keyId);
		if(object == null){ return null;}
		return tClass.cast(object);
	}


	public AccountVo getSession() throws Exception{
		String token = getToken();
		return get(token + SystemConfig.LOGIN_USER,AccountVo.class);
	}

	public void setSession(AccountVo userSession) throws Exception {
		String token = getToken();
		save(token + SystemConfig.LOGIN_USER ,userSession);
	}
	
	public void delSession(){
		String token = getToken();
		delete(token + SystemConfig.LOGIN_USER);
	}
	
	
	public HttpServletRequest getHttpServletRequest(){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
	public String getToken(){
		return getHttpServletRequest().getHeader("token");
	}

	/**
	 * @author HUANGP
	 * @des delete Session
	 * @date 2018年1月2日
	 */
	public void delete(String keyId) {
		if(keyId == null){
			logger.error("sessionId id is null");
			return;
		}
		redisManager.del(this.getByteKey(keyId));
	}

	/**
	 * 获得byte[]型的key
	 * @return
	 */
	private byte[] getByteKey(Serializable keyId){
		String preKey = keyPrefix + keyId;
		return preKey.getBytes();
	}
	
	/**
	 * @author HUANGP
	 * @des HTTP参数获取
	 * @date 2018年1月2日
	 * @param request
	 * @return
	 */
	protected Map<String,Object> initAllHttpParams(HttpServletRequest request) {
		Enumeration KeyVal=request.getParameterNames();
		Map<String,Object> params=new TreeMap<String,Object>();
		while(KeyVal.hasMoreElements()){
			String key=String.valueOf(KeyVal.nextElement());
			String value=request.getParameter(key);
			if(!key.equals("sign"))
			params.put(key,value);
		}
		return params;
	}
	

}
