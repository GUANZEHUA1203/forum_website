package com.gzeh.forum.services.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.gzeh.forum.bean.Syslog;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.dao.SyslogMapper;
import com.gzeh.forum.services.ISyslogService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Service
public class SyslogServiceImpl extends ServiceImpl<SyslogMapper, Syslog> implements ISyslogService {

	@Autowired
	SyslogMapper syslogMapper;
	
	@Override
	public PageInfo getSyslogByPage(PageInfo pageinfo) {
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageinfo.getNowpage(), pageinfo.getSize());
        page.setOrderByField(pageinfo.getSort());
        page.setAsc(pageinfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = this.syslogMapper.selectSyslogByPage( page,pageinfo.getCondition());
        pageinfo.setRows(list);
        pageinfo.setTotal(page.getTotal());
		return pageinfo;
	}
	
}
