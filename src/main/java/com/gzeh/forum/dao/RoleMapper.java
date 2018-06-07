package com.gzeh.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.gzeh.forum.bean.Permisson;
import com.gzeh.forum.bean.Role;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
public interface RoleMapper extends BaseMapper<Role> {
    List<Long> selectPermissionListByRoleId(@Param("id") Long id);

    List<Permisson> selectPermissionListByRoleIdList(@Param("list") List<Long> list);
    
    List<Role> selectRolesByAcid(@Param("acid") Long acid);
    
    List<Map<String, Object>> selectRolePage(Page<Map<String, Object>> page,Map<String, Object> param);

}