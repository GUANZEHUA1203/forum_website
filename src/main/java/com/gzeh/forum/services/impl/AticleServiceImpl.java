package com.gzeh.forum.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.gzeh.forum.bean.Aticle;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.dao.AticleMapper;
import com.gzeh.forum.dao.LevelMapper;
import com.gzeh.forum.services.IAticleService;
import com.gzeh.forum.util.BeanUtils;
import com.gzeh.forum.util.StringUtil;

import net.coderbee.mybatis.batch.BatchParameter;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Service
public class AticleServiceImpl extends ServiceImpl<AticleMapper, Aticle> implements IAticleService {
	
	@Autowired
	AticleMapper am;
	@Autowired
	LevelMapper lm;

	@Override
	public PageInfo pageInfoList(PageInfo  pageinfo) {
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageinfo.getNowpage(), pageinfo.getSize());
        page.setOrderByField(pageinfo.getSort());
        page.setAsc(pageinfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = am.pageInfoAticle(page, pageinfo.getCondition());
        //获取等级信息
        for (Map<String, Object> map : list) {
			if(map.containsKey("level")){
				map.put("levelInfo", lm.getLevelByAccountId(StringUtil.getLong(map.get("level"))));
			}
		}
        pageinfo.setRows(list);
        pageinfo.setTotal(page.getTotal());
		return pageinfo;
	}

	
	
	
}
