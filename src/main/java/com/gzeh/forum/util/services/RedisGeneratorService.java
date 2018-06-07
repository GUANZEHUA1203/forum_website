package com.gzeh.forum.util.services;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

public abstract class RedisGeneratorService<K extends Serializable, V extends Serializable> {

	@Autowired
	protected RedisTemplate<K, V> txRedisTemplate;

	@Autowired
	private JedisConnectionFactory connectionFactory;
	

	public JedisConnectionFactory getConnectionFactory() {
		return connectionFactory;
	}

	public void setConnectionFactory(JedisConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;
	}

	/**
	 * 设置redisTemplate
	 * 
	 * @param
	 */
	public void setTxRedisTemplate(RedisTemplate<K, V> txRedisTemplate) {
		this.txRedisTemplate = txRedisTemplate;
	}

	/**
	 * 获取 RedisSerializer
	 */
	protected RedisSerializer<String> getRedisSerializer() {
		return txRedisTemplate.getStringSerializer();
	}

}