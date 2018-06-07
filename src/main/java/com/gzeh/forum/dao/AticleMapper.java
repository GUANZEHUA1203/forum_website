package com.gzeh.forum.dao;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.gzeh.forum.bean.Aticle;

import net.coderbee.mybatis.batch.BatchParameter;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface AticleMapper extends BaseMapper<Aticle> {
	
	List<Map<String, Object>> pageInfoAticle(Page<Map<String, Object>> pageinfo,Map<String, Object> param);
	
}