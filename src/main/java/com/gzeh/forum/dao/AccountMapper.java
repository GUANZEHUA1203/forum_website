package com.gzeh.forum.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.vo.AccountVo;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface AccountMapper extends BaseMapper<Account> {
	
	List<Map<String, Object>> selectUserPage(Page<Map<String, Object>> page,Map<String, Object> param);
	
	AccountVo selectUserVoById (Long acid);

}