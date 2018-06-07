package com.gzeh.forum.dao;

import com.gzeh.forum.bean.Syslog;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface SyslogMapper extends BaseMapper<Syslog> {
	
	List<Map<String, Object>> selectSyslogByPage(Page<Map<String, Object>> page,Map<String, Object> param);

}