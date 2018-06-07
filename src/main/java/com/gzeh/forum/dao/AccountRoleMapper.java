package com.gzeh.forum.dao;

import com.gzeh.forum.bean.AccountRole;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
public interface AccountRoleMapper extends BaseMapper<AccountRole> {
	
	@Select("select ro_id as roleId from tbl_account_role where ac_id=#{acid}")
	@ResultType(Long.class)
	List<Long> getRolesIdByAcId(@Param("acid") long acid);
	
	List<AccountRole> selectbyAccountId(Long acid);
}