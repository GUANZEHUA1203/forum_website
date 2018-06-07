package com.gzeh.forum.common.redis;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

/**
 * @author HUANGP
 * @date 2017年12月27日
 * @des
 * @param <K>
 * @param <V>
 */
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