package com.gzeh.forum.dao;

import com.gzeh.forum.bean.Level;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-25
 */
public interface LevelMapper extends BaseMapper<Level> {
	
	Level getLevelByAccountId(Long id);

}