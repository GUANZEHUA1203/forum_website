package com.gzeh.forum.common.redis;

import java.util.Set;

import com.gzeh.forum.util.services.RedisGeneratorService;

import redis.clients.jedis.Jedis;

public class RedisManager extends RedisGeneratorService<String,String> {

	public RedisManager(){}
	
	/**
	 * 初始化方法
	 */
	public Jedis initJedis(){
		return getConnectionFactory().getShardInfo().createResource();
	}
	
	/**
	 * get value from redis
	 * @param key
	 * @return
	 */
	public byte[] get(byte[] key){
		byte[] value = null;
		Jedis jedis = initJedis();
		
			value = jedis.get(key);
		
		return value;
	}
	
	/**
	 * set 
	 * @param key
	 * @param value
	 * @return
	 */
	public byte[] set(byte[] key,byte[] value){
		Jedis jedis = initJedis();
		
			jedis.set(key,value);
			jedis.expire(key,1000*60*30);
		
		return value;
	}
	
	/**
	 * set 
	 * @param key
	 * @param value
	 * @param expire
	 * @return
	 */
	public byte[] set(byte[] key,byte[] value,int expire){
		Jedis jedis = initJedis();
		
			jedis.set(key,value);
			if(expire != 0){
				jedis.expire(key, expire);
		 	}
		
		return value;
	}
	
	/**
	 * del
	 * @param key
	 */
	public void del(byte[] key){
		Jedis jedis = initJedis();
		
			jedis.del(key);
		
	}
	
	/**
	 * flush
	 */
	public void flushDB(){
		Jedis jedis = initJedis();
			jedis.flushDB();
	}
	
	/**
	 * size
	 */
	public Long dbSize(){
		Long dbSize = 0L;
		Jedis jedis = initJedis();
			dbSize = jedis.dbSize();
		return dbSize;
	}

	/**
	 * keys
	 * @param regex
	 * @return
	 */
	public Set<byte[]> keys(String pattern){
		Set<byte[]> keys = null;
		Jedis jedis = initJedis();
			keys = jedis.keys(pattern.getBytes());
		return keys;
	}
	
}
