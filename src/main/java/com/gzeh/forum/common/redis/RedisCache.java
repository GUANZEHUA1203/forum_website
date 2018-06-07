package com.gzeh.forum.common.redis;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.locks.ReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.apache.ibatis.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import com.gzeh.forum.util.SerializeUtils;

/**
 * @author HUANGP
 * @date 2018年1月2日
 * @des redis 缓存封装
 */
public class RedisCache implements Cache {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
		

	private RedisManager cache;
	
	
	private String keyPrefix = "redis_session:";
	
	public String getKeyPrefix() {
		return keyPrefix;
	}

	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}
	
	/**
	 * 通过一个JedisManager实例构造RedisCache
	 */
	public RedisCache(RedisManager cache){
		 if (cache == null) {
	         throw new IllegalArgumentException("Cache argument cannot be null.");
	     }
	     this.cache = cache;
	}
	
	/**
	 * Constructs a cache instance with the specified
	 * Redis manager and using a custom key prefix.
	 * @param cache The cache manager instance
	 * @param prefix The Redis key prefix
	 */
	public RedisCache(RedisManager cache, 
				String prefix){
		 
		this( cache );
		
		// set the prefix
		this.keyPrefix = prefix;
	}
	
	/**
	 * 获得byte[]型的key
	 * @param key
	 * @return
	 */
	private byte[] getByteKey(Object key){
		if(key instanceof String){
			String preKey = this.keyPrefix + key;
    		return preKey.getBytes();
    	}else{
    		return SerializeUtils.serialize(key);
    	}
	}
 	
	
	public Object getObject(Object key) throws CacheException {
		logger.debug("根据key从Redis中获取对象 key [" + key + "]");
		try {
			if (key == null) {
	            return null;
	        }else{
	        	byte[] rawValue = cache.get(getByteKey(key));
	        	
	        	Object value = (Object)SerializeUtils.deserialize(rawValue);
	        	return value;
	        }
		} catch (Throwable t) {
			throw new CacheException(t);
		}

	}


	public <T> T getObject(Object key,Class<T> clazz) throws CacheException {
		return clazz.cast(getObject(key));
	}

	
	public void putObject(Object key, Object value) throws CacheException {
		logger.debug("根据key从存储 key [" + key + "]");
		 try {
			 	cache.set(getByteKey(key), SerializeUtils.serialize(value));
	        } catch (Throwable t) {
	            throw new CacheException(t);
	        }
	}

	
	public Object removeObject(Object key) throws CacheException {
		logger.debug("从redis中删除 key [" + key + "]");
		try {
			Object previous = getObject(key);
            cache.del(getByteKey(key));
            return previous;
        } catch (Throwable t) {
            throw new CacheException(t);
        }
	}

	
	public void clear() throws CacheException {
		logger.debug("从redis中删除所有元素");
		try {
            cache.flushDB();
        } catch (Throwable t) {
            throw new CacheException(t);
        }
	}

	
	public int size() {
		try {
			Long longSize = new Long(cache.dbSize());
            return longSize.intValue();
        } catch (Throwable t) {
            throw new CacheException(t);
        }
	}

	public Set<Object> keys() {
		try {
            Set<byte[]> keys = cache.keys(this.keyPrefix + "*");
            if (CollectionUtils.isEmpty(keys)) {
            	return Collections.emptySet();
            }else{
            	Set<Object> newKeys = new HashSet<Object>();
            	for(byte[] key:keys){
            		newKeys.add((Object)key);
            	}
            	return newKeys;
            }
        } catch (Throwable t) {
            throw new CacheException(t);
        }
	}

	
	public Collection<Object> values() {
		try {
            Set<byte[]> keys = cache.keys(this.keyPrefix + "*");
            if (!CollectionUtils.isEmpty(keys)) {
                List<Object> values = new ArrayList<Object>(keys.size());
                for (byte[] key : keys) {
                    Object value = getObject((Object)key);
                    if (value != null) {
                        values.add(value);
                    }
                }
                return Collections.unmodifiableList(values);
            } else {
                return Collections.emptyList();
            }
        } catch (Throwable t) {
            throw new CacheException(t);
        }
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSize() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReadWriteLock getReadWriteLock() {
		// TODO Auto-generated method stub
		return null;
	}

}
