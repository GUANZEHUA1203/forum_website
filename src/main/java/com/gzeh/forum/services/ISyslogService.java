package com.gzeh.forum.services;

import com.gzeh.forum.bean.Syslog;
import com.gzeh.forum.common.result.PageInfo;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface ISyslogService extends IService<Syslog> {
	
	PageInfo getSyslogByPage(PageInfo pageinfo);
	
}
