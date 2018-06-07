package com.gzeh.forum.services;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.gzeh.forum.bean.Aticle;
import com.gzeh.forum.common.result.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface IAticleService extends IService<Aticle> {
	
	/**
	 * @param param
	 * 列表信息
	 * @return
	 */
	public PageInfo pageInfoList(PageInfo  pageinfo);
	
	
}
