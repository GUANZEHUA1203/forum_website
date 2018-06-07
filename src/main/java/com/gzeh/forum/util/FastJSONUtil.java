package com.gzeh.forum.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;



/**
 * @author huangping
 * @date 2016-6-8 上午10:59:49
 * @desc json工具包
 */
public class FastJSONUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(FastJSONUtil.class);

	/**
	 * @desc 根据Key解析出json值
	 * @param key
	 * @param json
	 * @return
	 * @author huangping
	 * @date 2016-6-8 上午11:03:51
	 */
	public static String parseJsonByKey(String key, String json) {
		if (StringUtils.isEmpty(key) || StringUtils.isEmpty(json)) {
			logger.error("key is null or json String is null");
			return "";
		} else {
			JSONObject object = JSON.parseObject(json);
			return String.valueOf(object.get(key));
		}
	}

	/**
	 * @desc object to json
	 * @param object
	 * @return
	 * @author huangping
	 * @date 2016-6-8 上午11:05:38
	 */
	public static String object2json(Object object) {
		if (null==object) {
			logger.error("json object is null ");
			return "";
		} else {
			return JSON.toJSONString(object);
		}
	}

	/**
	 * @desc JSONArray 转换成 List
	 * @param array
	 * @return
	 * @author huangping
	 * @date 2016-6-14 上午9:24:35
	 */
	public static List<Object> parseJsonArray2List(String array) {
		if (StringUtils.isEmpty(array)) {
			return null;
		} else {
			JSONArray jsonArray = JSON.parseArray(array);
			List<Object> objs = new ArrayList<Object>();
			for (int i = 0; i < jsonArray.size(); i++) {
				objs.add(jsonArray.get(i));
			}
			return objs;
		}
	}

	/**
	 * @desc
	 * @param array
	 *            JSONArray
	 * @param index
	 *            下标
	 * @return
	 * @author huangping
	 * @date 2016-6-14 上午9:27:00
	 */
	public static String getJSONFromJSONArray(String array, int index) {
		JSONArray jsonArray = JSON.parseArray(array);
		return String.valueOf(jsonArray.get(index));
	}

	/**
	 * @desc json数组中获取唯一key的value
	 * @param key
	 *            唯一key
	 * @param json
	 *            json数组
	 * @return
	 * @author huangping
	 * @date 2016-6-14 上午9:34:04
	 */
	public static String getValByUniqueKey(String key, String jsonArray) {
		List<Object> objs = parseJsonArray2List(jsonArray);
		String val = "";
		for (Object obj : objs) {
			val = parseJsonByKey(key, String.valueOf(obj));
			if (StringUtil.isNotBlock(val) && !val.equals("null")
					&& !val.equals(""))
				break;
		}
		return val;
	}

	/**
	 * @desc json转换成map
	 * @param json
	 * @return
	 * @author huangping
	 * @date 2016-6-14 上午9:43:18
	 */
	public static Map<String, Object> parsejson2Map(String json) {
		if(StringUtils.isEmpty(json)){
		return null;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		JSONObject jsonObject = JSON.parseObject(json);
		for (String key : jsonObject.keySet()) {
			map.put(key, jsonObject.get(key));
		}
		return map;
	}
	
	/**
	 * @author HUANGP
	 * @des json to 实体
	 * @date 2018年3月16日
	 * @param json
	 * @param typeReference
	 * @return
	 */
	public static Object parseJsonToBean(String json,TypeReference typeReference){
		return JSON.parseObject(json,typeReference);
	}
	
}